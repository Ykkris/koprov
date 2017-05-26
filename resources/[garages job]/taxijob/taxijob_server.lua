RegisterServerEvent("taxi:getpaid")
AddEventHandler("taxi:getpaid", function(paid)
    -- prendre la source -> user -> user:addMoney()
  TriggerEvent('es:getPlayerFromId', source, function(user)
        user:addMoney(paid)
    
  end)
  
end)
