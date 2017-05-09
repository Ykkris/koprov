
description "RP module/framework"

ui_page "gui/index.html"

-- server scripts
server_scripts {
	"base.lua",
	"modules/group.lua",
	"modules/gui.lua",
	"modules/player_state.lua",
	"modules/map.lua",
	"modules/identity.lua",
	"modules/emotes.lua",


	-- basic implementations
	"modules/basic_phone.lua"
}

client_scripts {
	"client/Tunnel.lua",
  	"client/Proxy.lua",
	"client/base.lua",
	"client/gui.lua",
	"client/map.lua",
	"cfg/client.lua",
	"client/player_state.lua"
}

-- client files
files{
  "gui/index.html",
  "gui/design.css",
  "gui/main.js",
  "gui/Menu.js",
  "gui/ProgressBar.js",
  "gui/WPrompt.js",
  "gui/RequestManager.js",
  "gui/Div.js"
}