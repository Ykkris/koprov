require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent("jobs:wichone") -- return le job au client

function nameJob(id)
  local executed_query = MySQL:executeQuery("SELECT * FROM jobs WHERE job_id = '@namejob'", {['@namejob'] = id})
  local result = MySQL:getResults(executed_query, {'job_name'}, "job_id")
  return result[1].job_name
end

function updatejob(player, id)
  local job = id
  MySQL:executeQuery("UPDATE users SET `job`='@value' WHERE identifier = '@identifier'", {['@value'] = job, ['@identifier'] = player})
  TriggerClientEvent("recolt:updateJobs", source, job)
end

--RegisterServerEvent('jobs:updatejob')
--AddEventHandler('jobs:updatejob'), function(player)
--  local exec = MySQL:executeQuery("SELECT job FROM users WHERE identifier = '@identifier'", {['@identifier'] = player})
  --local result = MySQL  
--end)

AddEventHandler('es:playerLoaded', function(source)
TriggerEvent('es:getPlayerFromId', source, function(user)
local jobName = nameJob(source)
TriggerClientEvent("jobssystem:updateJob", source, jobName)
end)
end)

RegisterServerEvent('jobssystem:jobs')
AddEventHandler('jobssystem:jobs', function(id)
TriggerEvent('es:getPlayerFromId', source, function(user)
local player = user.identifier
local nameJob = nameJob(id)
updatejob(player, id)
TriggerClientEvent("es_freeroam:notify", source, "CHAR_MP_STRIPCLUB_PR", 1, "Mairie", false, "Votre métier est maintenant : ".. nameJob)
TriggerClientEvent("jobssystem:updateJob", source, nameJob)
end)
end)

AddEventHandler('es:playerLoaded', function(source)
TriggerEvent('es:getPlayerFromId', source, function(user)
local jobName = nameJob(source)
TriggerClientEvent("jobssystem:updateJob", source, jobName)
end)
end)

AddEventHandler('es:playerLoaded', function(source)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        local exec = MySQL:executeQuery("SELECT job FROM users WHERE identifier = '@identifier' ", {['@identifier'] = player})
        local result = MySQL:getResults(exec, {'job'}, "identifier")
        TriggerClientEvent("recolt:updateJobs", source, result[1].job)
    end)
end)

AddEventHandler("jobs:wichone", function(job_id) -- return le job au client
    local player = user.identifier
    local req = MySQL:executeQuery("SELECT job from users WHERE identifier = '@identifier' ", {['@identifier'] = player })
    local resultat = MySQL:getResults(exec, {'job'}, "identifier")
    if job_id == resultat[1] then
      local retour = true
    else 
      local retour = false
    TrigerClientEvent("jobs:yesornot", sender, retour)
end)
 
