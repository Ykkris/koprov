local isCop = false
local isInService = false
local rank = "inconnu"
local checkpoints = {}
local existingVeh = nil
local handCuffed = false
local isAlreadyDead = false
local allServiceCops = {}
local blipsCops = {}

-- Location to enable an officer service
local takingService = {
   {x=457.956909179688, y=-992.72314453125, z=30.6895866394043}
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
						
	TriggerServerEvent("mm:spawn")
	RemoveAllPedWeapons(playerPed)
	
	if(existingVeh ~= nil) then
		SetEntityAsMissionEntity(existingVeh, true, true)
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(existingVeh))
		existingVeh = nil
	end

	ServiceOff()
end)

RegisterNetEvent('police:checkInventory')
AddEventHandler('police:checkInventory', function()
	if(isInService) then
		t, distance = GetClosestPlayer()
		if(distance ~= -1 and distance < 1) then
			TriggerServerEvent("police:targetCheckInventory", GetPlayerServerId(t))
		else
			TriggerEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "No player near you !")
		end
	else
		TriggerEvent("pNotify:SendNotification", {
			text = "Merci de prendre votre service !",
			type = "warning",
			timeout = 2500,
			layout = "centerLeft",
			})
	end
end)

RegisterNetEvent('police:fines')
AddEventHandler('police:fines', function(t, amount)
	if(isInService) then
		TriggerServerEvent("police:finesGranted", t, amount)
	else
		TriggerEvent("pNotify:SendNotification", {
			text = "Merci de prendre votre service !",
			type = "warning",
			timeout = 2500,
			layout = "centerLeft",
			})
	end
end)

RegisterNetEvent('police:cuff')
AddEventHandler('police:cuff', function(t)
	if(isInService) then
		t, distance = GetClosestPlayer()
		if(distance ~= -1 and distance < 1) then
			TriggerServerEvent("police:cuffGranted", GetPlayerServerId(t))
		else
			TriggerEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "No player near you (maybe get closer) !")
		end
	else
		TriggerEvent("pNotify:SendNotification", {
			text = "Merci de prendre votre service !",
			type = "warning",
			timeout = 2500,
			layout = "centerLeft",
			})
	end
end)

RegisterNetEvent('police:getArrested')
AddEventHandler('police:getArrested', function()
	if(isCop == false) then
		handCuffed = not handCuffed
		if(handCuffed) then
			TriggerEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "You are now cuff.")
		else
			TriggerEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "Freedom !")
		end
	end
end)

RegisterNetEvent('police:payFines')
AddEventHandler('police:payFines', function(amount)
	TriggerServerEvent('bank:withdrawAmende', amount)
	TriggerEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "You paid a $"..amount.." fine.")
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
			TriggerEvent('es_freeroam:notify', source, "CHAR_STEVE", 1, "LSPD", false, "No player near you (maybe get closer) !")
		end
	else
		TriggerEvent("pNotify:SendNotification", {
			text = "Merci de prendre votre service !",
			type = "warning",
			timeout = 2500,
			layout = "centerLeft",
			})
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

RegisterNetEvent('police:unseatme')
AddEventHandler('police:unseatme', function(t)
	local ped = GetPlayerPed(t)        
	ClearPedTasksImmediately(ped)
	plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
	local xnew = plyPos.x+2
	local ynew = plyPos.y+2
   
	SetEntityCoords(GetPlayerPed(-1), xnew, ynew, plyPos.z)
end)

RegisterNetEvent('police:resultAllCopsInService')
AddEventHandler('police:resultAllCopsInService', function(array)
	allServiceCops = array
	enableCopBlips()
end)

function enableCopBlips()

	for k, existingBlip in pairs(blipsCops) do
        RemoveBlip(existingBlip)
    end
	blipsCops = {}
	
	local localIdCops = {}
	for id = 0, 64 do
		if(NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= GetPlayerPed(-1)) then
			for i,c in pairs(allServiceCops) do
				if(i == GetPlayerServerId(id)) then
					localIdCops[id] = c
					break
				end
			end
		end
	end
	
	for id, c in pairs(localIdCops) do
		local ped = GetPlayerPed(id)
		local blip = GetBlipFromEntity(ped)
		
		if not DoesBlipExist( blip ) then

			blip = AddBlipForEntity( ped )
			SetBlipSprite( blip, 1 )
			Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true )
			HideNumberOnBlip( blip )
			SetBlipNameToPlayerName( blip, id )
			
			SetBlipScale( blip,  0.85 )
			SetBlipAlpha( blip, 255 )
			
			table.insert(blipsCops, blip)
		else
			
			blipSprite = GetBlipSprite( blip )
			
			HideNumberOnBlip( blip )
			if blipSprite ~= 1 then
				SetBlipSprite( blip, 1 )
				Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true )
			end
			
			Citizen.Trace("Name : "..GetPlayerName(id))
			SetBlipNameToPlayerName( blip, id )
			SetBlipScale( blip,  0.85 )
			SetBlipAlpha( blip, 255 )
			
			table.insert(blipsCops, blip)
		end
	end
end

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

function ServiceOn()
	TriggerServerEvent("police:registerservice")
	isInService = true
	TriggerServerEvent("jobssystem:jobs", 2)
	TriggerServerEvent("police:takeService")
end

function ServiceOff()
	TriggerServerEvent("police:unregisterservice")
	isInService = false
	TriggerServerEvent("jobssystem:jobs", 1)
	TriggerServerEvent("police:breakService")
	
	allServiceCops = {}
	
	for k, existingBlip in pairs(blipsCops) do
        RemoveBlip(existingBlip)
    end
	blipsCops = {}
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if(isCop) then
			if(isNearTakeService()) then
			
				DisplayHelpText('Press ~INPUT_CONTEXT~ to open the ~b~cops locker',0,1,0.5,0.8,0.6,255,255,255,255) -- ~g~E~s~
				if IsControlJustPressed(1,51) then
					OpenMenuVest()
				end
			end
			if(isInService) then
				if IsControlJustPressed(1,166) then 
					OpenPoliceMenu()
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

local alreadyDead = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if(isCop) then
			if(isInService) then
			
				if(IsPlayerDead(PlayerId())) then
					if(alreadyDead == false) then
						ServiceOff()
						alreadyDead = true
					end
				else
					alreadyDead = false
				end
			end
		end
	end
end)
