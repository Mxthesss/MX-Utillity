name         'MX-Utillity'
author       'Mxthess'
version      '1.0'

fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'

shared_script 'mx_config.lua'

client_scripts {
    'client/*.lua',
}

ui_page 'web/index.html'
files {
	'web/*',
	'web/js/*',
	'web/css/*',
}

escrow_ignore {
    'mx_config.lua',
}
