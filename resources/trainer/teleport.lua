local nv, wp, showname1, showname2

RegisterNUICallback("teleport", function(data, cb) --Teleportation Options
	local action = data.action
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, 0)
	local playerPedPos = GetEntityCoords(playerPed, true)
	local playerVehPos = GetEntityCoords(playerVeh, true)
	
	if action == "nearestcar" then --Teleport Into Nearest Car
		nv = true
	elseif action == "waypoint" then --Teleport To Waypoint
		if DoesBlipExist(GetFirstBlipInfoId(8)) then
		
			local blipIterator = GetBlipInfoIdIterator(8)
			local blip = GetFirstBlipInfoId(8, blipIterator)
			local coords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
			
			if IsPedInAnyVehicle(playerPed, 0) and (GetPedInVehicleSeat(playerVeh, -1) == playerPed) then
				SetEntityCoords(playerVeh, coords.x, coords.y, 1000.0)
				FreezeEntityPosition(playerVeh, true)
				drawNotification("~y~Wait...")
				wp = true
			else
				SetEntityCoords(playerPed, coords.x, coords.y, 1000.0)
				FreezeEntityPosition(playerPed, true)
				drawNotification("~y~Wait...")
				wp = true
			end
			
		else
			drawNotification("~r~No Waypoint Set!")
		end
	elseif action == "forward" then --Teleport Forward
		if IsPedInAnyVehicle(playerPed, 0) and (GetPedInVehicleSeat(playerVeh, -1) == playerPed) then
			SetEntityCoords(playerVeh, playerVehPos.x + (3 * GetEntityForwardX(playerVeh)), playerVehPos.y + (3 * GetEntityForwardY(playerVeh)), playerVehPos.z - 0.75)
		else
			SetEntityCoords(playerPed, playerPedPos.x + (3 * GetEntityForwardX(playerPed)), playerPedPos.y + (3 * GetEntityForwardY(playerPed)), playerPedPos.z - 0.75)
		end
		drawNotification("~g~Teleported Forward")
	end
	cb("ok")
end)

RegisterNUICallback("onlineplayernametele", function(data, cb) --Online Player Names Options
	local action = data.action

	if action == "show1" then
		drawNotification("~g~Showing Player Names (1 - 14)!")
		drawNotification("~y~Disappears In 30 Seconds!")
		showname1 = true
		showname2 = false
	elseif action == "show2" then
		drawNotification("~g~Showing Player Names (15 - 24)!")
		drawNotification("~y~Disappears In 30 Seconds!")
		showname1 = false
		showname2 = true
	end	

	cb("ok")
end)

RegisterNUICallback("onlineplayertele", function(data, cb) --Online Player Teleportation Options
	local action = data.action
	local player = tonumber(action)
	local playerCoords = GetEntityCoords(GetPlayerPed(player), 1)
	local localPlayer = GetPlayerPed(-1)
	
	if GetPlayerPed(player) ~= 0 then
		if IsPedInAnyVehicle(GetPlayerPed(player), true) then
			local playerVeh = GetVehiclePedIsIn(GetPlayerPed(player), 0)
			local seat = 0
			if (IsVehicleSeatFree(playerVeh, 0) == false) then
				seat = 1
				if (IsVehicleSeatFree(playerVeh, 1) == false) then
					seat = 2
				end
			end
			if (IsVehicleSeatFree(playerVeh, seat) == false) then
				SetEntityCoords(localPlayer, playerCoords)
				drawNotification("~r~Teleport Into " .. player .. ". Players Vehicle Not Possible.~n~~n~~g~Teleported To " .. player .. ". Player On Foot.")
			else
				SetPedIntoVehicle(localPlayer, playerVeh, seat)
				drawNotification("~g~Teleported Into " .. player .. ". Players Vehicle.")
			end
		else
			if IsPedInAnyVehicle(localPlayer, 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(localPlayer, 0), -1) == localPlayer) then
				SetEntityCoords(GetVehiclePedIsIn(localPlayer, 0), playerCoords)
			else
				SetEntityCoords(localPlayer, playerCoords)
			end
			drawNotification("~g~Teleported To " .. player .. ". Player.")
		end
	else
		drawNotification("~r~Player " .. player .. " Doesn't Exist.")
	end
		
		
	cb("ok")
end)

Citizen.CreateThread(function() --Show Player Names
	while true do
		Citizen.Wait(1)
		
		if (showname1 == true) then
			opname("~s~Player 1: ~n~~r~" .. GetPlayerName(0) .. "", 0.950, 0.150)
			opname("~s~Player 2: ~n~~r~" .. GetPlayerName(1) .. "", 0.950, 0.200)
			opname("~s~Player 3: ~n~~r~" .. GetPlayerName(2) .. "", 0.950, 0.250)
			opname("~s~Player 4: ~n~~r~" .. GetPlayerName(3) .. "", 0.950, 0.300)
			opname("~s~Player 5: ~n~~r~" .. GetPlayerName(4) .. "", 0.950, 0.350)
			opname("~s~Player 6: ~n~~r~" .. GetPlayerName(5) .. "", 0.950, 0.400)
			opname("~s~Player 7: ~n~~r~" .. GetPlayerName(6) .. "", 0.950, 0.450)
			opname("~s~Player 8: ~n~~r~" .. GetPlayerName(7) .. "", 0.950, 0.500)
			opname("~s~Player 9: ~n~~r~" .. GetPlayerName(8) .. "", 0.950, 0.550)
			opname("~s~Player 10: ~n~~r~" .. GetPlayerName(9) .. "", 0.950, 0.600)
			opname("~s~Player 11: ~n~~r~" .. GetPlayerName(10) .. "", 0.950, 0.650)
			opname("~s~Player 12: ~n~~r~" .. GetPlayerName(11) .. "", 0.950, 0.700)
			opname("~s~Player 13: ~n~~r~" .. GetPlayerName(12) .. "", 0.950, 0.750)
			opname("~s~Player 14: ~n~~r~" .. GetPlayerName(13) .. "", 0.950, 0.800)
		elseif (showname2 == true) then
			opname("~s~Player 15: ~n~~r~" .. GetPlayerName(14) .. "", 0.950, 0.150)
			opname("~s~Player 16: ~n~~r~" .. GetPlayerName(15) .. "", 0.950, 0.200)
			opname("~s~Player 17: ~n~~r~" .. GetPlayerName(16) .. "", 0.950, 0.250)
			opname("~s~Player 18: ~n~~r~" .. GetPlayerName(17) .. "", 0.950, 0.300)
			opname("~s~Player 19: ~n~~r~" .. GetPlayerName(18) .. "", 0.950, 0.350)
			opname("~s~Player 20: ~n~~r~" .. GetPlayerName(19) .. "", 0.950, 0.400)
			opname("~s~Player 21: ~n~~r~" .. GetPlayerName(20) .. "", 0.950, 0.450)
			opname("~s~Player 22: ~n~~r~" .. GetPlayerName(21) .. "", 0.950, 0.500)
			opname("~s~Player 23: ~n~~r~" .. GetPlayerName(22) .. "", 0.950, 0.550)
			opname("~s~Player 24: ~n~~r~" .. GetPlayerName(23) .. "", 0.950, 0.600)
		end
	end
end)

Citizen.CreateThread(function() --Hide Player Names After 30 Seconds
	while true do
		Citizen.Wait(1)
		
		if (showname1 == true) then
			Citizen.Wait(30000)
			showname1 = false
		elseif (showname2 == true) then
			Citizen.Wait(30000)
			showname2 = false
		end
	end
end)

Citizen.CreateThread(function() --Teleport Into Nearest Car
	while true do
		Citizen.Wait(1)
		
		local playerPed = GetPlayerPed(-1)
		local playerPedPos = GetEntityCoords(playerPed, true)
		local NearestVehicle = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 4)
		local NearestVehiclePos = GetEntityCoords(NearestVehicle, true)
		local NearestPlane = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 16384)
		local NearestPlanePos = GetEntityCoords(NearestPlane, true)
		if (nv == true) then
			drawNotification("~y~Wait...~n~~n~Searching Vehicle")
			Citizen.Wait(1000)
			if (NearestVehicle == 0) then
				if (NearestPlane == 0) then
					drawNotification("~r~No Vehicle Found")
				else
					SetPedIntoVehicle(playerPed, NearestPlane, -1)
					drawNotification("~g~Teleported Into Nearest Vehicle.")
				end
			elseif (NearestVehicle ~= 0) then
				if (NearestPlane == 0) then
					SetPedIntoVehicle(playerPed, NearestVehicle, -1)
					drawNotification("~g~Teleported Into Nearest Car.")
				elseif (NearestPlane ~= 0) then
					if Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) < Vdist(NearestPlanePos.x, NearestPlanePos.y, NearestPlanePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
						SetPedIntoVehicle(playerPed, NearestVehicle, -1)
						drawNotification("~g~Teleported Into Nearest Vehicle.")
					elseif Vdist(NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) > Vdist(NearestPlanePos.x, NearestPlanePos.y, NearestPlanePos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
						SetPedIntoVehicle(playerPed, NearestPlane, -1)
						drawNotification("~g~Teleported Into Nearest Vehicle.")
					end
				end
			end
			nv = false
		end
	end
end)

Citizen.CreateThread(function() --Teleport To Waypoint
	while true do
		Citizen.Wait(1)
		
		local playerPed = GetPlayerPed(-1)
		local playerPedPos = GetEntityCoords(playerPed, true)
		local playerVeh = GetVehiclePedIsIn(playerPed, 0)
		local playerVehPos = GetEntityCoords(playerVeh, true)
		
		if (wp == true) then
			RequestCollisionAtCoord(playerPedPos.x, playerPedPos.y, getGroundZ(playerPedPos.x, playerPedPos.y, 800.0))
			Citizen.Wait(2500)
			if IsPedInAnyVehicle(playerPed, 0) and (GetPedInVehicleSeat(playerVeh, -1) == playerPed) then
				Citizen.Wait(1000)
				FreezeEntityPosition(playerVeh, false)
				SetEntityCoords(playerVeh, playerVehPos.x, playerVehPos.y, getGroundZ(playerVehPos.x, playerVehPos.y, 800.0))
				drawNotification("~g~Teleported To Waypoint With Vehicle!")
				wp = false
			else
				Citizen.Wait(1000)
				FreezeEntityPosition(playerPed, false)
				SetEntityCoords(playerPed, playerPedPos.x, playerPedPos.y, getGroundZ(playerPedPos.x, playerPedPos.y, 800.0))
				drawNotification("~g~Teleported To Waypoint On Foot!")
				wp = false
			end
		end
	end
end)

function opname(text, x, y) --Name Drawing
--	SetTextColour(255, 0, 0, 255)
	SetTextFont(6)
	SetTextScale(0.36, 0.36)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(0, 0, 0, 0, 0)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

function getGroundZ(x, y, z)
	RequestCollisionAtCoord(x, y, z)
	local result, groundZ = GetGroundZFor_3dCoord(x+0.0, y+0.0, z+0.0, Citizen.ReturnResultAnyway())
	return groundZ
end