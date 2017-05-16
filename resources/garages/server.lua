require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('garages:SetVehOut')
RegisterServerEvent('garages:SetVehIn')
RegisterServerEvent('garages:GetPlayerVehs')

-- Checks if the plate belongs to the user, if it does it updates the vehicle as in, then send the remove order to the client
AddEventHandler('garages:SetVehIn', function(plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'vehicle_model', 'vehicle_plate'}, "identifier")
    local found = false
    local state = 'in'
    if(result)then
      for k,v in ipairs(result)do
        if v.vehicle_plate == plate then
          found = true
          MySQL:executeQuery("UPDATE user_vehicle SET vehicle_state='@state' WHERE identifier = '@username' AND vehicle_plate = '@plate'",
          {['@username'] = player, ['@plate'] = plate, ['@state'] = state})
        end
      end
    end

    TriggerClientEvent('garages:RemoveVehicle', source, found, plate, cassei)
  end)
end)

AddEventHandler('playerDropped', function(player)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier

    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'vehicle_model', 'vehicle_plate', 'vehicle_four'}, "identifier")
    local found = false
    local four ='yes'
    if(resut)then
      for k,v in ipairs(result)do
        if v.vehicle_plate == plate then
          found = true
          MySQL:executeQuery("UPDATE user_vehicle SET vehicle_four='@four' WHERE identifier = '@username' AND vehicle_plate = '@plate'",
          {['@username'] = player, ['@plate'] = plate, ['@state'] = state, ['@four'] = four})
        end
      end
    end
  end)
end)

-- Updates the vehicle linked to the mentionned plate as out
AddEventHandler('garages:SetVehOut', function(plate)
  --print('garages:SetVehOut')
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local plate = plate
    local state = "out"
    local four = "no"

    MySQL:executeQuery("UPDATE user_vehicle SET vehicle_state='@state' AND vehicle_four'@four' WHERE identifier = '@username' AND vehicle_plate = '@plate'",
      {['@username'] = player, ['@plate'] = plate, ['@state'] = state, ['@four'] = four})
  end)
end)

-- Returns the list of "button" = list of vehicles with all their informations
AddEventHandler('garages:GetPlayerVehs', function(plate)
  --print('garages:GetPlayerVehs')
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username' AND vehicle_state = 'in' AND vehicle_four = 'no'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'vehicle_name', 'vehicle_model', 'vehicle_plate', 'vehicle_colorprimary', 'vehicle_colorsecondary', 'vehicle_state', 'vehicle_four'}, "identifier")
    local buttons = {}

    if(result)then
      for k,v in ipairs(result)do

        local name = v.vehicle_name
        local model = v.vehicle_model
        local plate = v.vehicle_plate
        local primarycolor = v.vehicle_colorprimary
        local secondarycolor = v.vehicle_colorsecondary
        local state = v.vehicle_state
        local four = v.vehicle_four
        
        table.insert(buttons, {name = name, model = model, plate = plate, primarycolor= primarycolor, secondarycolor = secondarycolor, state = state, four = four})

      end
    end

    TriggerClientEvent('garages:DisplayVehicles', source, buttons)

  end)
end)

