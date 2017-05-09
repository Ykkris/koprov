local Proxy = require("resources/vRP/lib/Proxy")

vRP = Proxy.getInterface("vRP")

ocal permission = {
	kick = 1,
	normal = 0,
	ban = 3
}

-- 911 DISPATCHER
TriggerEvent('es:addAdminCommand', 'dispatch', permission.normal, function(source, args, user)
	table.remove(args, 1)
	TriggerClientEvent('chatMessage', -1, "^5[911]", {30, 144, 255}, " (^1 Dispatcher: ^3" .. GetPlayerName(source) .." | "..source.."^0 ) " .. table.concat(args, " "))
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- 911 CALL
TriggerEvent('es:addAdminCommand', '911', permission.normal, function(source, args, user)
	local userID = vRP.getUserId(source ,function(user_id)
 			local = PlayerName
						end)
	vRP.getUserIdentity(user_id)
	table.remove(args, 1)
	TriggerClientEvent('chatMessage', -1, "^5[911]", {30, 144, 255}, " (^1 Caller ID: ^3" .. PlayerName .." | "..source.."^0 ) " .. table.concat(args, " "))
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)

-- ME
-- TAXI
TriggerEvent('es:addAdminCommand', 'Taxi', permission.normal, function(source, args, user)
	local userID = vRP.getUserId(source ,function(user_id)
 			local = PlayerName
						end)
	vRP.getUserIdentity(user_id)
	table.remove(args, 1)
	TriggerClientEvent('chatMessage', -1, "^5[Taxi]", {30, 144, 255}, " (^1 Caller ID: ^3" .. PlayerName .." | "..source.."^0 ) " .. table.concat(args, " "))
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)
TriggerEvent('es:addAdminCommand', 'me', permission.normal, function(source, args, user)
	table.remove(args, 1)
	TriggerClientEvent('chatMessage', -1, "^3[Me]", {255, 0, 0}, " (^2 " .. GetPlayerName(source) .." | "..source.."^0 ) " .. table.concat(args, " "))
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficienct permissions!")
end)
