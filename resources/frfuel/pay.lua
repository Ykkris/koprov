database = {
    host = "127.0.0.1",
    name = "gta5_gamemode_essential",
    username = "root",
    password = "5M32bNCpFdgG"
}

require "resources/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)

RegisterServerEvent("essence:payer")
AddEventHandler("essence:payer", function(litres) -- source, litres en float
  local prix = litres
  TriggerEvent('es:getPlayerFromId', source, function(user)
        user:removeMoney(prix)
  
  end)
end)
