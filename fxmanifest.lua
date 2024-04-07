fx_version 'cerulean'

game 'gta5'

lua54 'yes'

author 'Mr_Zain - https://discord.gg/CqNYvE3CkA'

description 'mz-scrap - a progression based scrapping resource for qb-core (with or without mz-skill XP integration)'

version '1.5.1'

shared_scripts {
	'@qb-core/shared/locale.lua',
	'config.lua',
	'locales/en.lua',
    '@ox_lib/init.lua',
}

client_script 'client/main.lua'

server_script 'server/main.lua'

