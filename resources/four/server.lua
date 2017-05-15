require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('fours:SetVehOut')
RegisterServerEvent('fours:SetVehIn')
RegisterServerEvent('fours:GetPlayerVehs')

-- Checks if the plate belongs to the user, if it does it updates the vehicle as in, then send the remove order to the client
AddEventHandler('fours:SetVehIn', function(plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehiclefour WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'vehicle_model', 'vehicle_plate'}, "identifier")
    local found = false
    local state = 'in'
    if(result)then
      for k,v in ipairs(result)do
        if v.vehicle_plate == plate then
          found = true
          MySQL:executeQuery("UPDATE user_vehiclefour SET vehicle_state='@state' WHERE identifier = '@username' AND vehicle_plate = '@plate'",
          {['@username'] = player, ['@plate'] = plate, ['@state'] = state})
        end
      end
    end

    TriggerClientEvent('fours:RemoveVehicle', source, found, plate, cassei)
  end)
end)

-- Updates the vehicle linked to the mentionned plate as out
AddEventHandler('fours:SetVehOut', function(plate)
  --print('fours:SetVehOut')
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local plate = plate
    local state = "out"

    MySQL:executeQuery("UPDATE user_vehiclefour SET vehicle_state='@state' WHERE identifier = '@username' AND vehicle_plate = '@plate'",
      {['@username'] = player, ['@plate'] = plate, ['@state'] = state})
  end)
end)

-- Returns the list of "button" = list of vehicles with all their informations
AddEventHandler('fours:GetPlayerVehs', function(plate)
  --print('fours:GetPlayerVehs')
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehiclefour WHERE identifier = '@username' AND vehicle_state = 'in'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'vehicle_name', 'vehicle_model', 'vehicle_plate', 'vehicle_colorprimary', 'vehicle_colorsecondary', 'vehicle_state'}, "identifier")
    local buttons = {}

    if(result)then
      for k,v in ipairs(result)do

        local name = v.vehicle_name
        local model = v.vehicle_model
        local plate = v.vehicle_plate
        local primarycolor = v.vehicle_colorprimary
        local secondarycolor = v.vehicle_colorsecondary
        local state = v.vehicle_state
        
        table.insert(buttons, {name = name, model = model, plate = plate, primarycolor= primarycolor, secondarycolor = secondarycolor, state = state})

      end
    end

    TriggerClientEvent('fours:DisplayVehicles', source, buttons)

  end)
end)

