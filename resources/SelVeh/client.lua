RegisterNetEvent("test:SelVehicle")
RegisterNetEvent("test:getVehicles")


VEHICLES = {}
local vente_location = {-45.228, -1083.123, 25.816}
local currentlocation = nil

Citizen.CreateThread(function()
	local loc = vente_location
	pos = vente_location
	local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
	SetBlipSprite(blip,207)
	SetBlipColour(blip, 3)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Revente')
	EndTextCommandSetBlipName(blip)
	SetBlipAsShortRange(blip,true)
	SetBlipAsMissionCreatorBlip(blip,true)
	checkgarage = 0
	while true do
		Wait(0)
		DrawMarker(1,vente_location[1],vente_location[2],vente_location[3],0,0,0,0,0,0,3.001,3.0001,0.5001,0,155,255,200,0,0,0,0)
		if GetDistanceBetweenCoords(vente_location[1],vente_location[2],vente_location[3],GetEntityCoords(LocalPed())) < 5 and IsPedInAnyVehicle(LocalPed(), true) == false then
			drawTxt('~g~E~s~ pour vendre le véhicule à 50% du prix d\'achat',0,1,0.5,0.8,0.6,255,255,255,255)		
			if IsControlJustPressed(1, 86) then				
				TriggerServerEvent('test:CheckForSelVeh',source)
			end
		end
	end
end)

AddEventHandler('test:SelVehicle', function(vehicle, plate)
	local car = GetHashKey(vehicle)	
	local plate = plate
	Citizen.CreateThread(function()		
		Citizen.Wait(0)
		local caissei = GetClosestVehicle(-45.228, -1083.123, 25.816, 3.000, 0, 70)
		SetEntityAsMissionEntity(caissei, true, true)		
		local platecaissei = GetVehicleNumberPlateText(caissei)
		if DoesEntityExist(caissei) then	
			if plate ~= platecaissei then					
				drawNotification("Ce n'est pas ton véhicule")
			else
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(caissei))
				TriggerServerEvent('test:SelVeh', plate)
				TriggerServerEvent("test:CheckGarageForVeh")
			end
		else
			drawNotification("Aucun véhicule présent")
		end
	end)
end)
			
AddEventHandler("test:getVehicles", function(THEVEHICLES)
    VEHICLES = {}
    VEHICLES = THEVEHICLES
end)
