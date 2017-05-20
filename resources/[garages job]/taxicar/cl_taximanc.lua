function LocalPed()
	return GetPlayerPed(-1)
end

function drawTxt(text, font, centre, x, y, scale, r, g, b, a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

RegisterNetEvent("notworked")
AddEventHandler("notworked", function()


	SetNotificationTextEntry("STRING");
	AddTextComponentString("~r~Impossible de faire spawn !" );
	DrawNotification(false, true);

end)

RegisterNetEvent("worked")
AddEventHandler("worked", function()


	SetNotificationTextEntry("STRING");
	AddTextComponentString("~g~Vehicule disponible !" );
	DrawNotification(false, true);

end)

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

-- NEW VERSION
local cmd = {
	["taxicar"] = { event = 'taximanc:s_taxicar' }
}

function InitMenuVehicules()
	MenuTitle = "SpawnJobs"
	ClearMenu()
	Menu.addButton("Voiture de taxis", "callSE", cmd["taxicar"].event)
end

function callSE(evt)
	Menu.hidden = not Menu.hidden
	Menu.renderGUI()
	TriggerServerEvent(evt)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DrawMarker(1, 908.17, -176.68, 73.166, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 185, 169, 65, 200, 0, 0, 0, 0)

		if GetDistanceBetweenCoords(908.17, -176.68, 74.166, GetEntityCoords(LocalPed())) < 2 then
			drawTxt('Appuyez sur ~g~H~s~ pour faire apparaitre un ~b~taxi', 2, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
			if IsControlJustPressed(1, Keys["H"]) then
				InitMenuVehicules()
				Menu.hidden = not Menu.hidden
			end
		elseif (GetDistanceBetweenCoords(908.17, -176.68, 74.166, GetEntityCoords(LocalPed())) > 2 and not Menu.hidden) then
				Menu.hidden = not Menu.hidden
		end
		Menu.renderGUI()
	end
end)

RegisterNetEvent('taximanc:c_taxicar')
AddEventHandler('taximanc:c_taxicar', function()
Citizen.Wait(0)
	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('taxi')

	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end

	local plate = math.random(100, 900)
	local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
	local spawned_car = CreateVehicle(vehicle, coords, 908.9624, -177.1851, 74.2001, true, false)
	
	SetVehicleOnGroundProperly(spawned_car)
	SetVehicleNumberPlateText(spawned_car, "CAB "..plate.." ")
	SetPedIntoVehicle(myPed, spawned_car, - 1)
	SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(vehicle))
end)
