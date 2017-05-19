require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('garages:CheckForSpawnVeh')
RegisterServerEvent('garages:CheckForVeh')
RegisterServerEvent('garages:SetVehOut')
RegisterServerEvent('garages:SetVehIn')
RegisterServerEvent('garages:PutVehInGarages')
RegisterServerEvent('garages:CheckListVeh')
RegisterServerEvent('garages:CheckListVehFour')
RegisterServerEvent('garages:PutVehFourGarages')
RegisterServerEvent('garages:ToPay')


AddEventHandler('garages:PutVehInGarages', function(vehicle)
  TriggerEvent('es:getPlayerFromId', source, function(user)

    local player = user.identifier
    local state ="in"

    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'identifier'})

    if(result)then
      for k,v in ipairs(result)do
        print(v.identifier)
        joueur = v.identifier
        local joueur = joueur
       end
    end

    if joueur ~= nil then

      local executed_query = MySQL:executeQuery("UPDATE user_vehicle SET `vehicle_state`='@state' WHERE identifier = '@username'",
      {['@username'] = player, ['@state'] = state})

    end
  end)
end)

AddEventHandler('garages:PutVehFourGarages', function(vehicle)
  TriggerEvent('es:getPlayerFromId', source, function(user)

    local player = user.identifier
    local state ="four"

    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'identifier'})

    if(result)then
      for k,v in ipairs(result)do
        print(v.identifier)
        joueur = v.identifier
        local joueur = joueur
       end
    end

    if joueur ~= nil then

      local executed_query = MySQL:executeQuery("UPDATE user_vehicle SET `vehicle_state`='@state' WHERE identifier = '@username' AND vehicle_state ='out'",
      {['@username'] = player, ['@state'] = state})

    end
  end)
end)


AddEventHandler('garages:CheckListVeh', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
  local listveh = {}
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username' AND vehicle_state = 'in'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'vehicle_name', 'vehicle_plate'}, "identifier")
    if(result)then
    listveh = result
  end
  TriggerClientEvent('garages:ListVeh', source, listveh)
  end)
end)

AddEventHandler('garages:CheckListVehFour', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
  local listveh = {}
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username' AND vehicle_state = 'four'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'vehicle_name', 'vehicle_plate'}, "identifier")
    if(result)then
    listveh = result
  end
  TriggerClientEvent('garages:ListVeh', source, listveh)
  end)
end)

AddEventHandler('garages:CheckForSpawnVeh', function(veh_plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
  local plate = veh_plate
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username' AND vehicle_plate = '@vehicle_plate'",{['@username'] = player, ['@vehicle_plate'] = plate})
    local result = MySQL:getResults(executed_query, {'vehicle_model', 'vehicle_plate', 'vehicle_state', 'vehicle_colorprimary', 'vehicle_colorsecondary'}, "identifier")
    if(result)then
    for k,v in ipairs(result)do
      TriggerClientEvent('garages:SpawnVehicle', source, v.vehicle_model, v.vehicle_plate, v.vehicle_state, v.vehicle_colorprimary, v.vehicle_colorsecondary)
    end
  end
  end)
end)

AddEventHandler('garages:ToPay', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Vous avez payé 150$ de frais de fourrière")
    user:removeMoney(150)
    end)
end)

AddEventHandler('garages:CheckForVeh', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
  local listveh = {}
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username' AND vehicle_state = 'out'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'vehicle_model', 'vehicle_plate'}, "identifier")
    if(result)then
    listveh = result
  end
  TriggerClientEvent('garages:StoreVehicle', source, listveh)
  end)
end)


AddEventHandler('garages:SetVehOut', function(out_plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
  
    local plate = out_plate
    local state = "out"

    MySQL:executeQuery("UPDATE user_vehicle SET vehicle_state='@state' WHERE identifier = '@username' AND vehicle_plate = '@plate'",
      {['@username'] = player, ['@plate'] = plate, ['@state'] = state})
  end)
end)

AddEventHandler('garages:SetVehIn', function(in_plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
  
    local plate = in_plate
    local state = "in"

    MySQL:executeQuery("UPDATE user_vehicle SET vehicle_state='@state' WHERE identifier = '@username' AND vehicle_plate = '@plate'",
      {['@username'] = player, ['@plate'] = plate, ['@state'] = state})
  end)
end)