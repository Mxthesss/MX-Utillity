name         'deadyen_winbreak'
author       'deadyen.com - totsu ¥'
version      '1.0'

fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'

shared_script 'config.lua'

client_scripts {
    'client/main.lua',
}

escrow_ignore {
    'config.lua',
    'client/main.lua',
}