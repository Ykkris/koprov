RegisterServerEvent('CheckJournaVeh')
AddEventHandler('CheckJournaVeh', function(vehicle)
	TriggerEvent('es:getPlayerFromId', source, function(user)

			TriggerClientEvent('FinishJournaCheckForVeh',source)
			-- Spawn police vehicle
			TriggerClientEvent('journaveh:spawnVehicle', source, vehicle)
			-- -- TriggerEvent("log:addLogServer", "TaxiGarage", "INFO", "Player : " ..user.identifier .. " spawned taxi ")
	end)
end)
