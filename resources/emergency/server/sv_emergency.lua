--[[
################################################################
- Creator: Jyben
- Date: 02/05/2017
- Url: https://github.com/Jyben/emergency
- Licence: Apache 2.0
################################################################
--]]

require "resources/essentialmode/lib/MySQL"

-- MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

--ADD EMS job from admin
function addEMS(identifier)
  MySQL:executeQuery("INSERT INTO ems (`identifier`) VALUES ('@identifier')", { ['@identifier'] = identifier})
  TriggerEvent("log:addLogServer","Emergency" ,"INFO" ,"Player set as EMS : "..identifier)
end

function remEMS(identifier)
  MySQL:executeQuery("DELETE FROM ems WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
  TriggerEvent("log:addLogServer","Emergency" ,"INFO" ,"Player remove from EMS : "..identifier)
end

function checkIsEMS(identifier)
  local query = MySQL:executeQuery("SELECT * FROM ems WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
  local result = MySQL:getResults(query, {'rank'}, "identifier")
  
  if(not result[1]) then
    TriggerClientEvent('ems:receiveIsEMS', source, "inconnu")
  else
    TriggerClientEvent('ems:receiveIsEMS', source, result[1].rank)
  end
end

function s_checkIsEMS(identifier)
  local query = MySQL:executeQuery("SELECT * FROM ems WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
  local result = MySQL:getResults(query, {'rank'}, "identifier")
  
  if(not result[1]) then
    return "nil"
  else
    return result[1].rank
  end
end

RegisterServerEvent('ems:checkIsEMS')
AddEventHandler('ems:checkIsEMS', function()
  TriggerEvent("es:getPlayerFromId", source, function(user)
    local identifier = user.identifier
    checkIsEMS(identifier)
  end)
end)

--ADD EMS job from admin

-- Admin CMD
--
--

TriggerEvent('es:addGroupCommand', 'emsadd', "admin", function(source, args, user)
     if(not args[2]) then
    TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Usage : /emsadd [ID]")  
  else
    if(GetPlayerName(tonumber(args[2])) ~= nil)then
      local player = tonumber(args[2])
      TriggerEvent("es:getPlayerFromId", player, function(target)
        addEMS(target.identifier)
        TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Roger that !")
        TriggerClientEvent("es_freeroam:notify", player, "CHAR_ANDREAS", 1, "Government", false, "Congrats, you have been made a medic!")
        TriggerClientEvent('ems:nowEMS', player)
      end)
    else
      TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "No player with this ID !")
    end
  end
end, function(source, args, user) 
  TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "You haven't the permission to do that !")
end)

TriggerEvent('es:addGroupCommand', 'emsrem', "admin", function(source, args, user) 
     if(not args[2]) then
    TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Usage : /emsrem [ID]")  
  else
    if(GetPlayerName(tonumber(args[2])) ~= nil)then
      local player = tonumber(args[2])
      TriggerEvent("es:getPlayerFromId", player, function(target)
        remEMS(target.identifier)
        TriggerClientEvent("es_freeroam:notify", player, "CHAR_ANDREAS", 1, "Government", false, "You're no longer a medic!")
        TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "Roger that !")
        TriggerClientEvent('ems:noLongerEMS', player)
      end)
    else
      TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "No player with this ID !")
    end
  end
end, function(source, args, user) 
  TriggerClientEvent('chatMessage', source, 'GOVERNMENT', {255, 0, 0}, "You haven't the permission to do that !")
end)

--
--
---- Admin CMD

RegisterServerEvent('es_em:sendEmergency')
AddEventHandler('es_em:sendEmergency',
  function(reason, playerIDInComa, x, y, z)
    TriggerEvent("es:getPlayers", function(players)
      TriggerEvent("log:addLogServer","Emergency" ,"INFO" ,"Player ask for Ambulance : "..players[source].identifier .. " reason : " .. reason .. " at coords : " .. " X = " .. tostring(x) .. " Y = " .. tostring(y)  .. " Z = " tostring(z))
      for i,v in pairs(players) do
        TriggerClientEvent('es_em:sendEmergencyToDocs', i, reason, playerIDInComa, x, y, z, source)
      end
    end)
  end
)

RegisterServerEvent('es_em:getTheCall')
AddEventHandler('es_em:getTheCall',
  function(playerName, playerID, x, y, z, sourcePlayerInComa)
    TriggerEvent("es:getPlayers", function(players)
      for i,v in pairs(players) do
        TriggerClientEvent('es_em:callTaken', i, playerName, playerID, x, y, z, sourcePlayerInComa)
      end
    end)
  end
)

RegisterServerEvent('es_em:sv_resurectPlayer')
AddEventHandler('es_em:sv_resurectPlayer',
  function(sourcePlayerInComa)
    TriggerClientEvent('es_em:cl_resurectPlayer', sourcePlayerInComa)
  end
)

RegisterServerEvent('es_em:sv_getJobId')
AddEventHandler('es_em:sv_getJobId',
  function()
    TriggerClientEvent('es_em:cl_setJobId', source, GetJobId(source))
  end
)

RegisterServerEvent('es_em:sv_getDocConnected')
AddEventHandler('es_em:sv_getDocConnected',
  function()
    TriggerEvent("es:getPlayers", function(players)
      local identifier
      local table = {}
      local isConnected = false

      for i,v in pairs(players) do
        identifier = GetPlayerIdentifiers(i)
        if (identifier ~= nil) then
          local executed_query = MySQL:executeQuery("SELECT identifier, job_id, job_name FROM users LEFT JOIN jobs ON jobs.job_id = users.job WHERE users.identifier = '@identifier' AND job_id = 3 AND enService = 1", {['@identifier'] = identifier[1]})
          local result = MySQL:getResults(executed_query, {'job_id'}, "identifier")

          if (result[1] ~= nil) then
            TriggerEvent("log:addLogServer","Emergency" ,"INFO" ,"Player receive Doc is Connected : "..players[source].identifier)
            isConnected = true
          end
        end
      end
      TriggerClientEvent('es_em:cl_getDocConnected', source, isConnected)
    end)
  end
)

RegisterServerEvent('es_em:sv_setService')
AddEventHandler('es_em:sv_setService',
  function(service)
    TriggerEvent('es:getPlayerFromId', source,
      function(user)
        TriggerEvent("log:addLogServer","Emergency" ,"INFO" ,"Medic took service : "..user.identifier)
        local executed_query = MySQL:executeQuery("UPDATE users SET enService = @service WHERE users.identifier = '@identifier'", {['@identifier'] = user.identifier, ['@service'] = service})
      end
    )
  end
)

RegisterServerEvent('es_em:sv_removeMoney')
AddEventHandler('es_em:sv_removeMoney',
  function()
    TriggerEvent("es:getPlayerFromId", source,
      function(user)
        if(user)then
          if user.money > 0 then
            TriggerEvent("log:addLogServer","Emergency" ,"INFO" ,"Player lost money, dirty_money, items : "..user.identifier)
            user:setMoney(0)
            user:setDirty_Money(0)
          	-- This part requires the mod vdk_inventory
          	TriggerEvent("item:resetoncoma", source)
        end
      end
     end
    )
  end
)

RegisterServerEvent('es_em:sv_sendMessageToPlayerInComa')
AddEventHandler('es_em:sv_sendMessageToPlayerInComa',
  function(sourcePlayerInComa)
    TriggerClientEvent('es_em:cl_sendMessageToPlayerInComa', sourcePlayerInComa)
    TriggerEvent("es:getPlayerFromId", sourcePlayerInComa, function(user)
      TriggerEvent("log:addLogServer","Emergency" ,"INFO" ,"Player receive Ambulance : "..user.identifier)
    end)
  end
)

AddEventHandler('playerDropped', function()
  TriggerEvent('es:getPlayerFromId', source,
    function(user)
      local executed_query = MySQL:executeQuery("UPDATE users SET enService = 0 WHERE users.identifier = '@identifier'", {['@identifier'] = user.identifier})
    end
  )
end)

TriggerEvent('es:addCommand', 'respawn', function(source, args, user)
  TriggerClientEvent('es_em:cl_respawn', source)
end)

RegisterServerEvent('es_em:healPlayer')
AddEventHandler('es_em:healPlayer', function(target_id)
  TriggerEvent("es:getPlayers", function(Users)
    TriggerEvent("log:addLogServer","Emergency" ,"INFO" ,"Medic heal player : "..Users[source].identifier .. " player : " .. Users[target_id].identifier )
  end)
  TriggerClientEvent('es_em:healPlayer', target_id)
end)

function GetJobId(source)
  local jobId = -1

  TriggerEvent('es:getPlayerFromId', source,
    function(user)
      local executed_query = MySQL:executeQuery("SELECT identifier, job_id, job_name FROM users LEFT JOIN jobs ON jobs.job_id = users.job WHERE users.identifier = '@identifier' AND job_id IS NOT NULL", {['@identifier'] = user.identifier})
      local result = MySQL:getResults(executed_query, {'job_id'}, "identifier")

      if (result[1] ~= nil) then
        jobId = result[1].job_id
      end
    end
  )

  return jobId
end
