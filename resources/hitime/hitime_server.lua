hours = 0
minuts = 0
seconds = 0
first = false
actualplayer = 0

RegisterServerEvent('Join')
AddEventHandler('Join', function()
	actualplayer = source
	local players = GetPlayers()
	if #players >= 2 then
		TriggerClientEvent("client.time", players[1])
	end


end)

--TriggerServerEvent("return.client.time", hours, minuts, seconds)

RegisterServerEvent('return.client.time')
AddEventHandler('return.client.time', function(hours, minuts, seconds)

	TriggerClientEvent("update.client.time", actualplayer, hours, minutes, seconds)
	
end)