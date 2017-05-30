RegisterServerEvent('baseevents:onPlayerDied')
RegisterServerEvent('baseevents:onPlayerKilled')
RegisterServerEvent('baseevents:onPlayerWasted')
RegisterServerEvent('baseevents:enteringVehicle')
RegisterServerEvent('baseevents:enteringAborted')
RegisterServerEvent('baseevents:enteredVehicle')
RegisterServerEvent('baseevents:leftVehicle')

AddEventHandler('baseevents:onPlayerKilled', function(killedBy, data)
	local victim = source
	TriggerEvent("es:getPlayers", function(Users)
	RconLog({msgType = 'playerKilled', victim = victim, attacker = killedBy, data = data})
	TriggerEvent("log:addLogServer","DeathEvent" ,"INFO" , Users[victim].identifier .. " killed by : " .. tostring(killedBy))
	end)
end)

AddEventHandler('baseevents:onPlayerDied', function(killedBy, pos)
	local victim = source
	RespawnAtPoint(pos)	
	RconLog({msgType = 'playerDied', victim = victim, attackerType = killedBy, pos = pos})
	TriggerEvent("es:getPlayerFromId", source, function(user)
		TriggerEvent("log:addLogServer","DeathEvent" ,"INFO" , user.identifier .. " killed by : " .. tostring(killedBy) " at : X= " ..tostring(pos.x) .. " Y = " .. tostring(pos.y) .. " Z = " .. tostring(pos.z))
	end)
end)

AddEventHandler('baseevents:enteredVehicle', function(data)
	TriggerClientEvent('garages:enteredVehicle', source)
	TriggerEvent("es:getPlayerFromId", source, function(user)
		TriggerEvent("log:addLogServer","VehEnter" ,"INFO" , user.identifier .. " Enter in Vehicle : " .. tostring(data[2]) .. " at seat : " .. tostring(data[1]))
	end)
end)

function RespawnAtPoint(pos)
	
RequestCollisionAtCoord(pos.x, pos.y, pos.z)
	while not HasCollisionLoadedAroundEntity(GetPlayerPed(-1))do
		RequestCollisionAtCoord(pos.x, pos.y, pos.z)
		Citizen.Wait(0)
	end
	SetEntityCoords(GetPlayerPed(-1), pos)	
	
end
