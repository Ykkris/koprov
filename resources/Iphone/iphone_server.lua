-- This is Koprov team proprety. --
-- You can use it, share it and modify it BUT you're not allowed to make benefit with it. --
-- Contact us for more informations at koprov.fr --
require "resources/essentialmode/lib/MySQL"
--MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

first = true
saveTime = 900000 -- in ms
identifierList = {}
whiteListCheckCount = 0

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function CheckWhitelist()
	if not next(identifierList) or whiteListCheckCount == 5 then
		whiteListCheckCount = 0
		local executed_query = MySQL:executeQuery("SELECT * FROM user_whitelist")
	    local result = MySQL:getResults(executed_query, {'identifier'})
	    identifierList = {}
	    for k,v in pairs(result) do
			table.insert(identifierList, result[k].identifier)
		end
		whiteListCheckCount = whiteListCheckCount + 1
	end
	local player = nil


	TriggerEvent("es:getPlayers", function(Users)
		for k,v in pairs(Users) do
			if not has_value(identifierList, Users[k].identifier) then
				player = k
			end
		end

		if player then
			DropPlayer(player, "ResidentSleeper")
		end
	end)
	SetTimeout(CheckWhitelist, 1000 * 30)
end


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

		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result         = MySQL:getResults(executed_query, {'phone_number'})
		local phoneNumber    = result[1].phone_number

		if phoneNumber == nil then
			phoneNumber = GenerateUniquePhoneNumber()
			-- TriggerEvent("log:addLogServer","Iphone" ,"FIRST" ,"Generating Phone Number For : ".. user.identifier .. "number = ".. tostring(phoneNumber))
			MySQL:executeQuery("UPDATE users SET phone_number = '@phone_number' WHERE identifier = '@identifier'", {['@identifier'] = user.identifier, ['@phone_number'] = phoneNumber})
		end

		user:setSessionVar("phone_number", phoneNumber) 
		local contacts = {}

		local executed_query2 = MySQL:executeQuery("SELECT contacts FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result2         = MySQL:getResults(executed_query2, {'contacts'})
		local decodedResult2 = json.decode(result2[1].contacts)

		if next(decodedResult2) then
			for i=1, #decodedResult2, 1 do
				if decodedResult2[i].first_name ~= nil then		
					table.insert(contacts, {
						name   = decodedResult2[i].first_name.." "..decodedResult2[i].last_name,
						number = decodedResult2[i].number
					})
				else
					table.insert(contacts, {
						name   = decodedResult2[i].name,
						number = decodedResult2[i].number
					})
				end
			end
		end

		
		user:setSessionVar("contacts", contacts)
		local sms = {}

		local executed_query3 = MySQL:executeQuery("SELECT sms FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result3         = MySQL:getResults(executed_query3, {'sms'})
		local decodedResult3 = json.decode(result3[1].sms)

		for i=1, #decodedResult3, 1 do
				table.insert(sms, {
					name = decodedResult3[i].name,
					text = decodedResult3[i].text,
					jour = decodedResult3[i].jour,
					heure = decodedResult3[i].heure,
					minute = decodedResult3[i].minute,
					mois = decodedResult3[i].mois,
					number = decodedResult3[i].number,
					masked = decodedResult3[i].masked
					})

			end
		user:setSessionVar("sms", sms)
		-- TriggerEvent("log:addLogServer","Iphone" ,"LOAD" ,"Loading " ..user.identifier.." "..name.first_name .. " " .. name.last_name )
		TriggerClientEvent('Iphone:loaded', source, phoneNumber, contacts, sms)

		end)
	end) 

RegisterServerEvent("Iphone:updatecontact")
AddEventHandler("Iphone:updatecontact",function(pname, pnumber, index)
	TriggerEvent("es:getPlayerFromId", source, function(user)
		userContacts = user:getSessionVar("contacts")
		userContacts[index] = {
			name = pname,
			number = pnumber
		}

		user:setSessionVar("contacts", userContacts)

		local encodedUserContacts = json.encode(userContacts)

		MySQL:executeQuery("UPDATE users SET contacts = '@contacts' WHERE identifier = '@identifier' ",
				{['@contacts'] = encodedUserContacts , ['@identifier'] = user.identifier})
		end)

end)

RegisterServerEvent("Iphone:addcontact")
AddEventHandler("Iphone:addcontact",function(pname, pnumber)

		TriggerEvent("es:getPlayerFromId", source, function(user)
			userContacts = user:getSessionVar("contacts")
			table.insert(userContacts, {
				name = pname,
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
				
			-- TriggerEvent("log:addLogServer","Iphone" ,"INFO" ,"Adding Contact : "..userContacts.number .. " " .. userContact.first_name .. " " .. userContacts.last_name .. " For Player : " .. user.identifier )

			MySQL:executeQuery("UPDATE users SET contacts = '@contacts' WHERE identifier = '@identifier' ",
					{['@contacts'] = encodedUserContacts , ['@identifier'] = user.identifier})
			end)

			--TriggerClientEvent("Iphone:updatecontacts") -- LE FAIRE DIRECTEMENT DANS LE CLIENT POUR L'AJOUT ------------------------ ICI ROMAIN ------------------------

end)

RegisterServerEvent("Iphone:removecontact")
AddEventHandler("Iphone:removecontact", function(index)
	TriggerEvent("es:getPlayerFromId", source, function(user)
		foundContacts = false
		localContacts = user:getSessionVar("contacts")
		table.remove(localContacts, index)
		user:setSessionVar("contacts", localContacts)

		local localEncodedContacts = json.encode(localContacts)
		MySQL:executeQuery("UPDATE users SET contacts = '@contacts' WHERE identifier = '@identifier' ",
					{['@contacts'] = localEncodedContacts , ['@identifier'] = user.identifier})

	end)
end)


RegisterServerEvent("Iphone:sendsmsfromone")
AddEventHandler("Iphone:sendsmsfromone", function(rnumber, smessage, masked)
	TriggerEvent('es:getPlayerFromId', source, function(user)

		local executed_query = MySQL:executeQuery("SELECT identifier FROM users WHERE phone_number = '@phone_number'", {['@phone_number'] = rnumber})

		local result         = MySQL:getResults(executed_query, {'identifier'})

		if result[1]~=nil then
			targetIdentifier = result[1].identifier

			found = 0
		
			local actualTime = os.time()
			local actualDate = os.date("*t", actualTime - 7200)
		    actualModifiedDate = {}
		    local jour = tostring(actualDate.day)
		    local heure = tostring(actualDate.hour)
		    local minute = tostring(actualDate.min)
		    local mois = tostring(actualDate.month)
		    if string.len(jour) == 1 then
		    	jour = '0'..jour
		    end
		    if string.len(heure) == 1 then
		    	heure = '0'..heure
		    end
		    if string.len(minute) == 1 then
		    	minute = '0'..minute
		    end
		    if string.len(mois) == 1 then
		    	mois = '0'..mois
		    end
		

			TriggerEvent("es:getPlayers", function(Users)
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

				local sender_number = user:getSessionVar("phone_number")
				if masked then
					sender_number = ""
				end
			
				if found~=0 then
					local senderIdentifier = Users[source].identifier	
					updateSms = targetUser:getSessionVar("sms")
					updateOneSms = {
						text = smessage,
						jour = jour,
						heure = heure,
						minute = minute,
						mois = mois,
						number = sender_number,
						masked = masked
					}
					table.insert(updateSms, updateOneSms)
					targetUser:setSessionVar("updateSms", updateSms)
					local targetServerId = targetUser.source
					-- TriggerEvent("log:addLogServer","Iphone" ,"INFO" , Users[source].identifier.. "/".. sname.first_name .. " " .. sname.last_name .. "Send Sms to ONLINE PLAYER : ".. targetUser.identifier .."/".. targetName.first_name .. " " .. targetName.last_name .. " With Message : " .. smessage )
					TriggerClientEvent("Iphone:receivesms", targetServerId, updateOneSms) ----------------------------------ICI ROMAIN --------------------------------------

				else 
				
					local executed_query = MySQL:executeQuery("SELECT sms FROM users WHERE phone_number = '@phone_number'", {['@phone_number'] = rnumber})
					local result         = MySQL:getResults(executed_query, {'sms'})
					sms = json.decode(result[1].sms)
					if sms == nil then
						sms = {}
					end
					
					table.insert(sms, 1, {
						text = smessage,
						jour = jour,
						heure = heure,
						minute = minute,
						mois = mois,
						number = sender_number,
						masked = masked
					})

					-- TriggerEvent("log:addLogServer","Iphone" ,"Send SmS" , Users[source].identifier .. "/".. sname.first_name .. " " .. sname.last_name .."Send Sms to OFFLINE PLAYER : ".. rnumber .. " With Message : " .. smessage )
					local encodedSms = json.encode(sms)
					MySQL:executeQuery("UPDATE users SET sms = '@sms' WHERE phone_number = '@phone_number'", {['@sms'] = encodedSms, ['@phone_number'] = rnumber})



				end
			end)
		else
			TriggerClientEvent("Iphone:notif", source, "Son téléphone est cassé")
			-- TriggerEvent("log:addLogServer","Iphone" ,"INFO" , Users[source].identifier .. "/".. sname.first_name .. " " .. sname.last_name.."Send Sms to UNKNOW PLAYER : ".. tostring(rnumber) .. " With Message : " .. smessage )
		end

		--result[1].identifier -- THIS IS THE TARGET PLAYER
	end)
end)

RegisterServerEvent("Iphone:sendposto")
AddEventHandler("Iphone:sendposto", function(toNumber, sname, x, y, z)
	local executed_query = MySQL:executeQuery("SELECT identifier FROM users WHERE phone_number = '@phone_number'", {['@phone_number'] = rnumber})
	local result         = MySQL:getResults(executed_query, {'identifier'})
	TriggerEvent("es:getPlayerFromIdentifier", result[1].identifier, function(user)
		if user ~= nil then
			TriggerClientEvent("Iphone:receivepos", user.source,x, y, z, sname)
			-- TriggerEvent("log:addLogServer","Iphone","INFO" , sname.first_name .. " " .. sname.last_name .."Send Pos to : " .. user.identifier .. " with number " .. tostring(toNumber) .. " pos : X= " .. tostring(x) .. " Y= " .. tostring(y) .. " Z= " .. tostring(z))
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
	-- TriggerEvent("log:addLogServer","Iphone","SAVE" ,"Save Done" )
	SetTimeout(saveTime, InitSave)
end

RegisterServerEvent('service:getJobId')
AddEventHandler('service:getJobId',	function()
	TriggerEvent('es:getPlayerFromId', source, function(user)
		local executed_query = MySQL:executeQuery("SELECT job FROM users WHERE users.identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result = MySQL:getResults(executed_query, {'job'}, "identifier")
		
		TriggerClientEvent("service:receiveJob", source , result[1].job)
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
					-- TriggerEvent("log:addLogServer","Service","INFO" , tostring(id_service).. " Online" .. " asked by : " .. players[source].identifier)
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
			TriggerClientEvent('service:calltaken', i, service_id, playerName, playerID, x, y, z, sourcePlayerInComa)
			-- TriggerEvent("log:addLogServer","Service","INFO" ,"Send asked service to : " .. players[i].identifier .. " Asked by " .. players[sourcePlayerInComa].identifier )
		end
		end)
end
) 

RegisterServerEvent("Iphone:checkid") -- RETURN THE RP PLAYER NAME
AddEventHandler("Iphone:checkid", function(target, puiorpcops) -- 0 pour ui et 1 pour cops
	TriggerEvent("es:getPlayerFromId", target, function(user)
		local query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@identifier'", { ['@identifier'] = user.identifier})
		local result = MySQL:getResults(query, {'first_name', 'last_name', 'matricule', 'phone_number', 'gender'}, "identifier")
		if puiorpcops == 1 then
			TriggerClientEvent("Iphone:rcheckid", source, result[1].first_name, result[1].last_name, result[1].matricule, result[1].phone_number, result[1].gender)
		elseif puiorpcops == 0 then
			TriggerClientEvent("Iphone:rgetidui", source, result[1].first_name, result[1].last_name, result[1].matricule, result[1].phone_number, result[1].gender)
		end
	end)	
end)


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

