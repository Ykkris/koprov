require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('test:CheckForVeh')
RegisterServerEvent('test:CheckForSelVeh')
RegisterServerEvent('test:SelVeh')

local vehicles = {}

AddEventHandler('test:CheckForSelVeh', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local state = "Sortit"
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username' AND vehicle_state ='@state'",{['@username'] = player, ['@vehicle'] = vehicle, ['@state'] = state})
    local result = MySQL:getResults(executed_query, {'vehicle_model', 'vehicle_plate'}, "identifier")
    if(result)then
      for k,v in ipairs(result)do
        vehicle = vehicle_model.v
        plate = vehicle_plate.v
      local vehicle = vehicle
      local plate = plate
      end
    end
     RconPrint("vehicle " .. tostring(vehicle))
     RconPrint("plate " .. tostring(plate))
    TriggerClientEvent('test:SelVehicle', source, vehicle, plate)
  end)
end)

AddEventHandler('test:SelVeh', function(plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local plate = plate

    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username' AND vehicle_plate ='@plate'",{['@username'] = player, ['@vehicle'] = vehicle, ['@plate'] = plate})
    local result = MySQL:getResults(executed_query, {'vehicle_price'}, "identifier")
    if(result)then
      for k,v in ipairs(result)do
        price = v.vehicle_price
      local price = price / 2      
      user:addMoney((price))
      end
    end
    local executed_query = MySQL:executeQuery("DELETE from user_vehicle WHERE identifier = '@username' AND vehicle_plate = '@plate'",
      {['@username'] = player, ['@plate'] = plate})
    TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Véhicule vendu!\n")
  end)
end)
