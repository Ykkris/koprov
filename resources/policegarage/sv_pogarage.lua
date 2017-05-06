require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

-- HELPER FUNCTIONS
function nameJob(player)
  local executed_query = MySQL:executeQuery("SELECT identifier, job_id, job_name FROM users LEFT JOIN jobs ON jobs.job_id = users.job WHERE users.identifier = '@identifier'", {['@identifier'] = player})
  local result = MySQL:getResults(executed_query, {'job_name'}, "identifier")
  return tostring(result[1].job_name)
end


-- V2
RegisterServerEvent('policeg:s_classic')
RegisterServerEvent('policeg:s_moto')
RegisterServerEvent('policeg:s_fila')
RegisterServerEvent('policeg:s_truck')
RegisterServerEvent('policeg:s_helico')
RegisterServerEvent('policeg:s_stanier')
RegisterServerEvent('policeg:s_buffalo')

AddEventHandler('policeg:s_classic', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local namejob = nameJob(player)
    -- NAME OF YOUR JOB
    if namejob == "Police" then
      TriggerClientEvent('policeg:c_classic', source)
      TriggerClientEvent('worked', source)
    else
      TriggerClientEvent('notworked', source)
    end
  end)
end)

AddEventHandler('policeg:s_truck', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local namejob = nameJob(player)
    -- NAME OF YOUR JOB
    if namejob == "Police" then
      TriggerClientEvent('policeg:c_truck', source)
      TriggerClientEvent('worked', source)
    else
      TriggerClientEvent('notworked', source)
    end
  end)
end)

AddEventHandler('policeg:s_moto', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local namejob = nameJob(player)
    -- NAME OF YOUR JOB
    if namejob == "Police" then
      TriggerClientEvent('policeg:c_moto', source)
      TriggerClientEvent('worked', source)
    else
      TriggerClientEvent('notworked', source)
    end
  end)
end)

AddEventHandler('policeg:s_fila', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local namejob = nameJob(player)
    -- NAME OF YOUR JOB
    if namejob == "Police" then
      TriggerClientEvent('policeg:c_fila', source)
      TriggerClientEvent('worked', source)
    else
      TriggerClientEvent('notworked', source)
    end
  end)
end)

AddEventHandler('policeg:s_helico', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local namejob = nameJob(player)
    -- NAME OF YOUR JOB
    if namejob == "Police" then
      TriggerClientEvent('policeg:c_helico', source)
      TriggerClientEvent('worked', source)
    else
      TriggerClientEvent('notworked', source)
    end
  end)
end)

AddEventHandler('policeg:s_stanier', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local namejob = nameJob(player)
    -- NAME OF YOUR JOB
    if namejob == "Police" then
      TriggerClientEvent('policeg:c_stanier', source)
      TriggerClientEvent('worked', source)
    else
      TriggerClientEvent('notworked', source)
    end
  end)
end)

AddEventHandler('policeg:s_buffalo', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local namejob = nameJob(player)
    -- NAME OF YOUR JOB
    if namejob == "Police" then
      TriggerClientEvent('policeg:c_buffalo', source)
      TriggerClientEvent('worked', source)
    else
      TriggerClientEvent('notworked', source)
    end
  end)
end)