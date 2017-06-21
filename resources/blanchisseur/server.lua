RegisterServerEvent("blanchi:BlanchirCash")
AddEventHandler("blanchi:BlanchirCash", function()
	TriggerEvent('es:getPlayerFromId', source, function(user) -- Get Player ID
		local cash = tonumber(user:getMoney()) -- Get player money
		local dcash = tonumber(user:getDirty_Money()) -- Get player dirty money
		if dcash <= 0 then -- If player have not dirty money then
			 TriggerClientEvent("es_freeroam:notify", source, "CHAR_LESTER", 1, "Argent Sale", false, "Tu n'a pas d'argent à blanchir") -- You haven't got money to launder
		else 
		local washedcash = dcash / 1.2 -- Change value (0.5 = 100 000 money - > 50 000 dirty money)
		local total = cash + washedcash -- Total player cash + washed cash
		user:setMoney(total) -- Set total money
		user:setDirty_Money(0) -- Set dirty money to 0
	 TriggerClientEvent("es_freeroam:notify", source, "CHAR_LESTER", 1, "Argent Sale", false, "Vous avez blanchi ~g~".. tonumber(washedcash) .."$~r~ d'argent sale^0. Vous avez maintenant ~g~".. tonumber(total) .."$")
	 end -- Message: You have laundered 10$ , now you have 100$ (EXAMPLE)
	end)
end)