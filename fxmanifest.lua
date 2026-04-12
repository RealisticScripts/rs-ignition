fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Realistic Scripts'
name 'rs-ignition'
description 'A realistic vehicle ignition can leave vehicle running or shut it off upon exiting vehicle.'
version 'v1.0.0'
repository 'https://github.com/RealisticScripts/rs-ignition'
license 'MIT'

shared_scripts {
    'config.lua'
}

server_script {
    'server.lua'
}

client_script {
    'client.lua'
}
