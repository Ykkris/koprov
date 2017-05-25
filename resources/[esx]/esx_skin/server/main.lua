require "resources/essentialmode/lib/MySQL"
-- MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('esx_skin:requestPlayerSkinInfos')
AddEventHandler('esx_skin:requestPlayerSkinInfos', function()
	TriggerEvent('es:getPlayerFromId', source, function(xPlayer)

		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@identifier'", {['@identifier'] = xPlayer.identifier})
		local result         = MySQL:getResults(executed_query, {'skin'})
		local skin           = json.decode(result[1].skin)
		
		--local jobSkin = {
			--skin_male   = xPlayer.job.skin_male,
			--skin_female = xPlayer.job.skin_female
		--}

		TriggerClientEvent('esx_skin:responsePlayerSkinInfos', source, skin)
	end)
end)

AddEventHandler('esx_skin:requestPlayerSkinInfosCb', function(source, cb)
	TriggerEvent('es:getPlayerFromId', source, function(xPlayer)

		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@identifier'", {['@identifier'] = xPlayer.identifier})
		local result         = MySQL:getResults(executed_query, {'skin'})
		local skin           = json.decode(result[1].skin)

		--local jobSkin = {
			--skin_male   = xPlayer.job.skin_male,
			--skin_female = xPlayer.job.skin_female
		--}

		cb(skin, jobSkin)
	end)
end)

RegisterServerEvent('esx_skin:savePlayerSkinInfos')
AddEventHandler('esx_skin:savePlayerSkinInfos', function(skin)

	local encodedSkin = json.encode(skin)

	TriggerEvent('es:getPlayerFromId', source, function(xPlayer)
		MySQL:executeQuery("UPDATE users SET skin = '@skin' WHERE identifier = '@identifier'", {['@identifier'] = xPlayer.identifier, ['@skin'] = encodedSkin})
	end)

end)

RegisterServerEvent('esx_skin:saveSkinResponse')
AddEventHandler('esx_skin:saveSkinResponse', function(skin)

	local encodedSkin = json.encode(skin)
	local file        = io.open('resources/[esx]/esx_skin/skins.txt', "a")

	file:write(encodedSkin .. "\n")
	file:flush()
	file:close()

end)

TriggerEvent('es:addGroupCommand', 'skin', "owner", function(source, args, user)
	TriggerClientEvent("esx_skin:openSkinMenu", source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end)

TriggerEvent('es:addGroupCommand', 'saveskin', "owner", function(source, args, user)
	TriggerClientEvent('esx_skin:saveSkinRequest', source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions.")
end)