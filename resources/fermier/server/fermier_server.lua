-- ●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●
-- ..░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░..
-- ..░█░█░█░█▀▀▀░█░░░░█▀▀▀░█▀▀█░█▀█▀█░█▀▀▀░..
-- ..░█░█░█░█▀▀▀░█░░░░█░░░░█░░█░█░█░█░█▀▀▀░.. Art painting by Juju
-- ..░▀▀▀▀▀░▀▀▀▀░▀▀▀▀░▀▀▀▀░▀▀▀▀░▀░▀░▀░▀▀▀▀░..
-- ..░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░..
-- ●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●

-- Nous sommes conscient que l'optimisation peut être faites en plusieurs points, notament le détachement des données qui sont BDD, mais nous avons fait ça
-- pour la rapidité, on aurait pu faire des metatables pour chaque zone, et chaque coffre et faire un Coffre.haveChanged = true pour n'envoyer que ça. En soit
-- je ne pense pas que ça perd beaucoup en optimisation, car tout est envoyé en Blob, à voir ! :)
-- NE SUPPORTE PAS LE RESTART !

require "resources/essentialmode/lib/MySQL"
local Job = {}
local Coffre = {}
local addjobautomatic = false

function getPlayerID(source)
		local identifiers = GetPlayerIdentifiers(source)
		local identifier = identifiers[1]
		return identifier
end

AddEventHandler("onResourceStart", function(resource)
	if resource == "fermier" then
		if addjobautomatic == true then
			tableTest = {
				id = 1,
				name = "Fermier",
				positions = { {name = "récolte patate", fieldType = "récolte",blipID = 285, BlipCOLOR = 28,radius = 10.0, x = 2184.94, y = 5088.07, z = 45.89, item = {id = 24, name ="Patates"} },
					{name = "récolte pomme", fieldType = "récolte",blipID = 285, BlipCOLOR = 2,radius = 10.0,x = 2331.12, y = 5013.92, z = 41.99, item = {id = 25, name = "Pommes"}},
					{name = "récolte poulet", fieldType = "récolte",blipID = 141, BlipCOLOR = 13,radius = 10.0,x = 2123.18, y = 5013.15, z = 40.80, item = { id = 10, name = "Poulet"} },
					{name = "traitement poulet", fieldType = "traitement",blipID = 273,BlipCOLOR = 54,radius = 3.1, x = -83.44, y = 6227.89, z = 31.09, item = {base = { {id = 10, name = "Poulet", quantity = 1 } }, finish = { {id = 28, name = "Cuisse de poulet", quantity = 1} } } },
					{name = "traitement sandwich", fieldType = "traitement",blipID = 154,BlipCOLOR = 54,radius = 1.5, x = -99.80, y = 6210.98, z = 31.02, item = { base = { {id = 28, name = "Cuisse de poulet", quantity = 1} }, finish = { {id = 26, name = "Sandwich poulet", quantity = 1}} } },
					{name = "traitement bucket", fieldType = "traitement",blipID = 154,BlipCOLOR = 54,radius = 1.5, x = -105.97, y = 6204.81, z = 31.02, item = { base = { {id = 25, name="Pomme" , quantity = 1}, {id = 28, name="Cuisse de poulet" , quantity = 1} }, finish = { {id = 27, name = "Menu Bucket", quantity = 1} }  } },
					{name = "Vente tout", fieldType = "vente", blipID = 207, BlipCOLOR = 71,radius = 3.0, x = -584.85, y = -897.02, z = 25.94, item = { {id = 26, name = "Sanwich", price = 45}, {id = 27, name = "Menu Bucket", price = 90} } },
					{id = 1, fieldType = "entrepôt", name = "Entrepôt",blipID = 357, BlipCOLOR = 60,radius = 7.0, x = -169.77, y = 6156.68, z = 31.20, inventory = {}, maxQuantity = 300},
					{id = 2, fieldType = "entrepôt", name = "Bureau",blipID = 357,BlipCOLOR = 60,radius = 2.0, x = -68.67, y = 6254.87, z = 31.09, inventory = {}, maxQuantity = 25000},
					{name = "Véhicule de Fermier", fieldType = "spawn", blipID = 85,BlipCOLOR = 25,radius = 3.0, x = -119.38, y = 6215.65, z = 31.19, choix1 = { {model = "Rumpo", name = "VanA"}, {model = "Burrito3", name = "AnaV"} } , choix2 = { {r = "160", g = "24", b = "124", name = "IziColor"},  {r = "99", g = "19", b = "142", name = "SheepyColor"},  {r = "80", g = "81", b = "72", name = "BaseColor"}}}
				},
				employe = { {pl = "steam:110000102946cda", rank = "Fermier"}, {pl = "steam:110000104bd6595", rank = "Fermier"},  {pl = "steam:1100001038318d9", rank = "Gérant"}, {pl = "steam:11000010c3bb676", rank = "Gérant"}, {pl = "steam:1100001047a0f88", rank = "Fermier"}, {pl = "steam:1100001030897d8", rank = "Fermier"}, {pl = "steam:11000010882162b", rank = "Fermier"}, {pl = "steam:110000101f91cd2", rank = "Gérant"}}
			} -- coffre
			local encodedPositions = json.encode(tableTest.positions)
			local id = tostring(tableTest.id)
			local name = tableTest.name
			local employe = json.encode(tableTest.employe)

			MySQL:executeQuery("INSERT INTO jobEntreprise (`id`, `name`, `positions`, `employe`) VALUES ('@id', '@name', '@positions', '@employe')",
                                {['@id'] = id, ['@name'] = name, ['@positions'] = encodedPositions, ['@employe'] = employe})
		end
		LoadJob()
		for i = 1, #Job[1].positions do
			if Job[1].positions[i].fieldType == "entrepôt" then
				print("Add entrepot: " .. Job[1].name)
				table.insert(Coffre, {
					id = tonumber(Job[1].positions[i].id),
					inventory = Job[1].positions[i].inventory
				})
			end
		end
		SaveCoffre()
		PayMyBoss()
	end
end)

-- RegisterServerEvent("ask:source")
-- AddEventHandler("ask:source", function()
-- 	print(tostring(source))

-- end)

function LoadJob()
	local exec = MySQL:executeQuery("SELECT * FROM jobEntreprise")
	local results = MySQL:getResults(exec, {'id', 'name', 'positions','employe'})
	if results[1] ~= nil then
		for i = 1, #results do
			table.insert(Job, {
				id = tonumber(results[i].id),
				name = results[i].name,
				positions = json.decode(results[i].positions),
				employe = json.decode(results[i].employe)
				}
			)
		end
	end
end

AddEventHandler("es:playerLoaded", function(source)
	SendPosition(source)
end)

RegisterServerEvent("coffre:changeQuantity")
AddEventHandler("coffre:changeQuantity", function(id, itemId, quantity, name)
	for i = 1, #Coffre do
		if Coffre[i].id == id then
			found = false
			for j = 1, #Coffre[i].inventory do
				if Coffre[i].inventory[j].id == itemId then
					found = true
					if quantity > 0 then -- ajout a l entrepot
						userCan = false
						items = getOnlinePlayerItems(source)
						if(items[tostring(itemId)]) then
							if items[tostring(itemId)].quantity >= quantity then
								userCan = true
								updateOnlinePlayerItem(source, itemId, items[tostring(itemId)].quantity - math.abs(quantity), true)
							else
							end
						end
					else -- retirer de lentrepot
						userCan = false
						items = getOnlinePlayerItems(source)
						print(tostring(items[tostring(itemId)]))
						if(items[tostring(itemId)]) then
							newQuantity = items[tostring(itemId)].quantity - quantity
							if newQuantity <= 30 and Coffre[i].inventory[j].quantity >= math.abs(quantity) then
								userCan = true
								updateOnlinePlayerItem(source, itemId, items[tostring(itemId)].quantity + math.abs(quantity), true)
							end
						else
							updateOnlinePlayerItem(source, itemId, items[tostring(itemId)].quantity + math.abs(quantity), false)
							userCan = true
						end
					end
					if userCan == true then
					 Coffre[i].inventory[j].quantity = Coffre[i].inventory[j].quantity + quantity
				 	end
				end
			end
			if found == false then
				items = getOnlinePlayerItems(source)
				if(items[tostring(itemId)]) then
					newQuantity = items[tostring(itemId)].quantity - quantity
					if newQuantity >=  0 then
						Coffre[i].inventory[#Coffre[i].inventory +1] = {id = itemId, quantity = quantity, name = name}
						updateOnlinePlayerItem(source, itemId, items[tostring(itemId)].quantity - math.abs(quantity), true)
					end
				end
			end
			TriggerClientEvent("coffre:cbCoffre", source, Coffre[i])
			Coffre[i].haveChanged = true
		end
	end
end)

function getOnlinePlayerItems(source)
	items = {}
	identifier = GetPlayerIdentifiers(source)[1]
	executed_query = MySQL:executeQuery("SELECT * FROM user_inventory WHERE user_id = '@username'", { ['@username'] = identifier})
	result = MySQL:getResults(executed_query, { 'quantity', 'item_id' }, "item_id")
	for i = 1, #result do
		items[result[i].item_id] = {id = result[i].item_id, quantity = result[i].quantity}
	end
	return items
end

function updateOnlinePlayerItem(source, item_id, quantity, exist)
	if (exist) then
		executed_query = MySQL:executeQuery("UPDATE user_inventory SET quantity = '@quantity' WHERE user_id = '@username' && item_id = '@item_id'", { ['@username'] = identifier, ['@item_id'] = item_id, ['@quantity'] = quantity})
	else
		executed_query = MySQL:executeQuery("INSERT INTO user_inventory VALUES ('@username' , '@item_id', '@quantity')", { ['@username'] = identifier, ['@item_id'] = item_id, ['@quantity'] = quantity})
	end
end

RegisterServerEvent("coffre:getCoffre")
AddEventHandler("coffre:getCoffre", function(id)
	print(tostring(id))
	for i = 1, #Coffre do
		if Coffre[i].id == id then
			TriggerClientEvent("coffre:cbCoffre", source, Coffre[i])
		end
	end
end)

function SendPosition(source)
	TriggerEvent("es:getPlayerFromId", source, function(user)
		for i = 1, #Job[1].employe do
			if user.identifier == Job[1].employe[i].pl then
				TriggerClientEvent("jobCorp:jobInfos", source, Job[1].name, Job[1].employe[i].rank, json.encode(Job[1].positions))
			end
		end
	end)
end

function SendAllPositions(jobId)
	SetTimeout(1000, function()
		TriggerEvent("es:getPlayers", function(Users)
			for i = 1, #Users do
				for j = 1, #Job[jobId].employe do
					if Users[i].identifier == Job[jobId].employe[j].pl then
						TriggerClientEvent("jobCorp:jobInfos", 2, Job[jobId].name, Job[jobId].employe[j].rank, json.encode(Job[jobId].positions))
					end
				end
			end
		end)
	end)
end

function PayMyBoss()
	SetTimeout(900000, function()
		TriggerEvent("es:getPlayers", function(Users)
			for i = 1, #Users do
				for j = 1, #Job[1].employe do
					if Job[1].employe[j].pl == Users[i].identifier then
						if Job[1].employe[j].rank == "Gérant" then
							Users[i]:addMoney(200)
						end
					end
				end
			end
		end)
	PayMyBoss()
	end)
end

function SaveCoffre() -- toutes les minutes minutes
	SetTimeout(6000, function()
		for i = 1, #Job[1].positions do
			if Job[1].positions.fieldType == "entrepôt" then
				for j = 1, #Coffre do
					if Coffre[j].id == Job[1].positions.id and Coffre[j].haveChanged == true then
						Job[1].positions.inventory = Coffre[j].inventory
					end
				end
			end
		end
		MySQL:executeQuery("UPDATE jobEntreprise SET `positions`='@positions' WHERE id = '@id'",
					{['@positions'] = json.encode(Job[1].positions), ['@id'] = 1})
		SaveCoffre()
	end)
end
function SaveJob(id)
	MySQL:executeQuery("UPDATE jobEntreprise SET `employe`='@employe' WHERE id = '@vname'",
					{['@employe'] = json.encode(Job[1].employe), ['@vname'] = id})
	LoadJob()
end

TriggerEvent('es:addCommand', 'hire', function(source, args, user)
		for i = 1, #Job[1].employe do
			if user.identifier == Job[1].employe[i].pl and Job[1].employe[i].rank == "Gérant" then
				if #args == 3 then -- le nombre d'argument est ok
					table.insert(Job[1].employe, {pl = args[3], rank = "Fermier"})
					SendPosition(args[2])
					SaveJob(1)
				end
			end
		end
	CancelEvent()
end)

TriggerEvent('es:addCommand', 'fire', function(source, args, user)
	for i = 1, #Job[1].employe do
		if user.identifier == Job[1].employe[i].pl and Job[1].employe[i].rank == "Gérant" then
			if #args == 3 then -- le nombre d'argument est ok
				for j = 1, #Job[1].employe do
					if Job[1].employe[j].pl == args[3] then
						table.remove(Job[1].employe, j)
						TriggerClientEvent("jobCorp:fire", args[2])
						SaveJob(1)
						break
					end
				end
			end
		end
	end
	CancelEvent()
end)

-- local t, distance = GetClosestPlayer()
-- 	if(distance ~= -1 and distance < 3) then
-- 		TriggerServerEvent("police:targetCheckInventory", GetPlayerServerId(t))

-- function GetPlayers()
--     local players = {}

--     for i = 0, 31 do
--         if NetworkIsPlayerActive(i) then
--             table.insert(players, i)
--         end
--     end

--     return players
-- end

-- function GetClosestPlayer()
-- 	local players = GetPlayers()
-- 	local closestDistance = -1
-- 	local closestPlayer = -1
-- 	local ply = GetPlayerPed(-1)
-- 	local plyCoords = GetEntityCoords(ply, 0)

-- 	for index,value in ipairs(players) do
-- 		local target = GetPlayerPed(value)
-- 		if(target ~= ply) then
-- 			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
-- 			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
-- 			if(closestDistance == -1 or closestDistance > distance) then
-- 				closestPlayer = value
-- 				closestDistance = distance
-- 			end
-- 		end
-- 	end

-- 	return closestPlayer, closestDistance
-- end
