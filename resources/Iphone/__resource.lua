-- resource_manifest_version 'f15e72ec-3972-4fe4-9c7d-afc5394ae207'
client_script 'iphone_client.lua'
server_script 'iphone_server.lua'
ui_page 'html/ui.html' --THIS IS IMPORTENT

--[[The following is for the files which are need for you UI (like, pictures, the HTML file, css and so on) ]]--
files({
    'html/ui.html',
    'html/scripts.js',
    'html/style.css',
    'html/card.png'
   -- 'client/html/jquery-3.2.1.min.js'
})
