-- This is Koprov team proprety. --
-- You can use it, share it and modify it BUT you're not allowed to make benefit with it. --
-- Contact us for more informations at koprov.fr --
require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

first = true
saveTime = 900000 -- in ms


AddEventHandler("es:playerLoaded", function(resource)
	if first then
		first = false
		InitSave()
	end
end)

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

--[[
to play rugby = faire du ruby ~= practise 
to do an internship = faire un stage; stagière : intern
programmnig = programmation
roommate = coloc; flatmate




]]

--RegisterServerEvent("Iphone:savesms")
--AddEventHandler("Iphone:savesms",function(actualSms)
	--TriggerEvent("es:getPlayerFromId", source, function(user)
		--user:setSessionVar("sms", actualSms) -- IL FAUT FAIRE SAUVERGARDER LES SMS ICI


	--end)
--end)

AddEventHandler('es:playerLoaded', function(source)

	TriggerEvent('es:getPlayerFromId', source, function(user)

		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result         = MySQL:getResults(executed_query, {'phone_number'})
		local phoneNumber    = result[1].phone_number

		if phoneNumber == nil then
			phoneNumber = GenerateUniquePhoneNumber()
			MySQL:executeQuery("UPDATE users SET phone_number = '@phone_number' WHERE identifier = '@identifier'", {['@identifier'] = user.identifier, ['@phone_number'] = phoneNumber})
		end

		user:setSessionVar("phone_number", phoneNumber) 


		local contacts = {}

		local executed_query2 = MySQL:executeQuery("SELECT contacts FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result2         = MySQL:getResults(executed_query2, {'contacts'})

		for i=1, #result2, 1 do
			
			table.insert(contacts, {
				first_name   = result2[i].fist_name,
				last_name   = result2[i].last_name,
				number = result2[i].number
				})

		end

		user:setSessionVar("contacts", contacts)

		local sms = {}

		local executed_query3 = MySQL:executeQuery("SELECT sms FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result3         = MySQL:getResults(executed_query2, {'sms'})

		for i=1, #result3, 1 do
			
			table.insert(sms, {
				first_name   = result3[i].first_name,
				last_name = result3.last_name,   --number = result3[i].number,		Si pour plus tard on veut avoir le numéro d'un sms anonyme	
				text   = result3[i].text
				date = result3[i].date
				})

		end

		user:setSessionVar("sms", sms)

		local executed_query4 = MySQL:executeQuery("SELECT first_name, last_name FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result4         = MySQL:getResults(executed_query2, {'first_name', 'last_name'})

		local name = {}

		table.insert(name, {
			first_name = result4[1].first_name,
			last_name = result4[1].last_name
			})

		user:setSessionVar("name", name)


		TriggerClientEvent('Iphone:loaded', source, phoneNumber, contacts, sms, name)

		end)
	end)

RegisterServerEvent("Iphone:addcontact")
AddEventHandler("Iphone:addcontact",function(pfirst_name, plast_name, pnumber)


		TriggerEvent("es:getPlayerFromId", source,function(user)
			userContacts = user:getSessionVar("contacts")

			table.insert(userContacts, {
				first_name   = pfirst_name,
				last_name = plast_name,
				number = pnumber
			})

			user:setSessionVar("contacts", userContacts)

			MySQL:executeQuery("UPDATE users SET contacts = '@contacts' WHERE identifier = '@identifier' ",
					{['@contacts'] = userContacts , ['@identifier'] = user.identifier})
			end)

			TriggerClientEvent("Iphone:updatecontacts") -- LE FAIRE DIRECTEMENT DANS LE CLIENT POUR L'AJOUT ------------------------ ICI ROMAIN ------------------------

end)

RegisterServerEvent("Iphone:removecontact")
AddEventHandler("Iphone:removecontact", function(toNumber)
	TriggerEvent("es:getPlayerFormId", source, function(user)
		foundedContacts = false
		localContacts = user:getSessionVar("contacts")
		for i, #contacts, 1 do
			if contacts[i].number == toNumber then
				table.remove(localContacts, i)
				foundedContacts = true
			end
			if foundedContacts then
				break
			end
		end
		user:setSessionVar("contacts", localContacts)
		MySQL:executeQuery("UPDATE users SET contacts = '@contacts' WHERE identifier = '@identifier' ",
					{['@contacts'] = localContacts , ['@identifier'] = user.identifier})

	end)
end


RegisterServerEvent("Iphone:sendsmsfromone")
AddEventHandler("Iphone:sendsmsfromone", function(rnumber, smessage)

	local executed_query = MySQL:executeQuery("SELECT identifier FROM users WHERE phone_number = '@phone_number'", {['@phone_number'] = rnumber})
	local result         = MySQL:getResults(executed_query, {'identifier'})
	targetIdentifier = result[1].identifier
	founded = 0
	local actualTime = os.clock()
	local actualDate = os.date("*t", actualTime)
    actualModifiedDate = {}
    table.insert(actualModifiedDate, {
    	mois = actualDate.month,
    	jour = actualDate.day,
    	heure = actualDate.hour,
    	minute = actualDate.min
    })

	TriggerEvent("es:getPlayers", function(Users)
		sname = Users[source]:getSessionVar("name")
		for k,v in pairs(Users) do

			if targetIdentifier == Users[k].identifier then
				founded = k
			end
		end
			if founded~=0 then
				local senderIdentifier = Users[source].identifier	
				local sms = Users[founded]:getSessionVar("sms")
				table.insert(sms, {
					first_name = sname.first_name,
					last_name = sname.last_name,
					text = smessage,
					date = actualModifiedDate
					})
				Users[k]:setSessionVar("sms", sms)
				local targetServerId = Users[founded].source
				local sender_name = Users[source]:getSessionVar("name")
				TriggerClientEvent("Iphone:receivesms", targetServerId, sms) ----------------------------------ICI ROMAIN --------------------------------------

			else 
				local executed_query = MySQL:executeQuery("SELECT sms FROM users WHERE phone_number = '@phone_number'", {['@phone_number'] = rnumber})
				local result         = MySQL:getResults(executed_query, {'sms'})
				local sms = result[1].sms
				table.insert(sms, {
					first_name = sname.first_name,
					last_name = sname.last_name,
					text = smessage,
					date = actualModifiedDate
					})
				MySQL:executeQuery("UPDATE users SET sms = '@sms' WHERE identifier = '@identifier'", {['@identifier'] = user.identifier, ['@phone_number'] = phoneNumber})


			end
	end)

	--result[1].identifier -- THIS IS THE TARGET PLAYER

end)

RegisterServerEvent("Iphone:sendposto")
AddEventHandler("Iphone:sendposto", function(toNumber, sname, x, y, z)
	local executed_query = MySQL:executeQuery("SELECT identifier FROM users WHERE phone_number = '@phone_number'", {['@phone_number'] = rnumber})
	local result         = MySQL:getResults(executed_query, {'identifier'})
	TriggerEvent("es:getPlayerFromIdentifier", result[1].identifier, function(user)
		if user ~= nil then
			TriggerClientEvent("Iphone:receivepos", x, y, z, sname)
		else
			TriggerClientEvent("Iphone:notif", source, sname.." a son téléphone est éteint.")
		end
	end)
end)

function InitSave()
	TriggerEvent("es:getPlayers", function(Users)
		for k,v in pairs(Users) do
			local sms = Users[k]:getSessionVar("sms")
			MySQL:executeQuery("UPDATE users SET sms = '@sms' WHERE identifier = '@identifier' ",
					{['@sms'] = sms , ['@identifier'] = Users[k].identifier})
		end
	end)
	SetTimeout(saveTime, InitSave)
end




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

