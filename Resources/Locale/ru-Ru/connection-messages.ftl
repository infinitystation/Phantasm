whitelist-not-whitelisted = Вас нет в вайтлисте.

# proper handling for having a min/max or not
whitelist-playercount-invalid = { $min ->
    [0] Вайтлист для этого сервера применяется только для числа игроков ниже { $max }.
    *[other] Вайтлист для этого сервера применяется только для числа игроков выше { $min } { $max ->
        [2147483647] -> . Возможно вы сможете присоединиться позже.
       *[other] -> и ниже { $max } игроков. Возможно, вы сможете присоединиться позже.
    }
}
whitelist-not-whitelisted-rp = Вас нет в вайтлисте. Чтобы попасть в вайтлист, посетите наш Discord.

command-whitelistadd-description = Добавляет игрока в вайтлист
command-whitelistadd-help = whitelistadd <username>
command-whitelistadd-existing = { $username } уже в вайтлисте!
command-whitelistadd-added = { $username } добавлен в вайтлист
command-whitelistadd-not-found = Невозможно найти '{ $username }'

command-whitelistremove-description = Убирает игрока из вайтлиста
command-whitelistremove-help = whitelistremove <username>
command-whitelistremove-existing = { $username } и так нет в вайтлисте!
command-whitelistremove-removed = { $username } убран из вайтлиста
command-whitelistremove-not-found = Невозможно найти '{ $username }'

command-kicknonwhitelisted-description = Кикает всех игроков, который нет в вайтлисте
command-kicknonwhitelisted-help = kicknonwhitelisted

ban-banned-permanent = Этот бан можно только обжаловать.
ban-expires = Вы получили бан на { $duration } минут. Он истечёт { $time } UTC. (МСК: +3 часа)
ban-banned-1 = Вам, или другому пользователю этого компьютера или соединения, не получится стать участником событий игры.
ban-banned-2 = Причина бана: "{ $reason }"

soft-player-cap-full = Сервер заполнен!
panic-bunker-account-denied = Сервер в режиме Бункера. Новые подключения в этом режиме не принимаются. Повторите попытку позже.
panic-bunker-account-denied-reason = Сервер в режиме Бункера, вам было отказано в доступе. Причина: "{ $reason }"
panic-bunker-account-reason-account = Ваш аккаунт должен быть старше { $minutes } минут
panic-bunker-account-reason-overall = Необходимо минимальное отыгранное время - {$hours} { $hours ->
    [one] час
    [few] часа
    *[other] часов
}.
