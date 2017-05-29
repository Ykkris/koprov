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
  TriggerEvent('es:getPlayerFromId', source, function(user)

    local player = user.identifier
    service = user:getSessionVar("service")
    local req = MySQL:executeQuery("SELECT job FROM users WHERE identifier = '@identifier' ", {['@identifier'] = player })
    local resultat = MySQL:getResults(req, {'job'}, "identifier")
    print(tostring(resultat[1].job))
    if  (1 == service)  then
      TriggerEvent("log:addLogServer","FrFuel" ,"INFO" ,"Player do'nt paid (inservice) : " .. user.identifier .. " amount : " .. tostring(prix))
      TriggerClientEvent("pNotify:SendNotification", source, { text = "Facture de <b style='color:green'>".. prix.."$</b> prise en charge pas l'état !", type = "info", timeout = 10000, layout = "centerLeft",})
    else
      TriggerEvent("log:addLogServer","FrFuel" ,"INFO" ,"Player paid : " .. user.identifier .. " amount : " .. tostring(prix))
      user:removeMoney(prix)
    end        
  end)
end)

