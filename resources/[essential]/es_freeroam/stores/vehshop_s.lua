require "resources/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)

RegisterServerEvent('CheckMoneyForVeh')
RegisterServerEvent('BuyForVeh')


AddEventHandler('CheckMoneyForVeh', function(name, vehicle, price)
	TriggerEvent('es:getPlayerFromId', source, function(user)
  	if (tonumber(user.money) >= tonumber(price)) then
      local player = user.identifier
  			user:removeMoney((price))
        TriggerClientEvent('FinishMoneyCheckForVeh', source, name, vehicle)
        TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Bonne route!\n")
      else
      TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Fonds insuffisants!\n")
  	end
  end)
end)

AddEventHandler('BuyForVeh', function(name, model, plate, primarycolor, secondarycolor)
  TriggerEvent('es:getPlayerFromId', source, function(user)

    local player = user.identifier
    local plate = plate
    local state = "out"
    local primarycolor = primarycolor
    local secondarycolor = secondarycolor

    --THIS IS FUCKING USELESS
    --local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username'",{['@username'] = player})
    --local result = MySQL:getResults(executed_query, {'identifier'})

    --if(result)then
    --  for k,v in ipairs(result)do
    --    print(v.identifier)
    --    joueur = v.identifier
    --    local joueur = joueur
    --    print(joueur)
    --   end
    --end
    
    --if joueur ~= nil then
    --  local executed_query = MySQL:executeQuery("UPDATE user_vehicle SET `vehicle_model`='@vehicle', `vehicle_plate`= '@plate', `vehicle_state`='@state', `vehicle_colorprimary`='@primarycolor', `vehicle_colorsecondary`='@secondarycolor' WHERE identifier = '@username'",
    --  {['@username'] = player, ['@vehicle'] = vehicle, ['@plate'] = plate, ['@state'] = state, ['@primarycolor'] = primarycolor, ['@secondarycolor'] = secondarycolor})
    --else
    local executed_query = MySQL:executeQuery("INSERT INTO user_vehicle (`identifier`, `vehicle_name`, `vehicle_model`, `vehicle_plate`, `vehicle_state`, `vehicle_colorprimary`, `vehicle_colorsecondary`) VALUES ('@username', '@name', '@model', '@plate', '@state', '@primarycolor', '@secondarycolor')",
    {['@username'] = player, ['@name'] = name, ['@model'] = model, ['@plate'] = plate, ['@state'] = state, ['@primarycolor'] = primarycolor, ['@secondarycolor'] = secondarycolor})
    --end
  end)
end)

-- Spawn the personal vehicle
TriggerEvent('es:addCommand', 'pv', function(source, user)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username'",{['@username'] = player})
  	local result = MySQL:getResults(executed_query, {'vehicle_model'})

    if(result)then
		for k,v in ipairs(result)do
      print(v.vehicle_model)
      vehicle = v.vehicle_model
      end
    end

  	TriggerClientEvent('vehshop:spawnVehicle', source, vehicle)
  end)
end)
