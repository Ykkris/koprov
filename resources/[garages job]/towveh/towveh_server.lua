RegisterServerEvent('CheckDepanVeh')
AddEventHandler('CheckDepanVeh', function(vehicle)
	TriggerEvent('es:getPlayerFromId', source, function(user)

			TriggerClientEvent('FinishDepanCheckForVeh',source)
			-- Spawn police vehicle
			TriggerClientEvent('depanveh:spawnVehicle', source, vehicle)
	end)
end)