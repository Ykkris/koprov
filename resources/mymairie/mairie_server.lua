require "resources/essentialmode/lib/MySQL"
-- MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

local function GenerateUniqueMatriculeNumber()

	local foundNumber = false
	local matriculeNumber = nil

	while not foundNumber do

		local base = "KPR-"
		matriculeNumber = math.random(10000, 99999)
		matriculeNumber = base..tostring(matriculeNumber)

		local executed_query = MySQL:executeQuery("SELECT COUNT(*) as count FROM users WHERE matricule = '@matriculeNumber'", {['@matriculeNumber'] = matriculeNumber})
		local result         = MySQL:getResults(executed_query, {'count'})
		local count          = tonumber(result[1].count)

		if count == 0 then
			foundNumber = true
		end
	end

	return matriculeNumber
end 

AddEventHandler('es:playerLoaded', function(source)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result         = MySQL:getResults(executed_query, {'matricule'})
		local matriculeNumber    = result[1].matricule

		if matriculeNumber == nil then
			TriggerEvent("log:addLogServer", "MyMairie", "INFO", "Player : " ..user.identifier .. " generating matricule ")
			matriculeNumber = GenerateUniqueMatriculeNumber()
			MySQL:executeQuery("UPDATE users SET matricule = '@matricule' WHERE identifier = '@identifier'", {['@identifier'] = user.identifier, ['@matricule'] = matriculeNumber})
		end

		user:setSessionVar("matricule", matriculeNumber)
	end)
end)



RegisterServerEvent("mymairie:identity")
AddEventHandler("mymairie:identity",function(prenom, nom, age)
	TriggerEvent('es:getPlayerFromId', source, function(user)
	
	user:removeMoney(100)
	user:setSessionVar("name", {first_name = prenom,
				    last_name = nom
				    })
	TriggerEvent("log:addLogServer", "MyMairie", "INFO", "Player : " ..user.identifier .. " change his name to " .. prenom .. " " .. nom .. " age : " .. tostring(age))
	MySQL:executeQuery("UPDATE users SET last_name = '@last_name', first_name = '@first_name', age = '@age' WHERE identifier = '@identifier' ",
					{['@last_name'] = nom , ['@first_name'] = prenom , ['@age'] = age, ['@identifier'] = user.identifier})
				
	end)
		

end)
