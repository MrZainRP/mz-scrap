fx_version 'cerulean'
game 'gta5'

description 'A self-contained, progression based scrapping resource for qb-core. Configured to function with or without mz-skill XP integration'
author 'Mr_Zain#4139'
version '1.2.0'
lua54 'yes'

shared_scripts {
	'@qb-core/shared/locale.lua',
	'config.lua',
	'locales/en.lua',
}

client_script 'client/main.lua'

server_script 'server/main.lua'

