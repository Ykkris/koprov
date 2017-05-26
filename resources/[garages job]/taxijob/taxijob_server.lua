RegisterServerEvent("taxi:getpaid")
AddEventHandler("taxi:getpaid", function(paid)
    -- prendre la source -> user -> user:addMoney()
  TriggerEvent('es:getPlayerFromId', source, function(user)
        local finalpaid = math.ceil(paid)
        user:addMoney(finalpaid)
    
  end)
  
end)
