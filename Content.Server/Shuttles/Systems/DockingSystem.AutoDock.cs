using Content.Server.Shuttles.Components;
using Content.Shared.Shuttles.Components;
using Content.Shared.Shuttles.Events;
using Robust.Shared.Physics.Components;
using Robust.Shared.Players;
using Robust.Shared.Utility;

namespace Content.Server.Shuttles.Systems;

public sealed partial class DockingSystem
{
    private void UpdateAutodock()
    {
        // Work out what we can autodock with, what we shouldn't, and when we should stop tracking.
        // Autodocking only stops when the client closes that dock viewport OR they lose pilotcomponent.
        var dockingQuery = GetEntityQuery<DockingComponent>();
        var xformQuery = GetEntityQuery<TransformComponent>();
        var recentQuery = GetEntityQuery<RecentlyDockedComponent>();
        var query = EntityQueryEnumerator<AutoDockComponent, PhysicsComponent>();

        while (query.MoveNext(out var dockUid, out var comp, out var body))
        {
            if (comp.Requesters.Count == 0 || !dockingQuery.TryGetComponent(dockUid, out var dock))
            {
                RemComp<AutoDockComponent>(dockUid);
                continue;
            }

            // Don't re-dock if we're already docked or recently were.
            if (dock.Docked || recentQuery.HasComponent(dockUid))
                continue;

            var dockable = GetDockable(body, xformQuery.GetComponent(dockUid));

            if (dockable == null) continue;

            TryDock(dockUid, dock, dockable.Owner, dockable);
        }

        // Work out recent docks that have gone past their designated threshold.
        var checkedRecent = new HashSet<EntityUid>();

        foreach (var (comp, xform) in EntityQuery<RecentlyDockedComponent, TransformComponent>())
        {
            if (!checkedRecent.Add(comp.Owner)) continue;

            if (!dockingQuery.TryGetComponent(comp.Owner, out var dock))
            {
                RemComp<RecentlyDockedComponent>(comp.Owner);
                continue;
            }

            if (!xformQuery.TryGetComponent(comp.LastDocked, out var otherXform))
            {
                RemComp<RecentlyDockedComponent>(comp.Owner);
                continue;
            }

            var worldPos = _transformSystem.GetWorldPosition(xform, xformQuery);
            var otherWorldPos = _transformSystem.GetWorldPosition(otherXform, xformQuery);

            if ((worldPos - otherWorldPos).Length < comp.Radius) continue;

            _sawmill.Debug($"Removed RecentlyDocked from {ToPrettyString(comp.Owner)} and {ToPrettyString(comp.LastDocked)}");
            RemComp<RecentlyDockedComponent>(comp.Owner);
            RemComp<RecentlyDockedComponent>(comp.LastDocked);
        }
    }

    private void OnRequestUndock(EntityUid uid, ShuttleConsoleComponent component, UndockRequestMessage args)
    {
        _sawmill.Debug($"Received undock request for {ToPrettyString(args.DockEntity)}");

        // TODO: Validation
        if (!TryComp<DockingComponent>(args.DockEntity, out var dock) ||
            !dock.Docked ||
            HasComp<PreventPilotComponent>(Transform(uid).GridUid))
        {
            return;
        }

        Undock(dock);
    }

    private void OnRequestAutodock(EntityUid uid, ShuttleConsoleComponent component, AutodockRequestMessage args)
    {
        _sawmill.Debug($"Received autodock request for {ToPrettyString(args.DockEntity)}");
        var player = args.Session.AttachedEntity;

        if (player == null ||
            !HasComp<DockingComponent>(args.DockEntity) ||
            HasComp<PreventPilotComponent>(Transform(uid).GridUid))
        {
            return;
        }

        // TODO: Validation
        var comp = EnsureComp<AutoDockComponent>(args.DockEntity);
        comp.Requesters.Add(player.Value);
    }

    private void OnRequestStopAutodock(EntityUid uid, ShuttleConsoleComponent component, StopAutodockRequestMessage args)
    {
        _sawmill.Debug($"Received stop autodock request for {ToPrettyString(args.DockEntity)}");

        var player = args.Session.AttachedEntity;

        // TODO: Validation
        if (player == null || !TryComp<AutoDockComponent>(args.DockEntity, out var comp)) return;

        comp.Requesters.Remove(player.Value);

        if (comp.Requesters.Count == 0)
            RemComp<AutoDockComponent>(args.DockEntity);
    }
}
