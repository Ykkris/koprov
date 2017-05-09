require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

function nameJob(player)
  local executed_query = MySQL:executeQuery("SELECT identifier, job_id, job_name FROM users LEFT JOIN jobs ON jobs.job_id = users.job WHERE users.identifier = '@identifier'", {['@identifier'] = player})
  local result = MySQL:getResults(executed_query, {'job_name'}, "identifier")
  return tostring(result[1].job_name)
end

RegisterServerEvent('ambulance:s_ambulance')
AddEventHandler('ambulance:s_ambulance', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local namejob = nameJob(player)
    -- NAME OF YOUR JOB
    if namejob == "Médecin" then
      TriggerClientEvent('ambulance:c_ambulance', source)
      TriggerClientEvent('workedambu', source)
    else
      TriggerClientEvent('notworkedambu', source)
    end
  end)
end)