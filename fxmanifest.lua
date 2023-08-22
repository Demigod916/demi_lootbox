fx_version "cerulean"
lua54 "yes"
game "gta5"

ui_page "web/build/index.html"

shared_scripts {
	"@ox_lib/init.lua",
	"init.lua",
}

client_scripts {
	"client/*.lua",
}

server_scripts {
	"server/*.lua",
}

files {
	"web/build/index.html",
	"web/build/**/*",
}