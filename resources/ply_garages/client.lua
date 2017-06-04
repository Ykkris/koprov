--[[Register]]--

RegisterNetEvent("ply_garages:getVehicles")
RegisterNetEvent('ply_garages:SpawnVehicle')
RegisterNetEvent('ply_garages:StoreVehicle')
RegisterNetEvent('ply_garages:SelVehicle')
RegisterNetEvent('ply_garages:getFourVehicles')



--[[Local/Global]]--

VEHICLES = {}
local vente_location = {-45.228, -1083.123, 25.816}
local inrangeofgarage = false
local currentlocation = nil

local garages = {
	{name="Garage", colour=3, id=50, x=215.124, y=-791.377, z=29.646},
  	{name="Garage", colour=3, id=50, x=-334.685, y=289.773, z=84.705},
  	{name="Garage", colour=3, id=50, x=-55.272, y=-1838.71, z=25.442},
  	{name="Garage", colour=3, id=50, x=-39.266, y=-2653.097, z=5.000},
  	{name="Garage", colour=3, id=50, x=114.427, y=-3103.314, z=5.009},
  	{name="Garage", colour=3, id=50, x=911.708, y=-163.067, z=73.424},
  	{name="Garage", colour=3, id=50, x=460.450, y=-1694.450, z=28.295},
  	{name="Garage", colour=3, id=50, x=431.152, y=-997.132, z=24.763},
  	{name="Garage", colour=3, id=50, x=-570.721, y=5239.781, z=69.469},
  	{name="Garage", colour=3, id=50, x=2665.922, y=3517.127, z=51.782},
  	{name="Garage", colour=3, id=50, x=1552.983, y=-2121.615, z=76.237},
  	{name="Garage", colour=3, id=50, x=2674.913, y=1704.303, z=23.488},
  	{name="Garage", colour=3, id=50, x=2904.476, y=4396.575, z=49.263},
  	{name="Garage", colour=3, id=50, x=375.589, y=-1443.655, z=29.431},
  	{name="Fourrière", colour=1, id=68, x=405.175, y=-1642.475, z=28.295},
}

garageSelected = { {x=nil, y=nil, z=nil}, }

--[[Functions]]--

function MenuGarage()

	if GetDistanceBetweenCoords(405.175, -1642.475, 28.295, GetEntityCoords(LocalPed())) < 10 then
		TriggerServerEvent("ply_garages:CheckFourForVeh")
	else
		TriggerServerEvent("ply_garages:CheckGarageForVeh")
	end 

    ped = GetPlayerPed(-1);
    MenuTitle = "Garage"
    ClearMenu()
    if GetDistanceBetweenCoords(405.175, -1642.475, 28.295, GetEntityCoords(LocalPed())) < 10 then
    	MenuTitle = "Fourriere"
		Menu.addButton("Sortir un véhicule","ListeVehicule",nil)
    	Menu.addButton("Fermer","CloseMenu",nil) 
	else
    Menu.addButton("Rentrer le véhicule","RentrerVehicule",nil)
    Menu.addButton("Sortir un véhicule","ListeVehicule",nil)
    Menu.addButton("Fermer","CloseMenu",nil)
    end 
end

function RentrerVehicule()
	local caissei = GetClosestVehicle(garageSelected.x, garageSelected.y, garageSelected.z, 3.000, 0, 70)	
	SetEntityAsMissionEntity(caissei, true, true)		
	local plate = GetVehicleNumberPlateText(caissei)
	TriggerServerEvent('ply_garages:CheckForVeh', plate)
	CloseMenu()
end

function ListeVehicule()
    ped = GetPlayerPed(-1);
    MenuTitle = "Vehicules"
    ClearMenu()
    for ind, value in pairs(VEHICLES) do
    	if value.vehicle_state == "four" then
    		value.vehicle_state = "~r~150$~w~"
    	end
    	if value.vehicle_state == "in" then
    		value.vehicle_state = ""
    	end
            Menu.addButton(tostring(value.vehicle_name).. " n°" .. tostring(value.vehicle_plate) .." ".. tostring(value.vehicle_state), "OptionVehicle", value.id)
    end    
    Menu.addButton("Retour","MenuGarage",nil)
end

function OptionVehicle(vehID)
	local vehID = vehID
    MenuTitle = "Options"
    ClearMenu()
    Menu.addButton("Sortir", "SortirVehicule", vehID)
    Menu.addButton("Retour", "ListeVehicule", nil)
end

function SortirVehicule(vehID)
	local vehID = vehID
	TriggerServerEvent('ply_garages:CheckForSpawnVeh', vehID)
	CloseMenu()
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function CloseMenu()
    Menu.hidden = true
end

function LocalPed()
	return GetPlayerPed(-1)
end

function IsPlayerInRangeOfGarage()
	return inrangeofgarage
end

function Chat(debugg)
    TriggerEvent("chatMessage", '', { 0, 0x99, 255 }, tostring(debugg))
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

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for _, garage in pairs(garages) do
			DrawMarker(1, garage.x, garage.y, garage.z, 0, 0, 0, 0, 0, 0, 3.001, 3.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 1.5 then
				drawTxt('~g~E~s~ pour ouvrir le menu',0,1,0.5,0.8,0.6,255,255,255,255)
				if IsControlJustPressed(1, 86) then
					garageSelected.x = garage.x
					garageSelected.y = garage.y
					garageSelected.z = garage.z
					MenuGarage()
					Menu.hidden = not Menu.hidden 
				end
				Menu.renderGUI() 
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local near = false
		Citizen.Wait(0)
		for _, garage in pairs(garages) do		
			if (GetDistanceBetweenCoords(garage.x, garage.y, garage.z, GetEntityCoords(LocalPed())) < 1.5 and near ~= true) then 
				near = true							
			end
		end
		if near == false then 
			Menu.hidden = true;
		end
	end
end)

Citizen.CreateThread(function()
    for _, item in pairs(garages) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipAsShortRange(item.blip, true)
	    SetBlipColour(item.blip, item.colour)
	    SetBlipScale(item.blip, 0.7)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
end)

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
				TriggerServerEvent('ply_garages:CheckForSelVeh',source)
			end
		end
	end
end)



--[[Events]]--

AddEventHandler("ply_garages:getVehicles", function(THEVEHICLES)
    VEHICLES = {}
    VEHICLES = THEVEHICLES
end)

AddEventHandler("playerSpawned", function()
    TriggerServerEvent("ply_garages:CheckGarageForVeh")
end)

AddEventHandler('ply_garages:SpawnVehicle', function(vehicle, plate, state, primarycolor, secondarycolor, pearlescentcolor, wheelcolor)
	local car = GetHashKey(vehicle)
	local plate = plate
	local state = state
	local primarycolor = tonumber(primarycolor)
	local secondarycolor = tonumber(secondarycolor)
	local pearlescentcolor = tonumber(pearlescentcolor)
	local wheelcolor = tonumber(wheelcolor)
	local playerPed = GetPlayerPed(-1)
	Citizen.CreateThread(function()
		Citizen.Wait(3000)
		local caisseo = GetClosestVehicle(garageSelected.x, garageSelected.y, garageSelected.z, 3.000, 0, 70)
		if DoesEntityExist(caisseo) then
			TriggerEvent("pNotify:SendNotification", { text = "La zone est encombrée", type = "warning", timeout = 10000, layout = "centerLeft",}) 
		else
			if state == "out" then
				TriggerEvent("pNotify:SendNotification", { text = "Ce véhicule n'est pas dans ton garage", type = "warning", timeout = 10000, layout = "centerLeft",})
			else
				local mods = {}
				for i = 0,24 do
					mods[i] = GetVehicleMod(veh,i)
				end
				RequestModel(car)
				while not HasModelLoaded(car) do
				Citizen.Wait(0)
				end
				veh = CreateVehicle(car, garageSelected.x, garageSelected.y, garageSelected.z, 0.0, true, false)
				for i,mod in pairs(mods) do
					SetVehicleModKit(personalvehicle,0)
					SetVehicleMod(personalvehicle,i,mod)
				end
				SetVehicleNumberPlateText(veh, plate)
				SetVehicleOnGroundProperly(veh)
				SetVehicleHasBeenOwnedByPlayer(veh,true)
				local id = NetworkGetNetworkIdFromEntity(veh)
				SetNetworkIdCanMigrate(id, true)
				SetVehicleColours(veh, primarycolor, secondarycolor)
				SetVehicleExtraColours(veh, pearlescentcolor, wheelcolor)
				SetEntityInvincible(veh, false) 
				TriggerEvent("pNotify:SendNotification", { text = "Ton véhicule a été <b style='color:green'>sorti</b> du garage", type = "info", timeout = 2500, layout = "centerLeft",})
				TaskWarpPedIntoVehicle(playerPed, veh, -1)
				if GetDistanceBetweenCoords(405.175, -1642.475, 28.295, GetEntityCoords(LocalPed())) < 10 then
					TriggerServerEvent('garages:ToPay')
				end 				
				TriggerServerEvent('ply_garages:SetVehOut', vehicle, plate)
   				TriggerServerEvent("ply_garages:CheckGarageForVeh")
			end
		end
	end)
end)

AddEventHandler('ply_garages:StoreVehicle', function(vehicle, plate)
	local car = GetHashKey(vehicle)	
	local platereceived = plate
	Citizen.CreateThread(function()
		Citizen.Wait(3000)
		local caissei = GetClosestVehicle(garageSelected.x, garageSelected.y, garageSelected.z, 3.000, 0, 70)
		SetEntityAsMissionEntity(caissei, true, true)		
		local platecaissei = GetVehicleNumberPlateText(caissei)
		if DoesEntityExist(caissei) then	
			if plate ~= platecaissei then					
				TriggerEvent("pNotify:SendNotification", { text = "Ce n'est pas ton véhicule", type = "warning", timeout = 10000, layout = "centerLeft",})
			else
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(caissei))
				TriggerEvent("pNotify:SendNotification", { text = "Ton véhicule a été <b style='color:green'>rentré</b> au garage", type = "info", timeout = 2500, layout = "centerLeft",})
				TriggerServerEvent('ply_garages:SetVehIn', plate)
				TriggerServerEvent("ply_garages:CheckGarageForVeh")
			end
		else
			TriggerEvent("pNotify:SendNotification", { text = "Aucun véhicule n'est sur la zone", type = "warning", timeout = 10000, layout = "centerLeft",})
		end   
	end)
end)

AddEventHandler('ply_garages:SelVehicle', function(vehicle, plate)
	local car = GetHashKey(vehicle)	
	local plate = plate
	Citizen.CreateThread(function()		
		Citizen.Wait(0)
		local caissei = GetClosestVehicle(vente_location[1],vente_location[2],vente_location[3], 3.000, 0, 70)
		SetEntityAsMissionEntity(caissei, true, true)
		local platecaissei = GetVehicleNumberPlateText(caissei)
		if DoesEntityExist(caissei) then
			if plate ~= platecaissei then
				TriggerEvent("pNotify:SendNotification", { text = "Ce n'est pas ton véhicule", type = "warning", timeout = 10000, layout = "centerLeft",})
			else
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(caissei))
				TriggerServerEvent('ply_garages:SelVeh', plate)
				TriggerServerEvent("ply_garages:CheckGarageForVeh")
			end
		else
			TriggerEvent("pNotify:SendNotification", { text = "Aucun véhicule n'est sur la zone", type = "warning", timeout = 10000, layout = "centerLeft",})
		end
	end)
end)

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		RemoveIpl('v_carshowroom')
		RemoveIpl('shutter_open')
		RemoveIpl('shutter_closed')
		RemoveIpl('shr_int')
		RemoveIpl('csr_inMission')
		RequestIpl('v_carshowroom')
		RequestIpl('shr_int')
		--RequestIpl('csr_inMission')
		RequestIpl('shutter_closed')
		firstspawn = 1
	end
end)
