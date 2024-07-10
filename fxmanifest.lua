fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Sam'
description 'Treasure Digging Script | By Sam Scripts'
version '1.2.0'

shared_scripts {
    'config.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua'
}

client_script 'client/main.lua'
server_script 'server/main.lua'
