database = {
    host = "127.0.0.1",
    name = "gta5_gamemode_essential",
    username = "root",
    password = "5M32bNCpFdgG"
}

require "resources/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)

--local isMedic = false 

--RegisterNetEvent('medic:receiveIsMedic')
--AddEventHandler('medic:receiveIsMedic', function(result)
--	if(result == "inconnu") then
--		isMedic = false
--	else
--		isMedic = true 
--	end
--end)


RegisterServerEvent("essence:payer") -- IL FAUDRAIT AUSSI VERIFIER S'IL/ELLE EST EN SERVICE
AddEventHandler("essence:payer", function(litres) -- source, litres en float
  local prix = math.ceil(litres)
  TriggerEvent('es:getPlayerFromId', source, function(user)
	local id_medecin = VARIABLE_A_CHANGER
	local id_policier = VARIABLE_A_CHANGER
	local player = user.identifier
    	local req = MySQL:executeQuery("SELECT job FROM users WHERE identifier = '@identifier' ", {['@identifier'] = player })
    	local resultat = MySQL:getResults(req, {'job'}, "identifier")
    	if (id_medecin == resultat[1].job) or (id_policier == resultat[1].job)  then
      		retour = true
    	else 
      		retour = false
     	end
				
	if retour then
		TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Facture prise en charge par l'etat !")
	else
		user:removeMoney(prix)
    end  
  end)
end)
