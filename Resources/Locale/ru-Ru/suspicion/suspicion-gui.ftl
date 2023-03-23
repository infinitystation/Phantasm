## SuspicionGui.xaml.cs

# Shown when clicking your Role Button in Suspicion
suspicion-ally-count-display = { $allyCount ->
    *[zero] У тебя нет союзников
    [one] Твой союзник: { $allyNames }
    [other] Твои союзники: { $allyNames }
}
