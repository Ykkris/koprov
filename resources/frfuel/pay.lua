require "resources/essentialmode/lib/MySQL"

--database = {
--    host = "127.0.0.1",
--    name = "gta5_gamemode_essential",
--    username = "root",
--    password = "5M32bNCpFdgG"
--}

--MySQL:open(database.host, database.name, database.username, database.password)

--local isMedic = false 

--RegisterNetEvent('medic:receiveIsMedic')
--AddEventHandler('medic:receiveIsMedic', function(result)
--  if(result == "inconnu") then
--    isMedic = false
--  else
--    isMedic = true 
--  end
--end)
RegisterServerEvent("frfuel:fuelAdded")

RegisterServerEvent("essence:payer") -- IL FAUDRAIT AUSSI VERIFIER S'IL/ELLE EST EN SERVICE
AddEventHandler("essence:payer", function(litres) -- source, litres en float
  local prix = math.ceil(litres)
  --TriggerEvent('police:checkService', source, function(inserv)
    TriggerEvent('es:getPlayerFromId', source, function(user)

      local player = user.identifier
      --local copinservice = inserv
      local req = MySQL:executeQuery("SELECT job FROM users WHERE identifier = '@identifier' ", {['@identifier'] = player })
      local resultat = MySQL:getResults(req, {'job'}, "identifier")
      if (3 == resultat[1].job) or (2 == resultat[1].job) then --and (copinservice)  
        retour = true
      else 
        retour = false
      end        
      if retour then
        --TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Facture prise en charge par l'etat !")
        TriggerClientEvent("pNotify:SendNotification", source, { text = "Facture de <b style='color:green'>".. prix.."$</b> prise en charge pas l'état !", type = "info", timeout = 10000, layout = "centerLeft",})
      else
        user:removeMoney(prix)
      end 
  end)
--end)
end)
