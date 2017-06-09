resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

ui_page "nui/trainer.html"

files {
	"nui/trainer.html",
	"nui/trainer.js",
	"nui/trainer.css",
	"nui/Roboto.ttf",
}

server_script "server.lua"

client_scripts {
	"location.lua",
	"main.lua",
	"misc.lua",
	"player.lua",
	"teleport.lua",
	"vehicles.lua",
	"weapons.lua",
}