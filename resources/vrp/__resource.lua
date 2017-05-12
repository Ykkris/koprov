
description "RP module/framework"

ui_page "gui/index.html"

-- server scripts
server_scripts {
	"base.lua",
	"modules/group.lua",
	"modules/admin.lua",
	"modules/gui.lua",
	"modules/player_state.lua",
	"modules/map.lua",
	"modules/identity.lua",
	"modules/emotes.lua",
	"modules/police.lua",


	-- basic implementations
	"modules/basic_phone.lua"
}

client_scripts {
	"client/Tunnel.lua",
  	"client/Proxy.lua",
  	"cfg/client.lua",
	"client/base.lua",
	"client/gui.lua",
	"client/player_state.lua",
	"client/map.lua",
	"client/identity.lua",
	"client/police.lua"
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