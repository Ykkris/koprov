RegisterServerEvent("pizza:getpaid")
AddEventHandler("pizza:getpaid", function()
    -- prendre la source -> user -> user:addMoney()
  TriggerEvent('es:getPlayerFromId', source, function(user)
        user:addMoney(25)
    
  end)
  
end)
