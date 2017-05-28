require "resources/essentialmode/lib/MySQL"
-- MySQL:open("localhost", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

permission = {superadmin = 10, user = 0, admin = 9, moderateur = 6, helper = 4 -- je met ça en terme d'indiquation, j'utilise que le superadmin ici.
  }

RegisterServerEvent("jobs:wichone") -- return le job au client

function nameJob(id)
  RconPrint(tostring(id))
  local executed_query = MySQL:executeQuery("SELECT * FROM jobs WHERE job_id = '@namejob'", {['@namejob'] = id})
  local result = MySQL:getResults(executed_query, {'job_name'}, "job_id")
  return result[1].job_name
end

function updatejob(player, id)
  local job = id
  MySQL:executeQuery("UPDATE users SET `job`='@value' WHERE identifier = '@identifier'", {['@value'] = job, ['@identifier'] = player})
  TriggerClientEvent("recolt:updateJobs", source, job)
  TriggerClientEvent("service:updateJobs", source, job)
end

--RegisterServerEvent('jobs:updatejob')
--AddEventHandler('jobs:updatejob'), function(player)
--  local exec = MySQL:executeQuery("SELECT job FROM users WHERE identifier = '@identifier'", {['@identifier'] = player})
  --local result = MySQL  
--end)

--AddEventHandler('es:playerLoaded', function(source)
--TriggerEvent('es:getPlayerFromId', source, function(user)
--local jobName = nameJob(source)
--TriggerClientEvent("jobssystem:updateJob", source, jobName)
--end)
--end)

RegisterServerEvent('jobssystem:jobs')
AddEventHandler('jobssystem:jobs', function(id)
TriggerEvent('es:getPlayerFromId', source, function(user)
local player = user.identifier
local nameJob = nameJob(id)
updatejob(player, id)
--TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_STRIPCLUB_PR", 1, "Mairie", false, "Votre métier est maintenant : ".. nameJob)
TriggerClientEvent("jobssystem:updateJob", source, nameJob)
end)
end)

AddEventHandler('es:playerLoaded', function(source)
TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        local exec = MySQL:executeQuery("SELECT job FROM users WHERE identifier = '@identifier' ", {['@identifier'] = player})
        local result = MySQL:getResults(exec, {'job'}, "identifier")
        local jobName = nameJob(result[1].job)
TriggerClientEvent("jobssystem:updateJob", source, jobName)
end)
end)

AddEventHandler('es:playerLoaded', function(source)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        local exec = MySQL:executeQuery("SELECT job FROM users WHERE identifier = '@identifier' ", {['@identifier'] = player})
        local result = MySQL:getResults(exec, {'job'}, "identifier")
        TriggerClientEvent("recolt:updateJobs", source, result[1].job)
        TriggerClientEvent("service:onloaded", source, result[1].job)
    end)
end)

AddEventHandler("jobs:wichone", function(job_id) -- return le job au client
    TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local req = MySQL:executeQuery("SELECT job FROM users WHERE identifier = '@identifier' ", {['@identifier'] = player })
    local resultat = MySQL:getResults(req, {'job'}, "identifier")
    if job_id == resultat[1].job then
      retour = true
    else 
      retour = false
     end
    TriggerClientEvent("jobs:yesornot", source, retour)
   
   end)
end)

--[[TriggerEvent('es:addAdminCommand', 'jobadd', 100000, function(source, args, user) 
     if(not args[2]) then
    TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Usage : /jobadd [ID] [IDJOB]")  
    else
    if(GetPlayerName(tonumber(args[2])) ~= nil)then
      local player = tonumber(args[2])
      local id = tonumber(args[3])
      local nameJob = nameJob(id)
      MySQL:executeQuery("UPDATE users SET `job`='@value' WHERE identifier = '@identifier'", {['@value'] = id, ['@identifier'] = player})
      TriggerClientEvent("recolt:updateJobs", player, job)
      TriggerClientEvent("service:updateJobs", player, job)
      --TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_STRIPCLUB_PR", 1, "Mairie", false, "Votre métier est maintenant : ".. nameJob)
      TriggerClientEvent("jobssystem:updateJob", player, nameJob)
    else
      TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Aucun joueur avec cet id")
    end
  end
end, function(source, args, user) 
  TriggerClientEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Tu n'as pas la permission !")
end) --]]

TriggerEvent('es:addCommand', 'jobadd', 
  function(source, args, user)
    if user.permission >= permission.superadmin then
      TriggerClientEvent("Iphone:notif", source,"Tu n'es pas Administrateur")
      CancelEvent()
    else
      if #args-1 ~= 2 then
        TriggerClientEvent("Iphone:notif", source,"/jobadd [ServerID] [JobID]")
        CancelEvent()
      else
        if type(args[3]) == type(3) and type(args[2]) == type(3) then
          TriggerEvent("es:getPlayerFromId", args[2], function(targetUser)
            if targetUser ~= nil then
              UpdateJobViaCommand(targetUser.identifier, args[3], args[2])
            else
              TriggerClientEvent("Iphone:notif", source, "Je ne trouve pas l'ID : "..args[2].."sur le serveur."
            end

          end)
        end
      end
    end

  end)

function UpdateJobViaCommand(player, id, targetServerId) -- command = true si c'est la commande /jobadd qui est entré, sinon false
  local job = id

  MySQL:executeQuery("UPDATE users SET `job`='@value' WHERE identifier = '@identifier'", {['@value'] = job, ['@identifier'] = player})
  TriggerClientEvent("recolt:updateJobs", targetServerId, job)
  TriggerClientEvent("service:updateJobs", targetServerId, job)
end
 
