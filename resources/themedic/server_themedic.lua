require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

function addMedic(identifier)
	MySQL:executeQuery("INSERT INTO medic (`identifier`) VALUES ('@identifier')", { ['@identifier'] = identifier})
end

function delMedic(identifier)
	MySQL:executeQuery("DELETE FROM medic WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
end

function checkIsMedic(identifier)
	local query = MySQL:executeQuery("SELECT * FROM medic WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
	local result = MySQL:getResults(query, {'rank'}, "identifier")

	if(not result[1]) then
		TriggerClientEvent('medic:receiveIsMedic', source, "inconnu")
	else
		TriggerClientEvent('medic:receiveIsMedic', source, result[1].rank)
	end
end

function s_checkIsMedic(identifier)
	local query = MySQL:executeQuery("SELECT * FROM medic WHERE identifier = '@identifier'", { ['@identifier'] = identifier})
	local result = MySQL:getResults(query, {'rank'}, "identifier")

	if(not result[1]) then
		return nil 
	else
		return result[1].rank
	end
end

RegisterServerEvent('medic:checkIsMedic')
AddEventHandler('medic:checkIsMedic', function()
	TriggerEvent("es:getPlayerFromId", source, function(user)
		local identifier = user.identifier
		checkIsMedic(identifier)
	end)
end)

RegisterServerEvent('medic:consultationGranted')
AddEventHandler('medic:consultationGranted', function(t, amount)
	TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, GetPlayerName(t).. " a payé une consultation de $"..amount..".")
	TriggerClientEvent('medic:payConsultation', t, amount)
end)

TriggerEvent('es:addCommand', 'consultation', function(source, args, user)
	TriggerEvent("es:getPlayerFromId", source, function(player)
		local isMedic = s_checkIsMedic(player.identifier)
		if(isMedic ~= "nil") then
			if(#args < 3) then
				TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Usage : /consultation [id] [amount]")
			else
				if(GetPlayerName(tonumber(args[2])) ~= nil)then
					TriggerClientEvent('medic:consultation', source, args[2], args[3])
				else
					TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Aucun joueur avec cet ID !")
				end
			end
		else
			TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Vous n'avez pas le droit de faire ça !")
		end
	end)
end)

TriggerEvent('es:addAdminCommand', 'medicadd', 10000, function(source, args, user)
	if(not args[2])then
		TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Usage : /medicadd [ID]")
	else
		if(GetPlayerName(tonumber(args[2])) ~= nil)then
			local player = tonumber(args[2])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				addMedic(target.identifier)
				TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Bien reçus !")
				TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Félicitation vous êtes médecin !")
				TriggerClientEvent('medic:nowMedic', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Aucun joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Vous n'avez pas la permission de faire ça !")
end)

TriggerEvent('es:addAdminCommand', 'medicrem', 10000, function(source, args, user)
	if(not args[2])then
		TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Usage : /medicrem [ID]")
	else
		if(GetPlayerName(tonumber(args[2])) ~= nil)then
			local player = tonumber(args[2])
			TriggerEvent("es:getPlayerFromId", player, function(target)
				addMedic(target.identifier)
				TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Bien reçus !")
				TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Vous n'êtes plus médecin !")
				TriggerClientEvent('medic:noLongerMedic', player)
			end)
		else
			TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Aucun joueur avec cet ID !")
		end
	end
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, "Vous n'avez pas la permission de faire ça !")
end)