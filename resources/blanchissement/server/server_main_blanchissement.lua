
------
-- Blanchissement by KoproV.fr
-- Version: v0.0.1
-- Path: server/main.lua
------

database = {
    host = "127.0.0.1",
    name = "gta5_gamemode_essential",
    username = "root",
    password = "5M32bNCpFdgG"
}

require "resources/essentialmode/lib/MySQL"
-- MySQL:open(database.host, database.name, database.username, database.password)

tempsEntreChaqueMission = 2400000 -- 40 minutes (en ms)
tempsEntreLeDepotEtLaPaye = 10800 -- 3 h (en secondes)
first = true

AddEventHandler('onResourceStart', function(resource)
	if not(first) and resource == "blanchissement" then
		TriggerEvent("log:addLogServer","Blanchiement" ,"INFO" ,"Loaded blanchissement")
		first = true
		BlanchissementRandom()
	end
end)

RegisterServerEvent("mission:sendmoney")
AddEventHandler("mission:sendmoney", function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if user ~= nil then
			local req = MySQL:executeQuery("SELECT dirty_wait_money FROM users WHERE identifier = '@identifier' ", {['@identifier'] = user.identifier })
		    	local resultat = MySQL:getResults(req, {'dirty_wait_money'}, "identifier")
			money = tonumber(resultat[1].dirty_wait_money)
			print(tostring(money))
			rargent = 0
		  	policier = NombrePolicier()
		  	print(policier)
		  	Policier = {0.65, 0.7, 0.85, 0.90, 0.95, 1.0, 1.1}
		 	if policier > 6 then 
		 		rargent = money
		 	elseif money == 0 then
		 		rargent = 0
		 	else 
		 		rargent = money * Policier[policier+1]
		 	end
		 	user:addMoney(rargent)
			TriggerEvent("log:addLogServer","Blanchiement" ,"INFO" ,"Player receive money : "..user.identifier .. " amount : " .. tostring(rargent) )
		 	TriggerClientEvent("blanchissement:notification", source, "Tiens, allez casse toi p'tite merde !")
		 end
	 end)
end) 


RegisterServerEvent("blanchissement:sendblanchissement")
AddEventHandler("blanchissement:sendblanchissement", function()
	TriggerEvent('es:getPlayerFromId', source,function(user)
		identifier = user.identifier
		local req = MySQL:executeQuery("SELECT dirty_money FROM users WHERE identifier = '@identifier' ", {['@identifier'] = identifier })
	    	local resultat = MySQL:getResults(req, {'dirty_money'}, "identifier")
	    	argent = tonumber(resultat[1].dirty_money)
	    	local receiveMoney = CalculMoney(argent)
	    	local time = os.time()
	    	MySQL:executeQuery("UPDATE users SET dirty_time = '@dirty_time', dirty_wait_money = '@dirty_wait_money', dirty_money = '@dirty_money' WHERE identifier = '@identifier' ",
						{['@dirty_time'] = time , ['@dirty_wait_money'] = argent, ['@dirty_money'] = "0",['@identifier'] = identifier})
	    	user:setDirty_Money(0) ---<<<< non je ne suis pas un troll, je met bel et bien 0 en nombre é_é
		TriggerEvent("log:addLogServer","Blanchiement" ,"INFO" ,"Player send dirty money : "..user.identifier .. " amount : " .. tostring(argent) )
	    	TriggerClientEvent("blanchissement:receiveblanchissement", source, argent)

	end)
end)

function CalculMoney(bargent)
	RconPrint("Calcul Money")
	Pallier = {50, 60, 65, 70, 80}
	local pallier = 0
	--local Policier = {0.65, 0.7, 0.85, 0.90, 1}
	--local nombrePolicier = NombrePolicier()
	if bargent < 950 then
		pallier = 1
	elseif bargent < 950 * 3 then
		pallier = 2
	elseif bargent < 950 * 10 then
		pallier = 3
	elseif bargent < 950 * 25 then
		pallier = 4
	else
		pallier = 5
	end

	local multiplicateur = math.random(Pallier[pallier], Pallier[pallier+1])
	--if nombrePolicier == 0 then
	return ((bargent * multiplicateur)/100) --* 0.5
	--else
		--return (((bargent * multiplicateur)/100) * Policier[nombrePolicier])
	--end
end --]]

function BlanchissementRandom()
	isWaitingForLong = false
	found = false
	TriggerEvent("es:getPlayers", function(Users)
		for k,v in pairs(Users) do
			sargent = IsInWait(Users[k])
			if sargent ~= 0 then
				if IsWaitingForLong(Users[k]) then
					found = true
					TriggerClientEvent("blanchissement:mission", k, sargent)
				end
			end
			if found then
				break
			end
		end
	end)
	SetTimeout(tempsEntreChaqueMission, BlanchissementRandom)
end 

function IsInWait(player)
	print(tostring(player))
	local req = MySQL:executeQuery("SELECT dirty_wait_money FROM users WHERE identifier = '@identifier' ", {['@identifier'] = player.identifier })
    local resultat = MySQL:getResults(req, {'dirty_wait_money'}, "identifier")
    if tonumber(resultat[1].dirty_wait_money) ~= 0 then
    	return 0
    else 
    	return tonumber(result[1].dirty_wait_money)
    end
end

function IsWaitingForLong(player)
	time = os.time()
	local req = MySQL:executeQuery("SELECT dirty_time FROM users WHERE identifier = '@identifier' ", {['@identifier'] = player.identifier })
    local resultat = MySQL:getResults(req, {'dirty_time'}, "identifier")
    if (resultat[1].dirty_time - time) >= tempsEntreLeDepotEtLaPaye then
    	return true
    else
    	return false
    end
end 

function NombrePolicier()
	local policier = 0
	TriggerEvent("es:getPlayers", function(Users)
		if Users==nil then return 0
		else --2
			for k,v in pairs(Users) do-- Cela peut être optimisée en récupérant tous les identifier dont le job est 2 puis de faire une boucle qui va vérifier en interne (une seule requete au lieu de 1 jusqu'a 24) mais elle ne va se faire qu'une fois toutes les 20 minutes alors balek
				local req = MySQL:executeQuery("SELECT job FROM users WHERE identifier = '@identifier' ", {['@identifier'] = Users[k].identifier })
	    		local resultat = MySQL:getResults(req, {'job'}, "identifier")
	    		if resultat[1].job == 2 then
	    			policier = policier + 1
	    		end
	    	end
		end
	end)
	return policier
end 

--RegisterServerEvent("mission:test")
--AddEventHandler("mission:test", function()

--	isWaitingForLong = false
--	found = false
--	TriggerEvent("es:getPlayers", function(Users)
--		for k,v in pairs(Users) do
--			sargent = IsInWait(Users[k])
--			if sargent == 0 then
--				print("ok delete le 0")
--				if IsWaitingForLong(Users[k]) then
--					print("on a passé le w8 for long")
--					found = true
--					TriggerClientEvent("blanchissement:mission", k, sargent)
--				end
--			end
--			if found then
--				break
--			end
--		end
--	end)
--end)

RegisterServerEvent("mission:removemoney")
AddEventHandler("mission:removemoney", function()
	TriggerEvent("es:getPlayerFromId", function(user)
		MySQL:executeQuery("UPDATE users SET dirty_time = '@dirty_time', dirty_wait_money = '@dirty_wait_money', dirty_money = '@dirty_money' WHERE identifier = '@identifier' ",
		{['@dirty_time'] = "0" , ['@dirty_wait_money'] = "0", ['@dirty_money'] = "0",['@identifier'] = identifier})
		print(user.identifier.." a rate sa mission. il perd son argent.")
	end)
end)
