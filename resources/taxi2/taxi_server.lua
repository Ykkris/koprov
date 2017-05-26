RegisterServerEvent('CheckTaxiVeh')
AddEventHandler('CheckTaxiVeh', function(vehicle)
	TriggerEvent('es:getPlayerFromId', source, function(user)

			TriggerClientEvent('FinishTaxiCheckForVeh',source)
			-- Spawn police vehicle
			TriggerClientEvent('taxiveh:spawnVehicle', source, vehicle)
	end)
end)