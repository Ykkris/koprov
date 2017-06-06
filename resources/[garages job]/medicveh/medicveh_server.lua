RegisterServerEvent('CheckMedicVeh')
AddEventHandler('CheckMedicVeh', function(vehicle)
	TriggerEvent('es:getPlayerFromId', source, function(user)

			TriggerClientEvent('FinishMedicCheckForVeh',source)
			-- Spawn police vehicle
			TriggerClientEvent('medicveh:spawnVehicle', source, vehicle)
	end)
end)