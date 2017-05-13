local isCop = false
local isInService = false
local rank = "inconnu"
local checkpoints = {}
local existingVeh = nil
local handCuffed = false

-- Location to enable an officer service
local takingService = {
  {x=452.041, y=-980.194, z=29.689}
}

AddEventHandler("playerSpawned", function()
	TriggerServerEvent("police:checkIsCop")
end)

RegisterNetEvent('police:receiveIsCop')
AddEventHandler('police:receiveIsCop', function(result)
	if(result == "inconnu") then
		isCop = false
	else
		isCop = true
		rank = result
	end
end)

RegisterNetEvent('police:nowCop')
AddEventHandler('police:nowCop', function()
	isCop = true
end)

RegisterNetEvent('police:noLongerCop')
AddEventHandler('police:noLongerCop', function()
	isCop = false
	isInService = false
	
	local playerPed = GetPlayerPed(-1)
						
	TriggerServerEvent("skin_customization:SpawnPlayer")
	RemoveAllPedWeapons(playerPed)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNIFE"), true, true)
	
	if(existingVeh ~= nil) then
		SetEntityAsMissionEntity(existingVeh, true, true)
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(existingVeh))
		existingVeh = nil
	end
end)

RegisterNetEvent('police:checkInventory')
AddEventHandler('police:checkInventory', function()
	if(isInService) then
		t, distance = GetClosestPlayer()
		if(distance ~= -1 and distance < 1) then
			TriggerServerEvent("police:targetCheckInventory", GetPlayerServerId(t))
		else
			TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "No player near you !")
		end
	else
		TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Please take your service first !")
	end
end)

RegisterNetEvent('police:fines')
AddEventHandler('police:fines', function(t, amount)
	if(isInService) then
		TriggerServerEvent("police:finesGranted", t, amount)
	else
		TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Please take your service first !")
	end
end)

RegisterNetEvent('police:cuff')
AddEventHandler('police:cuff', function(t)
	if(isInService) then
		t, distance = GetClosestPlayer()
		if(distance ~= -1 and distance < 1) then
			TriggerServerEvent("police:cuffGranted", GetPlayerServerId(t))
		else
			TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "No player near you (maybe get closer) !")
		end
	else
		TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Please take your service first !")
	end
end)

RegisterNetEvent('police:getArrested')
AddEventHandler('police:getArrested', function()
	if(isCop == false) then
		handCuffed = not handCuffed
		if(handCuffed) then
			TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "You are now cuff.")
		else
			TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Freedom !")
		end
	end
end)

RegisterNetEvent('police:payFines')
AddEventHandler('police:payFines', function(amount)
	TriggerServerEvent('bank:withdrawAmende', amount)
	TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "You paid a $"..amount.." fine.")
end)

RegisterNetEvent('police:dropIllegalItem')
AddEventHandler('police:dropIllegalItem', function(id)
	TriggerEvent("player:looseItem", tonumber(id), exports.vdk_inventory:getQuantity(id))
end)

RegisterNetEvent('police:forceEnter')
AddEventHandler('police:forceEnter', function(id)
	if(isInService) then
		t, distance = GetClosestPlayer()
		if(distance ~= -1 and distance < 3) then
			local v = GetVehiclePedIsIn(GetPlayerPed(-1), true)
			Citizen.Trace("Veh : " .. v)
			TriggerServerEvent("police:forceEnterAsk", GetPlayerServerId(t), v)
		else
			TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "No player near you (maybe get closer) !")
		end
	else
		TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Please take your service first !")
	end
end)

RegisterNetEvent('police:forcedEnteringVeh')
AddEventHandler('police:forcedEnteringVeh', function(veh)
	if(handCuffed) then
		local pos = GetEntityCoords(GetPlayerPed(-1))
		local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

		local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
		local a, b, c, d, vehicleHandle = GetRaycastResult(rayHandle)

		if vehicleHandle ~= nil then
			SetPedIntoVehicle(GetPlayerPed(-1), vehicleHandle, 1)
		end
	end
end)

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function getIsInService()
	return isInService
end

function isNearTakeService()
	for i = 1, #takingService do
		local ply = GetPlayerPed(-1)
		local plyCoords = GetEntityCoords(ply, 0)
		local distance = GetDistanceBetweenCoords(takingService[i].x, takingService[i].y, takingService[i].z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
		if(distance < 30) then
			DrawMarker(1, takingService[i].x, takingService[i].y, takingService[i].z-1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.5, 0, 0, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		end
		if(distance < 2) then
			return true
		end
	end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if(isCop) then
			if(isNearTakeService()) then
				if(isInService) then
					drawTxt("Appuyez sur ~g~E~s~ pour prendre le service.",0,1,0.5,0.8,0.6,255,255,255,255)
				else
					drawTxt("Appuyez sur ~g~E~s~ arrêter le service.",0,1,0.5,0.8,0.6,255,255,255,255)
				end
				if IsControlJustPressed(1, 38)  then
					isInService = not isInService
					
					if(isInService) then
						
						--Thanks to Xtas3
						-- SetPedPropIndex(GetPlayerPed(-1), 0, 46, 0, 2)            --Casquette Police
						-- SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 2)  --Chemise Police
						-- SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 2)   --Ceinture+matraque Police 
						-- SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 2)   --Pantalon Police
						-- SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 2)   -- Chaussure Police
						-- SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 0, 2) --grade 0
						
						GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), true, true)
						GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 50, true, true)
						GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), true, true)
						GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), 25, true, true)
					else
						local playerPed = GetPlayerPed(-1)
						
						TriggerServerEvent("skin_customization:SpawnPlayer")
						RemoveAllPedWeapons(playerPed)
						GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNIFE"), true, true)
					end
				end
			end
		else
			if (handCuffed == true) then
			  RequestAnimDict('mp_arresting')

			  while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(0)
			  end

			  local myPed = PlayerPedId()
			  local animation = 'idle'
			  local flags = 16

			  TaskPlayAnim(myPed, 'mp_arresting', animation, 8.0, -8, -1, flags, 0, 0, 0, 0)
			end
		end
    end
end)