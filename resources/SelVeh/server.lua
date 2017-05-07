require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('test:CheckForVeh')
RegisterServerEvent('test:CheckForSelVeh')
RegisterServerEvent('test:SelVeh')
RegisterServerEvent('test:CheckGarageForVeh')

local vehicles = {}

AddEventHandler('test:CheckForSelVeh', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local state = "out"
    local player = user.identifier
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username' AND vehicle_state ='@state'",{['@username'] = player, ['@state'] = state})
    local result = MySQL:getResults(executed_query, {'vehicle_model'}, "identifier")
    local executed_query2 = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username' AND vehicle_state ='@state'",{['@username'] = player, ['@state'] = state})
    local result2 = MySQL:getResults(executed_query2, {'vehicle_plate'}, "identifier")
    TriggerClientEvent('test:SelVehicle', source, result, result2)
         
  end)
end)

AddEventHandler('test:SelVeh', function(plate)
  TriggerEvent('es:getPlayerFromId', source, function(user)
         player = user.identifier
         RconPrint(tostring(plate))

    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username' AND vehicle_plate ='@plate'",{['@username'] = player, ['@plate'] = plate})
    local result = MySQL:getResults(executed_query, {'vehicle_price'}, "identifier")
    if(result)then
       price = result[1].vehicle_price
       price = price / 2
       RconPrint(tostring(price))
       deposit(player, price)
       Rconprint(tostring(player))

    end
    local executed_query = MySQL:executeQuery("DELETE from user_vehicle WHERE identifier = '@username' AND vehicle_plate = '@plate'",
      {['@username'] = player, ['@plate'] = plate})
    TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Simeon", false, "Véhicule vendu!\n")
  end)
end)

function deposit(player, amount)
  user:addmoney(tonumber(amout))
  MySQL:executeQuery("UPDATE users SET `money`='@value' WHERE identifier = '@identifier'", {['@value'] = amount, ['@identifier'] = player})
end

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
end)
