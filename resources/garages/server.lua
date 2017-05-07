require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('test:SelVeh')
RegisterServerEvent('test:CheckGarageForVeh')

-- Checks if the plate belongs to the user, if it does it updates the vehicle as in, then send the remove order to the client


AddEventHandler('test:CheckGarageForVeh', function()
  vehicles = {}
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier  
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'id','vehicle_model', 'vehicle_name', 'vehicle_state'}, "id")
    if (result) then
        for _, v in ipairs(result) do
                --print(v.vehicle_model)
                --print(v.vehicle_plate)
                --print(v.vehicle_state)
                --print(v.id)
            t = { ["id"] = v.id, ["vehicle_model"] = v.vehicle_model, ["vehicle_name"] = v.vehicle_name, ["vehicle_state"] = v.vehicle_state}
            table.insert(vehicles, tonumber(v.id), t)
        end
    end
  end)  
    --print(vehicles[1].id)
    --print(vehicles[2].vehicle_model)
    TriggerClientEvent('test:getVehicles', source, vehicles)
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
