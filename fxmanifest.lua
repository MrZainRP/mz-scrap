fx_version 'cerulean'

game 'gta5'

lua54 'yes'

author 'Mr_Zain - https://dsc.gg/mzresources'

description 'mz-scrap - a progression based scrapping resource for qb-core (with or without mz-skill XP integration)'

version '1.5.2'

shared_scripts {
	'@qb-core/shared/locale.lua',
	'config.lua',
	'locales/en.lua',
    '@ox_lib/init.lua',
}

client_script 'client/main.lua'

server_script 'server/main.lua'

