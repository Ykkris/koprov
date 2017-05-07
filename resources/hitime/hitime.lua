sync = false
Citizen.CreateThread(function()

	if not(sync) then
		local year, month, day, hour, minute, seconde = GetUtcTime()
        NetworkOverrideClockTime(hour, minute, second)
		sync = true
	end
    


end)
