# Shown when greeted with the Suspicion role
suspicion-role-greeting = Ты {$roleName}!

# Shown when greeted with the Suspicion role
suspicion-objective = Цель: {$objectiveText}

# Shown when greeted with the Suspicion role
suspicion-partners-in-crime = { $partnersCount ->
    [zero] Ты сам по себе. Удачи!
    [one] Твой партнер: { $partnerNames }.
    *[other] Твои партнеры: { $partnerNames }.
}
