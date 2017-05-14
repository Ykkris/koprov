database = {
    host = "127.0.0.1",
    name = "gta5_gamemode_essential",
    username = "root",
    password = "5M32bNCpFdgG"
}

require "resources/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)

local isMedic = false 

RegisterNetEvent('medic:receiveIsMedic')
AddEventHandler('medic:receiveIsMedic', function(result)
	if(result == "inconnu") then
		isMedic = false
	else
		isMedic = true 
	end
end)

RegisterServerEvent("essence:payer")
AddEventHandler("essence:payer", function(litres) -- source, litres en float
  local prix = math.ceil(litres)
  TriggerEvent('es:getPlayerFromId', source, function(user)
  	if(isMedic == false) then
        user:removeMoney(prix)
    else
    	TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Facture prise en charge par l'etat !")
    end  
  end)
end)
