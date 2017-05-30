-- Loading MySQL Class
require "resources/essentialmode/lib/MySQL"
-- MySQL:open("localhost", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  TriggerEvent('es:getPlayerFromId', source, function(user)
    -- Ajout de l'argent à l'utilisateur
    local user_id = user.identifier
    -- Requête qui permet de recuperer le métier de l'utilisateur
    local executed_query = MySQL:executeQuery("SELECT salary, job FROM users INNER JOIN jobs ON users.job = jobs.job_id WHERE identifier = '@username'",{['@username'] = user_id})
    local result = MySQL:getResults(executed_query, {'salary', 'job'}, "identifier")
    local salary_job = result[1].salary
    local job = result[1].job

    if (job == 2 or job == 3 or job == 4 or job == 11) then
      user:addMoney(salary_job)
	-- TriggerEvent("log:addLogServer", "PayCheck", "INFO", "Player : " ..user.identifier .. " receive his paycheck ".. tostring(salary_job))
      --TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Salaire metier reçu : + "..salary_job.." ~g~$")
      TriggerClientEvent("pNotify:SendNotification", source, { 
        text = "Tu as reçu ta paye de <b style='color:green'>".. salary_job .."$</b>", 
        type = "info", 
        timeout = 5000, 
        layout = "centerLeft",
      })
	  else
      --TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "~r~Vous n'avez pas de salaire fixe.")
    end
  end)
end)
