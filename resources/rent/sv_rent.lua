require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('rent:fagg')
AddEventHandler('rent:fagg', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier

      TriggerClientEvent('rent:spawn', source)
  end)
end)

RegisterServerEvent('rent:ToPay')
AddEventHandler('rent:ToPay', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Vous avez payé 50$ de frais de location")
    user:removeMoney(50)
    end)
end)