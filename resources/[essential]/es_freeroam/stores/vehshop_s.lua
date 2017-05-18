require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('CheckMoneyForVeh')
RegisterServerEvent('BuyForVeh')
RegisterServerEvent('es:firstSpawn')

AddEventHandler('es:firstSpawn', function(source)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        local name = "Faggio"
        local vehicle = "faggio2"
        local price = 2000
        local plate = math.random(10000000, 99999999)
        local state = "in"
        local primarycolor = 0 
        local secondarycolor = 0 
        local pearlescentcolor = 3 
        local wheelcolor = 156
  
        local executed_query = MySQL:executeQuery("INSERT INTO user_vehicle (`identifier`, `vehicle_name`, `vehicle_model`, `vehicle_price`, `vehicle_plate`, `vehicle_state`, `vehicle_colorprimary`, `vehicle_colorsecondary`, `vehicle_pearlescentcolor`, `vehicle_wheelcolor`) VALUES ('@username', '@name', '@vehicle', '@price', '@plate', '@state', '@primarycolor', '@secondarycolor', '@pearlescentcolor', '@wheelcolor')",
                                                 {['@username'] = player, ['@name'] = name, ['@vehicle'] = vehicle, ['@price'] = price, ['@plate'] = plate, ['@state'] = state, ['@primarycolor'] = primarycolor, ['@secondarycolor'] = secondarycolor, ['@pearlescentcolor'] = pearlescentcolor, ['@wheelcolor'] = wheelcolor})  
 
  
    end)
end)


AddEventHandler('CheckMoneyForVeh', function(name, vehicle, price)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local vehicle = vehicle
    local name = name
    local price = tonumber(price)
    local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@username'",{['@username'] = player})
    local result = MySQL:getResults(executed_query, {'vehicle_model'})

    if (result) then
      count = 0
      for _ in pairs(result) do
        count = count + 1
      end
      if count == 15 then
          TriggerClientEvent("veh_s:notif", source, "Ton garage est ~r~Plein!~w~")
      else
        if (tonumber(user.money) >= tonumber(price)) then
          user:removeMoney((price))
          TriggerClientEvent('FinishMoneyCheckForVeh', source, name, vehicle, price)
          TriggerClientEvent("veh_s:notif", source, "Vehicule ~r~Livré!~w~")
        else
          TriggerClientEvent("veh_s:notif", source, "Tu n'as pas assez d'argent")
       end
      end
   else
      if (tonumber(user.money) >= tonumber(price)) then
        user:removeMoney((price))
        TriggerClientEvent('FinishMoneyCheckForVeh', source, name, vehicle, price)
        TriggerClientEvent("veh_s:notif", source, "Vehicule ~r~Livré!~w~")
      else
        TriggerClientEvent("veh_s:notif", source, "Tu n'as pas assez d'argent")
      end 
    end
  end)
end)

AddEventHandler('BuyForVeh', function(name, vehicle, price, plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    local price = price
    local vehicle = vehicle 
    local plate = plate
    local state = "out"
    local primarycolor = primarycolor
    local secondarycolor = secondarycolor
    local pearlescentcolor = pearlescentcolor
    local wheelcolor = wheelcolor
    local executed_query = MySQL:executeQuery("INSERT INTO user_vehicle (`identifier`, `vehicle_name`, `vehicle_model`, `vehicle_price`, `vehicle_plate`, `vehicle_state`, `vehicle_colorprimary`, `vehicle_colorsecondary`, `vehicle_pearlescentcolor`, `vehicle_wheelcolor`) VALUES ('@username', '@name', '@vehicle', '@price', '@plate', '@state', '@primarycolor', '@secondarycolor', '@pearlescentcolor', '@wheelcolor')",
    {['@username'] = player, ['@name'] = name, ['@vehicle'] = vehicle, ['@price'] = price, ['@plate'] = plate, ['@state'] = state, ['@primarycolor'] = primarycolor, ['@secondarycolor'] = secondarycolor, ['@pearlescentcolor'] = pearlescentcolor, ['@wheelcolor'] = wheelcolor})
  end)
end)
