fx_version "cerulean"
lua54 'yes'
game "gta5"

version '1.0.2'

ui_page 'web/build/index.html'

shared_scripts {
  'init.lua'
}

client_script "client/**/*"

server_scripts {
  'server/bridge.lua',
  "server/data.lua",
  "server/server.lua"
}

files {
  'web/build/index.html',
  'web/build/**/*',
}