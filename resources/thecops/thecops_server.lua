require "resources/essentialmode/lib/MySQL"
-- MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

local inServiceCops = {}

function nameJob(id)
  local executed_query = MySQL:executeQuery("SELECT * FROM jobs WHERE job_id = '@namejob'", {['@namejob'] = id})
  local result = MySQL:getResults(executed_query, {'job_name'}, "job_id")
  return result[1].job_name
end

function addCop(identifier)
	MySQL:executeQuery("INSERT INTO police (`identifier`) VALUES ('@identifier')", { ['@identifier'] = identifier})
	TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..identifier .. " had been added as Cop ")
end

function remCop(identifier)
	MySQL:executeQuery("DELETE FROM police WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
	TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..identifier .. " had been removed from Cop ")
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
	local identifier = ""
    TriggerEvent("es:getPlayerFromId", target, function(player)
    	identifier = player.identifier
		local executed_query = MySQL:executeQuery("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` JOIN recolt ON `recolt`.`raw_id` = `user_inventory`.`item_id` WHERE user_id = '@username'", { ['@username'] = player.identifier })
		local result = MySQL:getResults(executed_query, { 'quantity', 'libelle', 'item_id', 'job_id', 'illegal' }, "item_id")
		if (result) then
			for _, v in ipairs(result) do
				if(v.quantity ~= 0) then
					strResult = strResult .. v.quantity .. " de " .. v.libelle .. ", "
				end
				if(v.isIllegal == "True") then
					TriggerClientEvent('police:dropIllegalItem', target, v.item_id)
					TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..identifier .. " has been check INV and got illegal items ")
				end
			end
		end

		strResult = strResult .. " / "

		local executed_query = MySQL:executeQuery("SELECT * FROM user_weapons WHERE identifier = '@username'", { ['@username'] = identifier })
		local result = MySQL:getResults(executed_query, { 'weapon_model' }, 'identifier' )
		if (result) then
			for _, v in ipairs(result) do
					strResult = strResult .. "possession de " .. v.weapon_model .. ", "
			end
		end
	end)
	
	TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..identifier .. " got weapons : " .. strResult)
	
	return strResult
end

AddEventHandler('es:playerLoaded', function(source)
TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        local exec = MySQL:executeQuery("SELECT job FROM users WHERE identifier = '@identifier' ", {['@identifier'] = player})
        local result = MySQL:getResults(exec, {'job'}, "identifier")
        local jobName = nameJob(result[1].job)
TriggerClientEvent("jobssystem:updateJob", source, jobName)
end)
end)

AddEventHandler('playerDropped', function()
	if(inServiceCops[source]) then
		inServiceCops[source] = nil
		
		for i, c in pairs(inServiceCops) do
			TriggerClientEvent("police:resultAllCopsInService", i, inServiceCops)
		end
	end
end)

AddEventHandler('es:playerDropped', function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			TriggerEvent("jobssystem:disconnectReset", player, 7)
		end
end)

RegisterServerEvent('police:setService')
AddEventHandler('police:setService',
  function(service)
    TriggerEvent('es:getPlayerFromId', source,
      function(user)
	TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..user.identifier .. " has taking service ")
        local executed_query = MySQL:executeQuery("UPDATE users SET enService = @service WHERE users.identifier = '@identifier'", {['@identifier'] = user.identifier, ['@service'] = service})
      end
    )
  end
)

RegisterServerEvent('police:checkIsCop')
AddEventHandler('police:checkIsCop', function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local identifier = user.identifier
		checkIsCop(identifier)
	end)
end)

RegisterServerEvent('police:takeService')
AddEventHandler('police:takeService', function()

	if(not inServiceCops[source]) then
		inServiceCops[source] = GetPlayerName(source)
		
		for i, c in pairs(inServiceCops) do
			TriggerClientEvent("police:resultAllCopsInService", i, inServiceCops)
		end
	end
end)

RegisterServerEvent('police:enService')
AddEventHandler('police:enService', function()
	local servingCops = false
	if next(inServiceCops) then
		servingCops = true
	end
	TriggerClientEvent("services:cbcopconnected", source, servingCops)
end)

RegisterServerEvent('police:checkService')
AddEventHandler('police:checkService', function()
	local CanHaveFreeFuel = false
	if(not inServiceCops[source]) then
		CanHaveFreeFuel = false
	else
		CanHaveFreeFuel = true
	end
end) 

RegisterServerEvent('police:breakService')
AddEventHandler('police:breakService', function()

	if(inServiceCops[source]) then
		inServiceCops[source] = nil
		
		for i, c in pairs(inServiceCops) do
			TriggerClientEvent("police:resultAllCopsInService", i, inServiceCops)
		end
	end
end)

RegisterServerEvent('police:getAllCopsInService')
AddEventHandler('police:getAllCopsInService', function()
	TriggerClientEvent("police:resultAllCopsInService", source, inServiceCops)
end)

RegisterServerEvent('police:checkingPlate')
AddEventHandler('police:checkingPlate', function(plate)
	local executed_query = MySQL:executeQuery("SELECT last_name FROM user_vehicle JOIN users ON user_vehicle.identifier = users.identifier WHERE vehicle_plate = '@plate'", { ['@plate'] = plate })
	local result = MySQL:getResults(executed_query, { 'last_name' }, "identifier")
	if (result[1]) then
		for _, v in ipairs(result) do
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "The vehicle #"..plate.." is the property of " .. v.last_name)
		end
	else
		TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1,  "LSPD", false, "The vehicle #"..plate.." isn't register !")
	end
	TriggerEvent("es:getPlayerFromId", source, function(user)
		TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..user.identifier .. " has been check vehplate ")
	end)
	end)

RegisterServerEvent('police:confirmUnseat')
AddEventHandler('police:confirmUnseat', function(t)
	TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, GetPlayerName(t).. " is out !")
	TriggerClientEvent('police:unseatme', t)
end)

RegisterServerEvent('police:targetCheckInventory')
AddEventHandler('police:targetCheckInventory', function(t)
	TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, checkInventory(t))
end)

RegisterServerEvent('police:finesGranted')
AddEventHandler('police:finesGranted', function(t, amount)
	TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, GetPlayerName(t).. " paid a $"..amount.." fines.")
	TriggerClientEvent('police:payFines', t, amount)
	TriggerEvent("es:getPlayers", function(Users)
		TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..Users[t].identifier .. " has been fined " .. " by " .. Users[source].identifier)
	end)
	end)

RegisterServerEvent('police:cuffGranted')
AddEventHandler('police:cuffGranted', function(t)
	TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, GetPlayerName(t).. " toggle cuff (except if it's a cop :3 ) !")
	TriggerClientEvent('police:getArrested', t)
	TriggerEvent("es:getPlayers", function(Users)
		TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..Users[t].identifier .. " has been Cuffed " .. " by " .. Users[source].identifier)
	end)
end)

RegisterServerEvent('police:forceEnterAsk')
AddEventHandler('police:forceEnterAsk', function(t, v)
	TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, GetPlayerName(t).. " get to the car ! (if he's cuffed :) )")
	TriggerClientEvent('police:forcedEnteringVeh', t, v)
	TriggerEvent("es:getPlayers", function(Users)
		TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..Users[t].identifier .. " has been forced Enter " .. " by " .. Users[source].identifier)
	end)
end)

-----------------------------------------------------------------------
----------------------EVENT SPAWN POLICE VEH---------------------------
-----------------------------------------------------------------------
RegisterServerEvent('CheckPoliceVeh')
AddEventHandler('CheckPoliceVeh', function(vehicle)
	TriggerEvent('es:getPlayerFromId', source, function(user)

			TriggerClientEvent('FinishPoliceCheckForVeh',source)
			-- Spawn police vehicle
			TriggerClientEvent('policeveh:spawnVehicle', source, vehicle)
	end)
end)

-----------------------------------------------------------------------
---------------------COMMANDE ADMIN AJOUT / SUPP COP-------------------
-----------------------------------------------------------------------
TriggerEvent('es:addAdminCommand', 'copadd', 100000, function(source, args, user) 
     if(not args[2]) then
		TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Usage : /copadd [ID]")	
	else
		if(GetPlayerName(tonumber(args[2])) ~= nil)then
			local player = tonumber(args[2])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				addCop(target.identifier)
				TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Bien reçu !")
				TriggerClientEvent('es_freeroam:notify', player, "CHAR_STEVE", 1, "LSPD", false, "Felicitations, vous êtes désormais policier !")
				TriggerClientEvent('police:nowCop', player)
			end)
		else
			TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Aucun joueur avec cet ID !")
		end
	end
end, function(source, args, user) 
	TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Tu n'as pas la permission de faire cela !")
end)

TriggerEvent('es:addAdminCommand', 'coprem', 100000, function(source, args, user) 
     if(not args[2]) then
		TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Usage : /coprem [ID]")	
	else
		if(GetPlayerName(tonumber(args[2])) ~= nil)then
			local player = tonumber(args[2])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				remCop(target.identifier)
				TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Bien reçu !")
				TriggerClientEvent('es_freeroam:notify', player, "CHAR_STEVE", 1, "LSPD", false, "Vous n'etes plus policier !")
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
		local result = MySQL:getResults(query, {'first_name', 'last_name', 'matricule', 'phone_number', 'gender'}, "identifier")
		if puiorpcops == 1 then
			TriggerClientEvent("Iphone:rcheckid", source, result[1].first_name, result[1].last_name, result[1].matricule, result[1].phone_number, result[1].gender)
		elseif puiorpcops == 0 then
			TriggerClientEvent("Iphone:rgetidui", source, result[1].first_name, result[1].last_name, result[1].matricule, result[1].phone_number, result[1].gender)
		end
	end)	
end)
	
RegisterServerEvent("Iphone:check")
AddEventHandler("Iphone:check", function()
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			TriggerClientEvent('police:checkInventory', source)
			TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..player.identifier .. " has check inv ")
		else
			TriggerClientEvent("pNotify:SendNotification", -1, {
				text = "Vous n'avez pas la permission de faire ça !",
				type = "warning",
				timeout = 2500,
				layout = "centerLeft",
			})
		end
	end)
end)

RegisterServerEvent("Iphone:forceenter")
AddEventHandler("Iphone:forceenter", function()
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			TriggerClientEvent('police:forceEnter', source)
			TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..player.identifier .. " has forced enter ")
		else
			TriggerClientEvent("pNotify:SendNotification", -1, {
				text = "Vous n'avez pas la permission de faire ça !",
				type = "warning",
				timeout = 2500,
				layout = "centerLeft",
			})
		end
	end)
end)

RegisterServerEvent("Iphone:cuff")
AddEventHandler("Iphone:cuff", function()
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isCop = s_checkIsCop(player.identifier)
		if(isCop ~= "nil") then
			TriggerClientEvent('police:cuff', source)
			TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..player.identifier .. " has cuffed ")
		else
			TriggerClientEvent("pNotify:SendNotification", -1, {
				text = "Vous n'avez pas la permission de faire ça !",
				type = "warning",
				timeout = 2500,
				layout = "centerLeft",
			})
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
					TriggerEvent("log:addLogServer", "TheCops", "INFO", "Player : " ..player.identifier .. " has fined " .. tostring(amount))
				else
					TriggerClientEvent("pNotify:SendNotification", -1, {
				text = "Pas de joueur à porté.",
				type = "warning",
				timeout = 2500,
				layout = "centerLeft",
			})
				end
		else
			TriggerClientEvent("pNotify:SendNotification", -1, {
				text = "T'es pas flic !",
				type = "alert",
				timeout = 2500,
				layout = "centerLeft",
			})
		end
	end)
end) 

RegisterServerEvent('Iphone:checkplate')
AddEventHandler('Iphone:checkplate', function(plate)
	local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle JOIN users ON user_vehicle.identifier = users.identifier WHERE vehicle_plate = '@plate'", { ['@plate'] = plate })
	local result = MySQL:getResults(executed_query, { 'last_name', 'first_name' }, "identifier")
	if (result[1]) then
		for _, v in ipairs(result) do
			TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Le véhicule #<b style='color:red'>"..plate.."</b> est la propriété de <b style='color:green'> "..v.first_name.." "..v.last_name.."</b>",
				type = "info",
				timeout = 2500,
				layout = "centerLeft",
			})
			TriggerEvent("log:addLogServer", "TheCops", "INFO", "Cop : ".. " has check " .. v.first_name .. " " .. v.last_name .. " Plate")
		end
	else
		TriggerClientEvent("pNotify:SendNotification", source, {
				text = "Le véhicule #<b style='color:red'>"..plate.."</b> n'est pas enregistré !",
				type = "warning",
				timeout = 2500,
				layout = "centerLeft",
			})
	end
end)

RegisterServerEvent("police:unregisterservice")
AddEventHandler("police:unregisterservice", function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		user:setSessionVar("service", 0)						
	end)
		
end)

RegisterServerEvent("police:registerservice")
AddEventHandler("police:registerservice", function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		user:setSessionVar("service", 1)						
	end)
		
end)

--RegisterServerEvent("Iphone:getPlayers") -- TriggerServerEvent("Iphone:getPlayers")
--AddEventHandler("Iphone:getPlayers", function()
--	players = GetPlayers()
--	TriggerClientEvent("Iphone:rgetPlayers",source, players)	
--end)






