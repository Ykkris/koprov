RegisterServerEvent('CheckRecoltVeh')
AddEventHandler('CheckRecoltVeh', function(vehicle)
	TriggerEvent('es:getPlayerFromId', source, function(user)

			TriggerClientEvent('FinishRecoltCheckForVeh',source)
			-- Spawn police vehicle
			TriggerClientEvent('recoltveh:spawnVehicle', source, vehicle)
	end)
end)