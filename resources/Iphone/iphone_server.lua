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

AddEventHandler('es:playerLoaded', function(source)

	TriggerEvent('es:getPlayerFromId', source, function(user)

		print("test1")

		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result         = MySQL:getResults(executed_query, {'phone_number'})
		local phoneNumber    = result[1].phone_number

		if phoneNumber == nil then
			phoneNumber = GenerateUniquePhoneNumber()
			MySQL:executeQuery("UPDATE users SET phone_number = '@phone_number' WHERE identifier = '@identifier'", {['@identifier'] = user.identifier, ['@phone_number'] = phoneNumber})
		end

		user:setSessionVar("phone_number", phoneNumber) 
		print("test2")

		local contacts = {}

		local executed_query2 = MySQL:executeQuery("SELECT contacts FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result2         = MySQL:getResults(executed_query2, {'contacts'})
		print("test2plus")
		local decodedResult2 = json.decode(result2[1].contacts)

		for i=1, #decodedResult2, 1 do
			
			table.insert(contacts, {
				first_name   = decodedResult2[i].first_name,
				last_name   = decodedResult2[i].last_name,
				number = decodedResult2[i].number
				})

		end
		print("test2plusplus")
		user:setSessionVar("contacts", contacts)
		print("test3")

		local sms = {}

		local executed_query3 = MySQL:executeQuery("SELECT sms FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result3         = MySQL:getResults(executed_query3, {'sms'})

		local decodedResult3 = json.decode(result3[1].sms)

		print("testt3")
			for i=1, #decodedResult3, 1 do
				print("On a print un sms")
				table.insert(sms, {
					first_name   = decodedResult3[i].first_name,
					last_name =    decodedResult3[i].last_name,   --number = result3[i].number,		Si pour plus tard on veut avoir le numéro d'un sms anonyme	
					text   =       decodedResult3[i].text,
					jour = decodedResult3[i].jour,
					heure = decodedResult3[i].heure,
					minute = decodedResult3[i].minute,
					mois = decodedResult3[i].mois
					})

			end
print("testt3plus")
		user:setSessionVar("sms", sms)
		print("test4")

		local executed_query4 = MySQL:executeQuery("SELECT first_name, last_name FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result4         = MySQL:getResults(executed_query4, {'first_name', 'last_name'})


		local name = {
			first_name = result4[1].first_name,
			last_name = result4[1].last_name
			}

		user:setSessionVar("name", name)
		print("test5")

		TriggerClientEvent('Iphone:loaded', source, phoneNumber, contacts, sms, name)

		end)
	end) 

RegisterServerEvent("Iphone:addcontact")
AddEventHandler("Iphone:addcontact",function(pfirst_name, plast_name, pnumber)

	print(tostring(pfirst_name).. " " .. tostring(plast_name) .. " " .. tostring(pnumber))
		TriggerEvent("es:getPlayerFromId", source, function(user)
			userContacts = user:getSessionVar("contacts")
			table.insert(userContacts, {
				first_name   = pfirst_name,
				last_name = plast_name,
				number = pnumber
			})

			--print(userContacts[1].first_name)
			--print(userContacts[1].last_name)
			--print(userContacts[1].number)
			--print(userContacts[2].first_name)
			--print(userContacts[2].last_name)
			--print(userContacts[2].number)

			user:setSessionVar("contacts", userContacts)

			--print("CEST BON ?")
			local encodedUserContacts = json.encode(userContacts)

			MySQL:executeQuery("UPDATE users SET contacts = '@contacts' WHERE identifier = '@identifier' ",
					{['@contacts'] = encodedUserContacts , ['@identifier'] = user.identifier})
			end)

			--TriggerClientEvent("Iphone:updatecontacts") -- LE FAIRE DIRECTEMENT DANS LE CLIENT POUR L'AJOUT ------------------------ ICI ROMAIN ------------------------

end)

RegisterServerEvent("Iphone:removecontact")
AddEventHandler("Iphone:removecontact", function(toNumber)
	TriggerEvent("es:getPlayerFromId", source, function(user)
		foundContacts = false
		localContacts = user:getSessionVar("contacts")
		for i=1, #localContacts, 1 do
			if localContacts[i].number == toNumber then
				table.remove(localContacts, i)
				foundContacts = true
			end
			if foundContacts then
				break
			end
		end
		user:setSessionVar("contacts", localContacts)

		local localEncodedContacts = json.encode(localContacts)
		MySQL:executeQuery("UPDATE users SET contacts = '@contacts' WHERE identifier = '@identifier' ",
					{['@contacts'] = localEncodedContacts , ['@identifier'] = user.identifier})

	end)
end)


RegisterServerEvent("Iphone:sendsmsfromone")
AddEventHandler("Iphone:sendsmsfromone", function(rnumber, smessage)


	local executed_query = MySQL:executeQuery("SELECT identifier FROM users WHERE phone_number = '@phone_number'", {['@phone_number'] = rnumber})

	local result         = MySQL:getResults(executed_query, {'identifier'})

	if result[1]~=nil then
		targetIdentifier = result[1].identifier

		found = 0
	
		local actualTime = os.time()
		local actualDate = os.date("*t", actualTime)
	    actualModifiedDate = {}
	

		TriggerEvent("es:getPlayers", function(Users)
			sname = Users[source]:getSessionVar("name")
			for k,v in pairs(Users) do

				if targetIdentifier == Users[k].identifier then
					found = k
					targetUser = Users[k]
					--print(tostring(v)) -- table -- table
					--print(tostring(k))  -- 2 -- 6
					--print(tostring(k.identifier)) -- nil -- nil
					--print(tostring(v.identifier)) -- steamid -- steamid
				end
			end
		
				if found~=0 then
					local senderIdentifier = Users[source].identifier	
					updateSms = targetUser:getSessionVar("sms")
					table.insert(updateSms, {
						first_name = sname.first_name,
						last_name = sname.last_name,
						text = smessage,
						jour = actualDate.day,
						heure = actualDate.hour,
						minute = actualDate.min,
						mois = actualDate.month
						})
					targetUser:setSessionVar("updateSms", updateSms)
					updateOneSms = {
						first_name = sname.first_name,
						last_name = sname.last_name,
						text = smessage,
						jour = actualDate.day,
						heure = actualDate.hour,
						minute = actualDate.min,
						mois = actualDate.month
						}
					local targetServerId = targetUser.source
					TriggerClientEvent("Iphone:receivesms", targetServerId, updateOneSms) ----------------------------------ICI ROMAIN --------------------------------------

				else 
				
					local executed_query = MySQL:executeQuery("SELECT sms FROM users WHERE phone_number = '@phone_number'", {['@phone_number'] = rnumber})
					local result         = MySQL:getResults(executed_query, {'sms'})
					sms = json.decode(result[1].sms)
					if sms == nil then
						sms = {}
					end
					
					table.insert(sms, {
						first_name = sname.first_name,
						last_name = sname.last_name,
						text = smessage,
						jour = actualDate.day,
						heure = actualDate.hour,
						minute = actualDate.min,
						mois = actualDate.month
						})


					local encodedSms = json.encode(sms)
					MySQL:executeQuery("UPDATE users SET sms = '@sms' WHERE phone_number = '@phone_number'", {['@sms'] = encodedSms, ['@phone_number'] = rnumber})



				end
			end)
		else
			TriggerClientEvent("Iphone:notif", source, "Son téléphone est cassé")
		end

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
			sms = Users[k]:getSessionVar("sms")
			if sms == "@sms" or sms == {} then
				sms = {}
				MySQL:executeQuery("UPDATE users SET sms = '@sms' WHERE identifier = '@identifier' ",
						{['@sms'] = sms , ['@identifier'] = Users[k].identifier})
			end
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
-- TEST IZIO

RegisterServerEvent("Iphone:testload")
AddEventHandler("Iphone:testload", function()
	TriggerEvent('es:getPlayerFromId', source, function(user)

		print("test1")

		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result         = MySQL:getResults(executed_query, {'phone_number'})
		local phoneNumber    = result[1].phone_number

		if phoneNumber == nil then
			phoneNumber = GenerateUniquePhoneNumber()
			MySQL:executeQuery("UPDATE users SET phone_number = '@phone_number' WHERE identifier = '@identifier'", {['@identifier'] = user.identifier, ['@phone_number'] = phoneNumber})
		end

		user:setSessionVar("phone_number", phoneNumber) 
		print("test2")

		local contacts = {}

		local executed_query2 = MySQL:executeQuery("SELECT contacts FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result2         = MySQL:getResults(executed_query2, {'contacts'})
		local decodedResult2 = json.decode(result2[1].contacts)

		for i=1, #decodedResult2, 1 do
			
			table.insert(contacts, {
				first_name   = decodedResult2[i].first_name,
				last_name   = decodedResult2[i].last_name,
				number = decodedResult2[i].number
				})

		end
		user:setSessionVar("contacts", contacts)

		local sms = {}

		local executed_query3 = MySQL:executeQuery("SELECT sms FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result3         = MySQL:getResults(executed_query3, {'sms'})

		local decodedResult3 = json.decode(result3[1].sms)

			for i=1, #decodedResult3, 1 do
				table.insert(sms, {
					first_name   = decodedResult3[i].first_name,
					last_name =    decodedResult3[i].last_name,   --number = result3[i].number,		Si pour plus tard on veut avoir le numéro d'un sms anonyme	
					text   =       decodedResult3[i].text,
					jour = decodedResult3[i].jour,
					heure = decodedResult3[i].heure,
					minute = decodedResult3[i].minute,
					mois = decodedResult3[i].mois
					})

			end
		user:setSessionVar("sms", sms)

		local executed_query4 = MySQL:executeQuery("SELECT first_name, last_name FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result4         = MySQL:getResults(executed_query4, {'first_name', 'last_name'})


		local name = {
			first_name = result4[1].first_name,
			last_name = result4[1].last_name
			}

		user:setSessionVar("name", name)

		TriggerClientEvent('Iphone:loaded', source, phoneNumber, contacts, sms, name)

		end)
	end) 
