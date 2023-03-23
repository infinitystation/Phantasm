### Localization for role ban command

cmd-roleban-desc = Выдаёт бан роли для указанного игрока
cmd-roleban-help = Использование: roleban <Имя или ID пользователя> <Роль> <Причина> [Срок в минутах, значение 0 заблокирует роль навсегда]

## Completion result hints
cmd-roleban-hint-1 = <Имя или ID пользователя>
cmd-roleban-hint-2 = <Роль>
cmd-roleban-hint-3 = <Причина>
cmd-roleban-hint-4 = [Срок в минутах, значение 0 заблокирует роль навсегда]

cmd-roleban-hint-duration-1 = Навсегда
cmd-roleban-hint-duration-2 = 1 день
cmd-roleban-hint-duration-3 = 3 дня
cmd-roleban-hint-duration-4 = 1 неделя
cmd-roleban-hint-duration-5 = 2 недели
cmd-roleban-hint-duration-6 = 1 месяц


### Localization for role unban command

cmd-roleunban-desc = Снимает с игрока бан на роль
cmd-roleunban-help = Использование: roleunban <id бана на роль>

## Completion result hints
cmd-roleunban-hint-1 = <id бана на роль>


### Localization for roleban list command

cmd-rolebanlist-desc = Список банов ролей игрока
cmd-rolebanlist-help = Использование: <Имя или ID пользователя> [Включать снятые]

## Completion result hints
cmd-rolebanlist-hint-1 = <Имя или ID пользователя>
cmd-rolebanlist-hint-2 = [Включать снятые]


cmd-roleban-minutes-parse = {$time} - неподходящее количество минут для бана.\n{$help}
cmd-roleban-arg-count = Некорретное количество аргументов
cmd-roleban-job-parse = {$job} - Такая роль не существует.
cmd-roleban-name-parse = Невозможно найти игрока с таким именем.
cmd-roleban-existing = Игрок {$target} уже имеет бан для следующей роли: {$role}.
cmd-roleban-success = {$target} получил блокировку роли {$role} с причиной: {$reason} {$length}.

cmd-roleban-inf = Навсегда
cmd-roleban-until =  до {$expires}

# Department bans
cmd-departmentban-desc = Выдаёт игроку бан на роли отдела
cmd-departmentban-help = Использование: departmentban <Имя или ID пользователя> <Отдел> <Причина> [Срок в минутах, значение 0 заблокирует роль навсегда]
