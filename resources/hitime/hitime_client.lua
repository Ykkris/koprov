sync = false
join = false
Citizen.CreateThread(function()

	if not(sync) then
		local year, month, day, hour, minute, seconde = GetUtcTime()
        NetworkOverrideClockTime(hour, minute, seconde)
		sync = true
	end
	
	if not(join) then
		TriggerServerEvent("Join")
		join = true
	end

	

end)


RegisterNetEvent('client.time')
AddEventHandler('client.time', function()
   
hours = GetClockHours()
minuts = GetClockMinutes()
seconds = GetClockSeconds()
	
TriggerServerEvent("return.client.time", hours, minuts, seconds)

end)

RegisterNetEvent("update.client.time")
AddEventHandler('update.client.time', function(hours, minutes, seconds)
Citizen.Trace(tostring(hours)..tostring(minutes)..tostring(seconds))
NetworkOverrideClockTime(tonumber(hours),tonumber(minutes), tonumber(seconds), true)
		Citizen.Trace("done")

end)
