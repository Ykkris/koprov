-- This is Koprov team proprety. --
-- You can use it, share it and modify it BUT you're not allowed to make benefit with it. --
-- Contact us for more informations at koprov.fr --
require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")


RegisterServerEvent('service:connectedbyid')
AddEventHandler('service:connectedbyid',
  function(id_service)
    TriggerEvent("es:getPlayers", function(players)
      local identifier
      local table = {}
      local isConnected = false

      if id_service == 2 or id_service == 3 then -- On check si c'est un flic/medic ou si c'est un autre pour le enservice ;)
      	inService = 1
      else 
      	inService = 0
      end

      for i,v in pairs(players) do
        identifier = GetPlayerIdentifiers(i)
        if (identifier ~= nil) then
          local executed_query = MySQL:executeQuery("SELECT identifier, job_id, job_name FROM users LEFT JOIN jobs ON jobs.job_id = users.job WHERE users.identifier = '@identifier' AND job_id = '@service_id' AND enService = '@enService'", {['@identifier'] = identifier[1], ['@service_id'] = id_service, ['@enService'] = inService })
          local result = MySQL:getResults(executed_query, {'job_id'}, "identifier")

          if (result[1] ~= nil) then
            isConnected = true
          end
        end
      end
      if id_service == 2 then
      	TriggerClientEvent("services:cbcopconnected", source,  isConnected)
      elseif id_service == 3 then
      	TriggerClientEvent("services:cbmedconnected", source ,isConnected)
      elseif id_service == 9 then
      	TriggerClientEvent("services:cbtaxconnected", source, isConnected)
      elseif id_service == 4 then
      	TriggerClientEvent("services:cbdepconnected", source, isConnected)
      end
    end)
  end)

RegisterServerEvent('service:sendservice')
AddEventHandler('service:sendservice',
  function(service_id , playersender, x, y, z)
    TriggerEvent("es:getPlayers", function(players)
      for i,v in pairs(players) do
        TriggerClientEvent('service:sendserviceto', i, service_id, playersender, x, y, z, source)
      end
    end)
  end
) 

RegisterServerEvent('service:takecall')
AddEventHandler('service:takecall', function(service_id , playerName , playerID, x, y, z, sourcePlayerInComa)

TriggerEvent("es:getPlayers", function(players)
      for i,v in pairs(players) do
      	RconPrint("test")
        TriggerClientEvent('service:calltaken', i, service_id, playerName, playerID, x, y, z, sourcePlayerInComa)
      end
    end)
  end
) 
 

RegisterServerEvent('service:ssendnotifservicesencer')
AddEventHandler('service:ssendnotifservicesencer',
  function(sourceplayersender, service_id)
    TriggerClientEvent('service:csendnotifservicesencer', sourceplayersender, service_id)
  end
)



