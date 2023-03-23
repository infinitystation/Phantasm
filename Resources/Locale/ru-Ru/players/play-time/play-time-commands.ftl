parse-minutes-fail = Невозможно обработать '{$minutes}' как минуты
parse-session-fail = Сессия игрока '{$username}' не найдена

## Role Timer Commands

# - playtime_addoverall
cmd-playtime_addoverall-desc = Добавляет минуты к общему времени игры игрока
cmd-playtime_addoverall-help = Использование: {$command} <имя игрока> <минуты>
cmd-playtime_addoverall-succeed = Общее время игры игрока {$username} увеличено до {TOSTRING($time, "dddd\\:hh\\:mm")}
cmd-playtime_addoverall-arg-user = <имя игрока>
cmd-playtime_addoverall-arg-minutes = <минуты>
cmd-playtime_addoverall-error-args = Команда должна была получить два аргумента

# - playtime_addrole
cmd-playtime_addrole-desc = Добавляет минуты к времени игры игрока на определённой роли
cmd-playtime_addrole-help = Использование: {$command} <имя игрока> <роль> <минуты>
cmd-playtime_addrole-succeed = Увеличено время игры игрока {$username} / на роли \'{$role}\' до {TOSTRING($time, "dddd\\:hh\\:mm")}
cmd-playtime_addrole-arg-user = <имя игрока>
cmd-playtime_addrole-arg-role = <роль>
cmd-playtime_addrole-arg-minutes = <минуты>
cmd-playtime_addrole-error-args = Команда должна была получить три аргумента

# - playtime_getoverall
cmd-playtime_getoverall-desc = Показывает общее время игры игрока
cmd-playtime_getoverall-help = Использование: {$command} <имя игрока>
cmd-playtime_getoverall-success = Общее время игры {$username} - {TOSTRING($time, "dddd\\:hh\\:mm")}.
cmd-playtime_getoverall-arg-user = <имя игрока>
cmd-playtime_getoverall-error-args = Команда должна была получить один агрумент

# - GetRoleTimer
cmd-playtime_getrole-desc = Показывает время игры игрока на всех или одной роли
cmd-playtime_getrole-help = Использование: {$command} <имя игрока> [роль]
cmd-playtime_getrole-no = У игрока ни единого таймера на какой-либо роли
cmd-playtime_getrole-role = Роль: {$role}, Время игры: {$time}
cmd-playtime_getrole-overall = Общее время игры: {$time}
cmd-playtime_getrole-succeed = Общее время игры для игрока {$username} - {TOSTRING($time, "dddd\\:hh\\:mm")}.
cmd-playtime_getrole-arg-user = <имя игрока>
cmd-playtime_getrole-arg-role = <ролль|'Overall'>
cmd-playtime_getrole-error-args =  Команда должна была получить один или два агрумента

# - playtime_save
cmd-playtime_save-desc = Сохраняет время игры игрока в базе данных
cmd-playtime_save-help = Использование: {$command} <имя игрока>
cmd-playtime_save-succeed = Время игры игрока {$username} успешно сохранено
cmd-playtime_save-arg-user = <имя игрока>
cmd-playtime_save-error-args = Команда должна была получить один агрумент

## 'playtime_flush' command'

cmd-playtime_flush-desc = Записывает показатели активных трекеров в хранилище трекера игрового времени.
cmd-playtime_flush-help = Использование: {$command} [имя игрока]
    Данная команда вызывает запись только во внутреннее хранилище трекера, не записывая в Базу Данных.
    Если указан игрок - команда обработает только его.
cmd-playtime_flush-error-args = Команда должна была получить ноль или один агрумент
cmd-playtime_flush-arg-user = [имя игрока]
