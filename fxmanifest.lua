name         'MX-Utillity'
author       'Mxthess'
version      '1.0'

fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'

shared_script 'config.lua'

client_scripts {
    'client/window.lua',
    'client/finger.lua',
    'client/handsup.lua',
    'client/holster.lua',
    'client/optimize.lua',
}

escrow_ignore {
    'mx_config.lua',
    'client/window.lua',
    'client/finger.lua',
    'client/handsup.lua',
    'client/holster.lua',
    'client/optimize.lua',
}
