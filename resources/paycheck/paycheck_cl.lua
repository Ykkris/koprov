Citizen.CreateThread(function ()
	while true do
	Citizen.Wait(900000) -- Modifier cette valeur pour la fréquence des salaires (600000 = 10 minutes)
		TriggerServerEvent('paycheck:salary')
	end
end)
