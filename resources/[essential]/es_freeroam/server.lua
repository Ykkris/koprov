TriggerEvent("es:setDefaultSettings", {
    moneyIcon = "$"
})

RegisterServerEvent('playerSpawn')
AddEventHandler('playerSpawn', function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		TriggerEvent("log:addLogServer", "FreeRoam","SPAWN" , "Player : " .. user.identifier .. " at coords : " .. " X= " .. tostring(spawnCoords.x) .. " Y= " .. tostring(spawnCoords.y) .. " Z= " .. tostring(spawnCoords.z))
	end)
	TriggerClientEvent('es_freeroam:spawnPlayer', source, spawnCoords.x, spawnCoords.y, spawnCoords.z, false)
end)

AddEventHandler('es:playerLoaded', function(source)
	-- Get the players money amount
	TriggerEvent("es:getPlayerFromId", source, function(user)
	user:setMoney((user.money))
	TriggerClientEvent('es:activatedirtyMoney', source, user.dirty_money)
	TriggerEvent("log:addLogServer",  "FreeRoam" , "LOAD" , "Player : " .. user.identifier .. "Has been loaded, dirty money = " .. tostring(user.dirty_money))
	end)
end)

RegisterServerEvent('mission:completed')
AddEventHandler('mission:completed', function(total)
	-- Get the players money amount
TriggerEvent('es:getPlayerFromId', source, function(user)
  -- update player money amount
  user:addMoney((total))
 TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "You received ~g~$".. tonumber(total))
 end)
end)

RegisterServerEvent('es_freeroam:pay')
AddEventHandler('es_freeroam:pay', function(amount)
	-- Get the players money amount
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if(user.money > amount) then
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Your transaction is ~g~completed.")
			user:removeMoney((amount))
		else
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Your transaction is ~r~rejected.")
		end
	end)
end)
