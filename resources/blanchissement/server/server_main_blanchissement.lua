
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
MySQL:open(database.host, database.name, database.username, database.password)

tempsEntreChaqueMission = 2400000 -- 40 minutes (en ms)
tempsEntreLeDepotEtLaPaye = 10800 -- 3 h (en secondes)
first = false

AddEventHandler('onResourceStart', function(resource)
	if not(first) and resource == "blanchissement" then
		first = true
		BlanchissementRandom()
	end
end)

RegisterServerEvent("mission:sendmoney")
AddEventHandler("mission:sendmoney", function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if user ~= nil then
			local req = MySQL:executeQuery("SELECT dirty_money FROM users WHERE identifier = '@identifier' ", {['@identifier'] = user.identifier })
			local resultat = MySQL:getResults(req, {'dirty_money'}, "identifier")
			money = tonumber(resultat[1].dirty_money)
			local rargent
		  	policier = NombrePolicier()
		  	local Policier = {0.65, 0.7, 0.85, 0.90, 1}
		 	if policier > 5 then 
		 		rargent = money
		 	else
		 		rargent = money * Policier[policier]
		 	end
		 	user:addMoney(rargent)
		 	TriggerClientEvent("blanchissement:notification", source, "Tiens, allez casse toi p'tite merde !")
		 end
	 end)
end) 


RegisterServerEvent("blanchissement:sendblanchissement")
AddEventHandler("blanchissement:sendblanchissement", function()
	TriggerEvent('es:getPlayerFromId', function(Users)
		Citizen.Trace("test")
		if Users ~= nil then
		local req = MySQL:executeQuery("SELECT dirty_money FROM users WHERE identifier = '@identifier' ", {['@identifier'] = Users.identifier })
	    	local resultat = MySQL:getResults(req, {'dirty_money'}, "identifier")
	    	local argent = tonumber(resultat[1].dirty_money)
	    	local receiveMoney = CalculMoney(argent)
	    	local time = os.clock()
	    	MySQL:executeQuery("UPDATE users SET dirty_time = '@dirty_time', dirty_wait_money = '@dirty_wait_money', dirty_money = '@dirty_money' WHERE identifier = '@identifier' ",
						{['@dirty_time'] = time , ['@dirty_wait_money'] = receiveMoney, ['@dirty_money'] = "0",['@identifier'] = Users.identifier})
	    	TriggerClientEvent("blanchissement:receiveblanchissement", source, argent)
	    end

	end)


end)

function CalculMoney(bargent)
	local Pallier = {50, 60, 65, 70, 80}
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
	local multiplicateur = maths.random(Pallier[pallier], Pallier[pallier+1])
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
	local req = MySQL:executeQuery("SELECT dirty_wait_money FROM users WHERE identifier = '@identifier' ", {['@identifier'] = player.identifier })
    local resultat = MySQL:getResults(req, {'dirty_wait_money'}, "identifier")
    if result[1].dirty_wait_money == 0 then
    	return 0
    else 
    	return tonumber(result[1].dirty_wait_money)
    end
end

function IsWaitingForLong(player)
	time = os.clock()
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
