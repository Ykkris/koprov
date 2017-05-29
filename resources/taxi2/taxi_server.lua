RegisterServerEvent('CheckTaxiVeh')
AddEventHandler('CheckTaxiVeh', function(vehicle)
	TriggerEvent('es:getPlayerFromId', source, function(user)

			TriggerClientEvent('FinishTaxiCheckForVeh',source)
			-- Spawn police vehicle
			TriggerClientEvent('taxiveh:spawnVehicle', source, vehicle)
			TriggerEvent("log:addLogServer", "TaxiGarage", "INFO", "Player : " ..user.identifier .. " spawned taxi ")
	end)
end)
