require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

function addCop(identifier)
	MySQL:executeQuery("INSERT INTO police (`identifier`) VALUES ('@identifier')", { ['@identifier'] = identifier})
end

function remCop(identifier)
	MySQL:executeQuery("DELETE FROM police WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
end

function checkIsCop(identifier)
	local query = MySQL:executeQuery("SELECT * FROM police WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
	local result = MySQL:getResults(query, {'rank'}, "identifier")
	
	if(not result[1]) then
		TriggerClientEvent('police:receiveIsCop', source, "inconnu")
	else
		TriggerClientEvent('police:receiveIsCop', source, result[1].rank)
	end
end



function s_checkIsCop(identifier)
	local query = MySQL:executeQuery("SELECT * FROM police WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
	local result = MySQL:getResults(query, {'rank'}, "identifier")
	
	if(not result[1]) then
		return "nil"
	else
		return result[1].rank
	end
end

function checkInventory(target)
	local strResult = GetPlayerName(target).." own : "
    TriggerEvent("es:getPlayerFromId", target, function(player)
		local executed_query = MySQL:executeQuery("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` JOIN recolt ON `recolt`.`raw_id` = `user_inventory`.`item_id` WHERE user_id = '@username'", { ['@username'] = player.identifier })
		local result = MySQL:getResults(executed_query, { 'quantity', 'libelle', 'item_id', 'job_id' }, "item_id")
		if (result) then
			for _, v in ipairs(result) do
				if(v.job_id == 6) then
					strResult = strResult .. v.quantity .. " de " .. v.libelle .. ", "
					TriggerClientEvent('police:dropIllegalItem', target, v.item_id)
				end
			end
		end
	end)
	
	return strResult

end

RegisterServerEvent('police:checkIsCop')
AddEventHandler('police:checkIsCop', function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local identifier = user.identifier
		checkIsCop(identifier)
	end)
end)

RegisterServerEvent('police:targetCheckInventory')
AddEventHandler('police:targetCheckInventory', function(t)
	TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, checkInventory(t))
end)

RegisterServerEvent('police:finesGranted')
AddEventHandler('police:finesGranted', function(t, amount)
	TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, GetPlayerName(t).. " paid a $"..amount.." fines.")
	TriggerClientEvent('police:payFines', t, amount)
end)

RegisterServerEvent('police:cuffGranted')
AddEventHandler('police:cuffGranted', function(t)
	TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, GetPlayerName(t).. " toggle cuff (except if it's a cop :3 ) !")
	TriggerClientEvent('police:getArrested', t)
end)

RegisterServerEvent('police:confirmUnseat')
AddEventHandler('police:confirmUnseat', function(t)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, GetPlayerName(t).. " is out !")
	TriggerClientEvent('police:unseatme', t)
end)

RegisterServerEvent('police:forceEnterAsk')
AddEventHandler('police:forceEnterAsk', function(t, v)
	TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, GetPlayerName(t).. " get to the car ! (if he's cuffed :) )")
	TriggerClientEvent('police:forcedEnteringVeh', t, v)
end)

TriggerEvent('es:addCommand', 'check', function(source, args, user) 
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			TriggerClientEvent('police:checkInventory', source)
		else
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "You don't have the permission to do this !")
		end
	end)
end)

TriggerEvent('es:addCommand', 'fines', function(source, args, user) 
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			if(#args < 3) then
				TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Usage : /fines [id] [amount]")
			else
				if(GetPlayerName(tonumber(args[2])) ~= nil)then
					TriggerClientEvent('police:fines', source, args[2], args[3])
				else
					TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "No player with this ID !")
				end
			end
		else
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "You don't have the permission to do this !")
		end
	end)
end)

TriggerEvent('es:addCommand', 'cuff', function(source, args, user) 
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			TriggerClientEvent('police:cuff', source)
		else
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "You don't have the permission to do this !")
		end
	end)
end)

TriggerEvent('es:addCommand', 'forceEnter', function(source, args, user) 
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			TriggerClientEvent('police:forceEnter', source)
		else
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "You don't have the permission to do this !")
		end
	end)
end)

TriggerEvent('es:addAdminCommand', 'copadd', 100000, function(source, args, user) 
     if(not args[2]) then
		TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Usage : /copadd [ID]")	
	else
		if(GetPlayerName(tonumber(args[2])) ~= nil)then
			local player = tonumber(args[2])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				addCop(target.identifier)
				TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Roger that !")
				TriggerClientEvent('es_freeroam:notify', player, "CHAR_STEVE", 1, "LSPD", false, "Congrats, you're now a cop !")
				TriggerClientEvent('police:nowCop', player)
			end)
		else
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "No player with this ID !")
		end
	end
end, function(source, args, user) 
	TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "You don't have the permission to do this !")
end)

TriggerEvent('es:addAdminCommand', 'coprem', 100000, function(source, args, user) 
     if(not args[2]) then
		TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Usage : /coprem [ID]")	
	else
		if(GetPlayerName(tonumber(args[2])) ~= nil)then
			local player = tonumber(args[2])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				remCop(target.identifier)
				TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Roger that !")
				TriggerClientEvent('es_freeroam:notify', player, "CHAR_STEVE", 1, "LSPD", false, "You're no longer a cop !")
				TriggerClientEvent('police:noLongerCop', player)
			end)
		else
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "No player with this ID !")
		end
	end
end, function(source, args, user) 
	TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "You don't have the permission to do this !")
end)
RegisterServerEvent("Iphone:checkid") -- RETURN THE RP PLAYER NAME
AddEventHandler("Iphone:checkid", function(target, puiorpcops) -- 0 pour ui et 1 pour cops
	TriggerEvent("es:getPlayerFromId", target, function(user)
		local query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@identifier'", { ['@identifier'] = user.identifier})
		local result = MySQL:getResults(query, {'first_name', 'last_name', 'matricule'}, "identifier")
		if puiorpcops == 1 then
			TriggerClientEvent("Iphone:rcheckid", source, result[1].first_name, result[1].last_name, result[1].matricule)
		elseif puiorpcops == 0 then
			TriggerClientEvent("Iphone:rgetidui", source, result[1].first_name, result[1].last_name, result[1].matricule)
		end
	end)	
end)
	
RegisterServerEvent("Iphone:check")
AddEventHandler("Iphone:check", function()
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			TriggerClientEvent('police:checkInventory', source)
		else
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "You don't have the permission to do this !")
		end
	end)
end)

RegisterServerEvent("Iphone:forceenter")
AddEventHandler("Iphone:forceenter", function()
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			TriggerClientEvent('police:forceEnter', source)
		else
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "You don't have the permission to do this !")
		end
	end)
end)

RegisterServerEvent("Iphone:cuff")
AddEventHandler("Iphone:cuff", function()
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			TriggerClientEvent('police:cuff', source)
		else
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "You don't have the permission to do this !")
		end
	end)
end)

RegisterServerEvent("Iphone:amande") -- TriggerServerEvent("Iphone:amande", resultat_n, cp, cd)
AddEventHandler("Iphone:amande", function(amount, cp, cd)
	RconPrint(tostring(amount).. " " ..tostring(cp).. " "..tostring(cd))
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then

				if(GetPlayerName(cp) ~= nil and cd <= 5 )then
					TriggerClientEvent('police:fines', source, cp, amount)
				else
					TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Pas de joueur à porté!")
				end
		else
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "T'es pas flic!")
		end
	end)
end)

--RegisterServerEvent("Iphone:getPlayers") -- TriggerServerEvent("Iphone:getPlayers")
--AddEventHandler("Iphone:getPlayers", function()
--	players = GetPlayers()
--	TriggerClientEvent("Iphone:rgetPlayers",source, players)	
--end)






