local isMedic = false 
local isInService = false 
local rank = "inconnu"
local checkpoints = {}
local existingVeh = nil 

-- Location to take service
local takingService = {
	{x=347.72, y=-1456.62, z=41.50}
}

AddEventHandler("playerSpawned", function()
	TriggerServerEvent("medic:checkIsMedic")
end)

RegisterNetEvent('medic:receiveIsMedic')
AddEventHandler('medic:receiveIsMedic', function(result)
	if(result == "inconnu") then
		isMedic = false
	else
		isMedic = true 
		rank = result
	end
end)

RegisterNetEvent('medic:nowMedic')
AddEventHandler('medic:nowMedic', function()
	isMedic = true
end)

RegisterNetEvent('medic:noLongerMedic')
AddEventHandler('medic:noLongerMedic', function()
	isMedic = false
	isInService = false
end)

RegisterNetEvent('medic:consultation')
AddEventHandler('medic:consultation', function(t, amount)
	if(isInService) then
		TriggerServerEvent("medic:consultationGranted", t, amount)
	else
		TriggerEvent('chatMessage', 'SYSTEM', {250, 0, 0}, "Merci de prendre votre service !")
	end
end)

RegisterNetEvent('medic:payConsultation')
AddEventHandler('medic:payConsultation', function(amount)
	TriggerServerEvent('bank:withdrawAmende', amount)
	TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Vous avez payé une consultation de $"..amount..".")
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
	DrawText(x, y)
end

function GetIsInService()
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
		if(isMedic) then
			if(isNearTakeService()) then
				if(isInService) then
					drawTxt("Appuyez sur ~g~E~s~ pour prendre le service.",0,1,0.5,0.8,0.6,255,255,255,255)
				else
					drawTxt("Appuyez sur ~g~E~s~ arrêter le service.",0,1,0.5,0.8,0.6,255,255,255,255)
				end
				if IsControlJustPressed(1, 38) then
					isInService = not isInService

					if(isInService) then
						GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), true, true)
					else
						local playerPed = GetPlayerPed(-1)

						TriggerServerEvent("skin_customization:SpawnPlayer")
						RemoveAllPedWeapons(playerPed)
					end
				end
			end
		end
	end
end)