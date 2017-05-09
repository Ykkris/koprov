
description "RP module/framework"

ui_page "gui/index.html"

-- server scripts
server_scripts {
	"base.lua",
	"modules/group.lua",
	"modules/identity.lua",
	"modules/gui.lua",
	"modules/emotes.lua",


	-- basic implementations
	"modules/basic_phone.lua"
}

client_scripts {
	"client/Tunnel.lua",
  	"client/Proxy.lua",
	"client/base.lua",
	"client/gui.lua"
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