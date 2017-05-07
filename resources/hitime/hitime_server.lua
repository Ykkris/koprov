hours = 0
minuts = 0
seconds = 0
first = false
actualplayer = 0

RegisterServerEvent('Join')
AddEventHandler('Join', function()
	actualplayer = source
	RconPrint("source = ".. tostring(source))
	local players = 0
	players = GetPlayers()
	if #players >= 2 then
		TriggerClientEvent("client.time", players[1])
		RconPrint("on prend le time de : " .. tostring(players[1]))
	end


end)

--TriggerServerEvent("return.client.time", hours, minuts, seconds)

RegisterServerEvent('return.client.time')
AddEventHandler('return.client.time', function(hours, minuts, seconds)
		
	RconPrint("L heure du return est "..tostring(hours).." : "..tostring(minuts).." : "..tostring(seconds))

	TriggerClientEvent("update.client.time", actualplayer, hours, minuts, seconds)
	
end)
