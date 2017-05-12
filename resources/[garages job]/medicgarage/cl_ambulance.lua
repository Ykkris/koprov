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

RegisterNetEvent("notworkedambu")
AddEventHandler("notworkedambu", function()


	SetNotificationTextEntry("STRING");
	AddTextComponentString("~r~Vous n'avez pas le bon métier." );
	DrawNotification(false, true);

end)

RegisterNetEvent("workedambu")
AddEventHandler("workedambu", function()


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
	["ambulance"] = { event = 'ambulance:s_ambulance' }
}

function InitMenuVehicules()
	MenuTitle = "SpawnJobs"
	ClearMenu()
	Menu.addButton("Ambulance", "callSE", cmd["ambulance"].event)
end

function callSE(evt)
	Menu.hidden = not Menu.hidden
	Menu.renderGUI()
	TriggerServerEvent(evt)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DrawMarker(1, 404.911, -1433.288, 28.435, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)

		if GetDistanceBetweenCoords(404.911, -1433.288, 29.435, GetEntityCoords(LocalPed())) < 1 then
			drawTxt('Appuyez sur ~g~H~s~ pour faire apparaitre une ~b~ambulance', 2, 1, 0.5, 0.8, 0.6, 255, 255, 255, 255)
			if IsControlJustPressed(1, Keys["H"]) then
				InitMenuVehicules()
				Menu.hidden = not Menu.hidden
			end
		end
		Menu.renderGUI()
	end
end)

RegisterNetEvent('ambulance:c_ambulance')
AddEventHandler('ambulance:c_ambulance', function()
Citizen.Wait(0)
	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('ambulance')
	RequestModel(vehicle)
	while not HasModelLoaded(vehicle) do
		Wait(1)
	end
	local plate = math.random(100, 900)
	local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), -0.5, 20.0, 2.0)
	local spawned_camion = CreateVehicle(vehicle, coords, 412.0924, -1422.7177, 29.4427, false, true)
	SetEntityInvincible(vehicle, true)
	SetVehicleHasBeenOwnedByPlayer(vehicle, myPed)
	SetVehicleOnGroundProperly(spawned_car)
	SetVehicleNumberPlateText(spawned_car, ""..plate.." ")
	SetPedIntoVehicle(myPed, spawned_car, - 1)
	-- SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_camion))
end)