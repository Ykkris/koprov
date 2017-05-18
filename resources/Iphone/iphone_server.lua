-- This is Koprov team proprety. --
-- You can use it, share it and modify it BUT you're not allowed to make benefit with it. --
-- Contact us for more informations at koprov.fr --
require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

local function GenerateUniquePhoneNumber()

	local foundNumber = false
	local phoneNumber = nil

	while not foundNumber do

		local base = "555-"
		phoneNumber = math.random(1000, 9999)
		phoneNumber = base..tostring(phoneNumber)

		local executed_query = MySQL:executeQuery("SELECT COUNT(*) as count FROM users WHERE phone_number = '@phoneNumber'", {['@phoneNumber'] = phoneNumber})
		local result         = MySQL:getResults(executed_query, {'count'})
		local count          = tonumber(result[1].count)

		if count == 0 then
			foundNumber = true
		end

	end

	return phoneNumber

end 


AddEventHandler('es:playerLoaded', function(source)

	local _source = source

	TriggerEvent('es:getPlayerFromId', source, function(user)

		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result         = MySQL:getResults(executed_query, {'phone_number'})
		local phoneNumber    = result[1].phone_number

		if phoneNumber == nil then
			phoneNumber = GenerateUniquePhoneNumber()
			MySQL:executeQuery("UPDATE users SET phone_number = '@phone_number' WHERE identifier = '@identifier'", {['@identifier'] = user.identifier, ['@phone_number'] = phoneNumber})
		end

		Users[source].phone_number = phoneNumber

		local contacts = {}

		local executed_query2 = MySQL:executeQuery("SELECT contacts FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result2         = MySQL:getResults(executed_query2, {'name', 'number'})

		for i=1, #result2, 1 do
			
			table.insert(contacts, {
				name   = result2[i].name,
				number = result2[i].number,
				})

		end

		Users[source].contacts = contacts

		local sms = {}

		local executed_query3 = MySQL:executeQuery("SELECT sms FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result3         = MySQL:getResults(executed_query2, {'sms'})

		for i=1, #result3, 1 do
			
			table.insert(sms, {
				name   = result3[i].name,
				--number = result3[i].number,		Si pour plus tard on veut avoir le numéro d'un sms anonyme	
				text   = result3[i].text
				})

		end


		TriggerClientEvent('Iphone:loaded', _source, phoneNumber, contacts, sms)

		end)
	end)

RegisterServerEvent("Iphone:addcontact")
AddEventHandler("Iphone:addcontact",function(pname, pnumber)


		TriggerEvent('es:getPlayerFromId', source ,function(user)
			


			table.insert(Users[source].contacts, {
				name   = pname,
				number = pnumber,
			})

			MySQL:executeQuery("INSERT INTO users (contacts) VALUES ('@contacts') WHERE identifier = '@identifier' ", {['@contacts'] = Users[source].contacts, ['@identifier'] = Users[source].identifier})
		end)

end)	



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

--[[sms = {
	{test, test2, test3},
	{test1, test2, test3},
	{papatiti, caca, pipi }

	}

	for i, #sms[1] do
		name = sms[1][i]
		number = sms[2][i]
		text = sms[3][i]
		end]]

