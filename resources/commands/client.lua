RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, name, message)
	local monid = PlayerId()
	local sonid = GetPlayerFromServerId(id)
	if sonid == monid then
		TriggerEvent('chatMessage', name, {0, 255, 0}, message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(monid)), GetEntityCoords(GetPlayerPed(sonid)), true) < 19.999 then
		TriggerEvent('chatMessage', name, {0, 255, 0}, message)
	end
end)

RegisterNetEvent('sendProximityMessageMe')
AddEventHandler('sendProximityMessageMe', function(id, message)
	local name = user:getSessionVar("name")
	local monid = PlayerId()
	local sonid = GetPlayerFromServerId(id)
	if sonid == monid then
		-- TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 **" .. name .."  ".."^6  " .. message )
		TriggerEvent("pNotify:SendNotification", {text = "" .. name.first_name .. " " .. message .. "", type = "me", timeout = 5000, layout = "centerLeft",})
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(monid)), GetEntityCoords(GetPlayerPed(sonid)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 **" .. name .."  ".."^6  " .. message )
	end
end)

RegisterNetEvent('sendProximityMessageDo')
AddEventHandler('sendProximityMessageDo', function(id, name, message)
	local monid = PlayerId()
	local sonid = GetPlayerFromServerId(id)
	if sonid == monid then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6((" .. name .."))  ".."  " .. message)
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(monid)), GetEntityCoords(GetPlayerPed(sonid)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6((" .. name .."))  ".."  " .. message)
	end
end)
