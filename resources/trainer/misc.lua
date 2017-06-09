local autoparachute, blackout, mobileradio, dfps,
	  prevframes, prevtime, curframes, curtime,
	  dspeedo, nonpcstraffic, freezeradio,
	  radioname, explodevehicles, noclipmode, vibrator
local dropweapon = true
local fps = 0
local prevframes = 0
local curframes = 0
local prevtime = 0
local curtime = 0
local speed = 999999999
local kmh = true
local mph = false

RegisterNUICallback("misc", function(data, cb) --Miscellaneous Options
	local playerPed = GetPlayerPed(-1)
	local action = data.action
	local newstate = data.newstate

	if action == "autopara" then --Always Parachute
		autoparachute = newstate
		if (autoparachute == true) then
			drawNotification("~g~Always Parachute Enabled!")
		else
			drawNotification("~r~Always Parachute Disabled!")
		end
	elseif action == "blackoutonoff" then --Blackout
		blackout = newstate
		if (blackout == true) then
			drawNotification("~g~Blackout Enabled!")
		else
			drawNotification("~r~Blackout Disabled!")
		end
	elseif action == "mblradio" then --Mobile Radio
		mobileradio = newstate
		if (mobileradio == true) then
			drawNotification("~g~Mobile Radio Enabled!")
		else
			drawNotification("~r~Mobile Radio Disabled!")
		end
	elseif action == "drawfps" then --Draw FPS
		dfps = newstate
		if (dfps == true) then
			drawNotification("~g~Draw FPS Enabled!")
		else
			drawNotification("~r~Draw FPS Disabled!")
		end
	elseif action == "drawspeedo" then --Draw Speedometer
		dspeedo = newstate
		if (dspeedo == true) then
			drawNotification("~g~Speedometer Enabled!")
		else
			drawNotification("~r~Speedometer Disabled!")
		end
	elseif action == "drawspeedokmh" then --Set Speedometer (KMH)
		mph = false
		kmh = true
	elseif action == "drawspeedomph" then --Set Speedometer (MPH)
		kmh = false
		mph = true
	elseif action == "npcstraffic" then --No NPCs & Traffic
		nonpcstraffic = newstate
		if (nonpcstraffic == true) then
			drawNotification("~r~NPCs & Traffic Disabled!")
		else
			drawNotification("~g~NPCs & Traffic Enabled!")
		end
	elseif action == "explodevehs" then
		explodevehicles = newstate
		if (explodevehicles == true) then
			drawNotification("~g~Explode Nearest Vehicles Enabled!")
		else
			drawNotification("~r~Explode Nearest Vehicles Disabled!")
		end
	elseif action == "noclip" then
		noclipmode = newstate
		if (noclipmode == true) then
			drawNotification("~g~No Clip Mode Enabled!")
		else
			drawNotification("~r~No Clip Mode Disabled!")
			Citizen.InvokeNative(0xD86D101FCFD00A4B, GetPlayerPed(-1), 2)
			Citizen.InvokeNative(0xD86D101FCFD00A4B, GetPlayerPed(-1), 3)
			SetEntityCollision(GetPlayerPed(-1), true, true)
			FreezeEntityPosition(GetPlayerPed(-1), false)
		end
	elseif action == "vib" then --Vibrator
		vibrator = newstate
		if (vibrator == true) then
			drawNotification("~g~Vibrator Enabled!")
		else
			drawNotification("~r~Vibrator Disabled!")
		end
	end

	cb("ok")
end)

RegisterNUICallback("radio", function(data, cb) --Radio Options
	local playerPed = GetPlayerPed(-1)

	if data.action == "skip" then --Skip Song (Radio)
		SkipRadioForward()
	elseif data.action == "unfreeze" then --Unfreeze Radio Station
		freezeradio = false
	else
		freezeradio = true
		radioname = data.action
	end

	cb("ok")
end)

RegisterNUICallback("weather", function(data, cb) --Weather Options
	local weather = data.action
	local weathername

	SetWeatherTypePersist(weather)
	SetWeatherTypeNowPersist(weather)
	SetWeatherTypeNow(weather)
	SetOverrideWeather(weather)
	
	if weather == "EXTRASUNNY" then
		weathername = "Extra Sunny"
	elseif weather == "SNOWLIGHT" then
		weathername = "Light Snow"
	else
		weathername = string.lower(weather)
	end
	
	drawNotification("~g~Weather changed to " .. FirstToUpper(weathername) .. ".")
	cb("ok")
end)

RegisterNUICallback("time", function(data, cb) --Time Options
	local hour
	
	if data.action == "6" or data.action == "12" or data.action == "18" or data.action == "0" then
		hour = tonumber(data.action)
	elseif data.action == "add" then
		if GetClockHours() == 23 then
			hour = 0
		else
			hour = GetClockHours() + 1
		end
	elseif data.action == "reduce" then
		if GetClockHours() == 0 then
			hour = 23
		else
			hour = GetClockHours() - 1
		end
	end
	NetworkOverrideClockTime(hour, 0, 0)

	drawNotification("~g~Time changed to " .. hour .. ":00.")
	cb("ok")
end)

RegisterNUICallback("bogyguard", function(data, cb) --Bodyguard Options
	local playerPed = GetPlayerPed(-1)
	local playerPedPos = GetEntityCoords(playerPed, true)
	local x, y, z = table.unpack(playerPedPos)
	local action = data.action
	local GroupHandle = GetPlayerGroup(PlayerId())
	
	SetGroupSeparationRange(GroupHandle, 999999.9)

	if action == "spawn" then
		if (GetPedAsGroupMember(GroupHandle, 0) == 0) or (GetPedAsGroupMember(GroupHandle, 1) == 0) or (GetPedAsGroupMember(GroupHandle, 2) == 0) or (GetPedAsGroupMember(GroupHandle, 3) == 0) or (GetPedAsGroupMember(GroupHandle, 4) == 0) or (GetPedAsGroupMember(GroupHandle, 5) == 0) or (GetPedAsGroupMember(GroupHandle, 6) == 0) then
			local Ped = ClonePed(playerPed, GetEntityHeading(PlayerPedId()), 1, 1)
			local Pedblip = AddBlipForEntity(Ped)
			
			SetBlipSprite(Pedblip, 143)
			SetBlipColour(Pedblip, 3)
			
			SetPedAsGroupLeader(playerPed, GroupHandle)
			SetPedAsGroupMember(Ped, GroupHandle)
			SetPedNeverLeavesGroup(Ped, true)
			SetGroupFormation(GroupHandle, 2)
			
			SetEntityInvincible(Ped, true)
			SetPedCanBeTargetted(Ped, false)
			GiveWeaponToPed(Ped, GetHashKey("WEAPON_MINIGUN"), 999999999, false, true)
			SetPedInfiniteAmmo(Ped, true)
			SetPedInfiniteAmmoClip(Ped, true)
			
			
			drawNotification("~g~Bodyguard Spawned")
		else
			drawNotification("~r~Maximum 7 Bodyguards")
		end
	elseif action == "deleteall" then
		local ped1 = GetPedAsGroupMember(GroupHandle, 0)
		local ped2 = GetPedAsGroupMember(GroupHandle, 1)
		local ped3 = GetPedAsGroupMember(GroupHandle, 2)
		local ped4 = GetPedAsGroupMember(GroupHandle, 3)
		local ped5 = GetPedAsGroupMember(GroupHandle, 4)
		local ped6 = GetPedAsGroupMember(GroupHandle, 5)
		local ped7 = GetPedAsGroupMember(GroupHandle, 6)
		
		RemoveBlip(GetBlipFromEntity(ped1))
		RemoveBlip(GetBlipFromEntity(ped2))
		RemoveBlip(GetBlipFromEntity(ped3))
		RemoveBlip(GetBlipFromEntity(ped4))
		RemoveBlip(GetBlipFromEntity(ped5))
		RemoveBlip(GetBlipFromEntity(ped6))
		RemoveBlip(GetBlipFromEntity(ped7))
		
		
		SetEntityCoords(ped1, 0.0, 0.0, 0.0, false, false, false, true)
		SetEntityCoords(ped2, 0.0, 0.0, 0.0, false, false, false, true)
		SetEntityCoords(ped3, 0.0, 0.0, 0.0, false, false, false, true)
		SetEntityCoords(ped4, 0.0, 0.0, 0.0, false, false, false, true)
		SetEntityCoords(ped5, 0.0, 0.0, 0.0, false, false, false, true)
		SetEntityCoords(ped6, 0.0, 0.0, 0.0, false, false, false, true)
		SetEntityCoords(ped7, 0.0, 0.0, 0.0, false, false, false, true)
		
		FreezeEntityPosition(ped1, true)
		FreezeEntityPosition(ped2, true)
		FreezeEntityPosition(ped3, true)
		FreezeEntityPosition(ped4, true)
		FreezeEntityPosition(ped5, true)
		FreezeEntityPosition(ped6, true)
		FreezeEntityPosition(ped7, true)
		
		SetEntityAsMissionEntity(ped1, 1, 1)
		SetEntityAsMissionEntity(ped2, 1, 1)
		SetEntityAsMissionEntity(ped3, 1, 1)
		SetEntityAsMissionEntity(ped4, 1, 1)
		SetEntityAsMissionEntity(ped5, 1, 1)
		SetEntityAsMissionEntity(ped6, 1, 1)
		SetEntityAsMissionEntity(ped7, 1, 1)
		
		SetPedNeverLeavesGroup(ped1, false)
		SetPedNeverLeavesGroup(ped2, false)
		SetPedNeverLeavesGroup(ped3, false)
		SetPedNeverLeavesGroup(ped4, false)
		SetPedNeverLeavesGroup(ped5, false)
		SetPedNeverLeavesGroup(ped6, false)
		SetPedNeverLeavesGroup(ped7, false)
		
		
		RemovePedFromGroup(ped1)
		RemovePedFromGroup(ped2)
		RemovePedFromGroup(ped3)
		RemovePedFromGroup(ped4)
		RemovePedFromGroup(ped5)
		RemovePedFromGroup(ped6)
		RemovePedFromGroup(ped7)
		
		RemoveGroup(GroupHandle)
		
		DeletePed(ped1)
		DeletePed(ped2)
		DeletePed(ped3)
		DeletePed(ped4)
		DeletePed(ped5)
		DeletePed(ped6)
		DeletePed(ped7)
		
		drawNotification("~r~All Bodyguards Deleted")
	end

	cb("ok")
end)

RegisterNUICallback("bogyguarddelete", function(data, cb) --Bodyguard Delete Options
	local bguard = tonumber(data.action)
	local GroupHandle = GetPlayerGroup(PlayerId())
	local ped = GetPedAsGroupMember(GroupHandle, bguard - 1)
	
	RemoveBlip(GetBlipFromEntity(ped))
	RemovePedFromGroup(ped)
	SetEntityCoords(ped, 0.0, 0.0, 0.0, false, false, false, true)
	FreezeEntityPosition(ped, true)
	SetEntityAsMissionEntity(ped, 1, 1)
	SetPedNeverLeavesGroup(ped, false)
	DeletePed(ped)
	drawNotification("~g~Bodyguard " .. bguard .. " Deleted!")

	cb("ok")
end)

Citizen.CreateThread(function() --Always Parachute
	while true do
		Citizen.Wait(0)

		if (autoparachute == true) then
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("gadget_parachute"), 1, false, false)
		end
	end
end)

Citizen.CreateThread(function() --Blackout
	while true do
		Citizen.Wait(0)

		if (blackout == true) then
			SetBlackout(true)
		else
			SetBlackout(false)
		end
	end
end)

Citizen.CreateThread(function() --PvP Enabled!
	while true do
		Citizen.Wait(0)
		if (GetEntityAlpha(GetPlayerPed(-1)) == 255) then
			SetCanAttackFriendly(GetPlayerPed(-1), true, false)
			NetworkSetFriendlyFireOption(true)
		else
			SetCanAttackFriendly(GetPlayerPed(-1), false, false)
			NetworkSetFriendlyFireOption(false)
		end
	end
end)

Citizen.CreateThread(function() --Weapon Drop
	while true do
		Citizen.Wait(0)

		local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
		local weapon = {
						"WEAPON_KNIFE",				"WEAPON_NIGHTSTICK",		"WEAPON_HAMMER",				"WEAPON_BAT",
						"WEAPON_GOLFCLUB",			"WEAPON_CROWBAR",			"WEAPON_PISTOL",				"WEAPON_COMBATPISTOL",
						"WEAPON_APPISTOL",			"WEAPON_PISTOL50",			"WEAPON_MICROSMG",				"WEAPON_SMG",
						"WEAPON_ASSAULTSMG",		"WEAPON_ASSAULTRIFLE",		"WEAPON_CARBINERIFLE",			"WEAPON_ADVANCEDRIFLE",
						"WEAPON_MG",				"WEAPON_COMBATMG",			"WEAPON_PUMPSHOTGUN",			"WEAPON_SAWNOFFSHOTGUN",
						"WEAPON_ASSAULTSHOTGUN",	"WEAPON_BULLPUPSHOTGUN",	"WEAPON_STUNGUN",				"WEAPON_SNIPERRIFLE",
						"WEAPON_HEAVYSNIPER",		"WEAPON_GRENADELAUNCHER",	"WEAPON_GRENADELAUNCHER_SMOKE",	"WEAPON_RPG",
						"WEAPON_MINIGUN",			"WEAPON_GRENADE",			"WEAPON_STICKYBOMB",			"WEAPON_SMOKEGRENADE",
						"WEAPON_BZGAS",				"WEAPON_MOLOTOV",			"WEAPON_PETROLCAN",				"WEAPON_FLARE",
						"WEAPON_SNSPISTOL",			"WEAPON_SPECIALCARBINE",	"WEAPON_HEAVYPISTOL",			"WEAPON_BULLPUPRIFLE",
						"WEAPON_HOMINGLAUNCHER",	"WEAPON_PROXMINE",			"WEAPON_SNOWBALL",				"WEAPON_VINTAGEPISTOL",
						"WEAPON_DAGGER",			"WEAPON_FIREWORK",			"WEAPON_MUSKET",				"WEAPON_MARKSMANRIFLE",
						"WEAPON_HEAVYSHOTGUN",		"WEAPON_GUSENBERG",			"WEAPON_HATCHET",				"WEAPON_RAILGUN",
						"WEAPON_COMBATPDW",			"WEAPON_KNUCKLE",			"WEAPON_FLASHLIGHT",			"WEAPON_MACHETE",
						"WEAPON_MACHINEPISTOL",		"WEAPON_AUTOSHOTGUN",		"WEAPON_BATTLEAXE",				"WEAPON_WRENCH",
						"WEAPON_POOLCUE",			"WEAPON_COMPACTLAUNCHER"
						}
		local pickup = {
						"PICKUP_WEAPON_KNIFE",			"PICKUP_WEAPON_NIGHTSTICK",			"PICKUP_WEAPON_HAMMER",						"PICKUP_WEAPON_BAT",
						"PICKUP_WEAPON_GOLFCLUB",		"PICKUP_WEAPON_CROWBAR",			"PICKUP_WEAPON_PISTOL",						"PICKUP_WEAPON_COMBATPISTOL",
						"PICKUP_WEAPON_APPISTOL",		"PICKUP_WEAPON_PISTOL50",			"PICKUP_WEAPON_MICROSMG",					"PICKUP_WEAPON_SMG",
						"PICKUP_WEAPON_ASSAULTSMG",		"PICKUP_WEAPON_ASSAULTRIFLE",		"PICKUP_WEAPON_CARBINERIFLE",				"PICKUP_WEAPON_ADVANCEDRIFLE",
						"PICKUP_WEAPON_MG",				"PICKUP_WEAPON_COMBATMG",			"PICKUP_WEAPON_PUMPSHOTGUN",				"PICKUP_WEAPON_SAWNOFFSHOTGUN",
						"PICKUP_WEAPON_ASSAULTSHOTGUN",	"PICKUP_WEAPON_BULLPUPSHOTGUN",		"PICKUP_WEAPON_STUNGUN",					"PICKUP_WEAPON_SNIPERRIFLE",
						"PICKUP_WEAPON_HEAVYSNIPER",	"PICKUP_WEAPON_GRENADELAUNCHER",	"PICKUP_WEAPON_GRENADELAUNCHER_SMOKE",		"PICKUP_WEAPON_RPG",
						"PICKUP_WEAPON_MINIGUN",		"PICKUP_WEAPON_GRENADE",			"PICKUP_WEAPON_STICKYBOMB",					"PICKUP_WEAPON_SMOKEGRENADE",
						"PICKUP_WEAPON_BZGAS",			"PICKUP_WEAPON_MOLOTOV",			"PICKUP_WEAPON_PETROLCAN",					"PICKUP_WEAPON_FLARE",
						"PICKUP_WEAPON_SNSPISTOL",		"PICKUP_WEAPON_SPECIALCARBINE",		"PICKUP_WEAPON_HEAVYPISTOL",				"PICKUP_WEAPON_BULLPUPRIFLE",
						"PICKUP_WEAPON_HOMINGLAUNCHER",	"PICKUP_WEAPON_PROXMINE",			"PICKUP_WEAPON_SNOWBALL",					"PICKUP_WEAPON_VINTAGEPISTOL",
						"PICKUP_WEAPON_DAGGER",			"PICKUP_WEAPON_FIREWORK",			"PICKUP_WEAPON_MUSKET",						"PICKUP_WEAPON_MARKSMANRIFLE",
						"PICKUP_WEAPON_HEAVYSHOTGUN",	"PICKUP_WEAPON_GUSENBERG",			"PICKUP_WEAPON_HATCHET",					"PICKUP_WEAPON_RAILGUN",
						"PICKUP_WEAPON_COMBATPDW",		"PICKUP_WEAPON_KNUCKLE",			"PICKUP_WEAPON_FLASHLIGHT",					"PICKUP_WEAPON_MACHETE",
						"PICKUP_WEAPON_MACHINEPISTOL",	"PICKUP_WEAPON_AUTOSHOTGUN",		"PICKUP_WEAPON_BATTLEAXE",					"PICKUP_WEAPON_WRENCH",
						"PICKUP_WEAPON_POOLCUE",		"PICKUP_WEAPON_COMPACTLAUNCHER"
						}

		if (dropweapon == true) then
			if (IsControlPressed(1, 68) and IsControlJustReleased(1, 56)) or (IsControlPressed(1, 56) and IsControlJustReleased(1, 57)) then
				for i = 1, 62 do
					if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(weapon[i])) then
						CreateAmbientPickup(GetHashKey(pickup[i]), playerPedPos.x + 2.0, playerPedPos.y + 2.0, playerPedPos.z + 0.5, 0, 999, currentweapon)
						RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey(weapon[i]))
					end
				end
				drawNotification("~g~Weapon dropped.")
			end
		end
	end
end)

Citizen.CreateThread(function() --Mobile Radio
	while true do
		Citizen.Wait(0)

		if GetPlayerPed(-1) then
			SetMobileRadioEnabledDuringGameplay(mobileradio)
		end
	end
end)

Citizen.CreateThread(function() --Count FPS (Thanks To siggyfawn [forum.FiveM.net])
	while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do
		Citizen.Wait(0)
		prevframes = GetFrameCount()
		prevtime = GetGameTimer()
	end

	while true do
		curtime = GetGameTimer()
		curframes = GetFrameCount()

	    if((curtime - prevtime) > 1000) then
			fps = (curframes - prevframes) - 1				
			prevtime = curtime
			prevframes = curframes
	    end
		Citizen.Wait(1)
	end
end)

Citizen.CreateThread(function() --Draw FPS
    while true do
        Citizen.Wait(0)
		if (dfps == true) then
			if IsGameplayCamRendering() then
				if fps == 0 then
					Draw("FPS Count Failed", 255, 0, 0, 0.95, 0.97, 0.35, 0.35, 1)
					_DrawRect(0.950, 0.984, 0.0938, 0.025, 0, 0, 0, 127, 0)
				elseif fps >= 1 and fps <= 30 then
					Draw("" .. fps .. "", 255, 0, 0, 0.99, 0.97, 0.35, 0.35, 1)
					_DrawRect(0.99, 0.984, 0.0175, 0.025, 0, 0, 0, 127, 0)
				elseif fps >=31 and fps <= 50 then
					Draw("" .. fps .. "", 255, 255, 0, 0.99, 0.97, 0.35, 0.35, 1)
					_DrawRect(0.99, 0.984, 0.0175, 0.025, 0, 0, 0, 127, 0)
				elseif fps >= 51 then
					Draw("" .. fps .. "", 0, 255, 0, 0.99, 0.97, 0.35, 0.35, 1)
					_DrawRect(0.99, 0.984, 0.0175, 0.025, 0, 0, 0, 127, 0)
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Draw Speedometer
    while true do
        Citizen.Wait(0)
		if (dspeedo == true) then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				local cleanspeed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
				if kmh == true then
					Draw("" .. math.ceil(cleanspeed * 3.6) .. " KMH", 255, 255, 255, 0.205, 0.95, 0.4, 0.4, 1)
					_DrawRect(0.205, 0.964, 0.07, 0.04, 0, 0, 0, 127, 0)
				elseif mph == true then
					Draw("" .. math.ceil(cleanspeed * 2.236936) .. " MPH", 255, 255, 255, 0.205, 0.95, 0.4, 0.4, 1)
					_DrawRect(0.205, 0.964, 0.07, 0.04, 0, 0, 0, 127, 0)
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --No NPCs & Traffic
	while true do
		Citizen.Wait(0)
		if (nonpcs == true) then
			local playerPedPos = GetEntityCoords(GetPlayerPed(-1)) 
			SetPedDensityMultiplierThisFrame(0.0)
			SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
			SetVehicleDensityMultiplierThisFrame(0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
			Citizen.InvokeNative(0x90B6DA738A9A25DA, 0.0)
			RemoveVehiclesFromGeneratorsInArea(playerPedPos.x - 500.0, playerPedPos.y - 500.0, playerPedPos.z - 500.0, playerPedPos.x + 500.0, playerPedPos.y + 500.0, playerPedPos.z + 500.0)
			SetGarbageTrucks(0)
			SetRandomBoats(0)
		end
	end
end)

Citizen.CreateThread(function() --Explode Nearest Vehicle
	while true do
		Citizen.Wait(0)
		if (explodevehicles == true) then
			local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
			local NearestVehicle = GetClosestVehicle(playerPedPos, 250.0, 0, 4)
			NetworkExplodeVehicle(NearestVehicle, true, true, false)
		end
	end
end)

Citizen.CreateThread(function() --No Clip Mode (Miscellaneous)
	while true do
		Citizen.Wait(0)

		if (noclipmode == true) then
			SetPedCanRagdoll(GetPlayerPed(-1), false)
			Citizen.InvokeNative(0x26695EC767728D84, GetPlayerPed(-1), 2)
			Citizen.InvokeNative(0x26695EC767728D84, GetPlayerPed(-1), 3)
			SetEntityCollision(GetPlayerPed(-1), false, false)
			ClearPedTasksImmediately(GetPlayerPed(-1))
			if not IsControlPressed(1, 32) and not IsControlPressed(1, 33) and not IsControlPressed(1, 71) and not IsControlPressed(1, 72) then
				FreezeEntityPosition(GetPlayerPed(-1), true)
			end
		end
	end
end)

Citizen.CreateThread(function() --No Clip Mode (Forward/ Backward)
	while true do
		Citizen.Wait(0)

		if (noclipmode == true) then
			local coords = Citizen.InvokeNative(0x0A794A5A57F8DF91, PlayerPedId(), Citizen.ResultAsVector())
			if IsControlPressed(1, 32) then --Forward
				FreezeEntityPosition(GetPlayerPed(-1), false)
				ApplyForceToEntity(GetPlayerPed(-1), 1, coords.x * 3, coords.y * 3, 0.27, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			elseif IsControlPressed(1, 33) then --Backward
				FreezeEntityPosition(GetPlayerPed(-1), false)
				ApplyForceToEntity(GetPlayerPed(-1), 1, coords.x * -3, coords.y * -3, 0.27, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			end
		end
	end
end)

Citizen.CreateThread(function() --No Clip Mode (Up/ Down)
	while true do
		Citizen.Wait(0)

		if (noclipmode == true) then
			if IsControlPressed(1, 71) then --Up
				FreezeEntityPosition(GetPlayerPed(-1), false)
				ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, 5.0, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			elseif IsControlPressed(1, 72) then --Down
				FreezeEntityPosition(GetPlayerPed(-1), false)
				ApplyForceToEntity(GetPlayerPed(-1), 1, 0.0, 0.0, -5.0, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			end
		end
	end
end)

Citizen.CreateThread(function() --No Clip Mode (Rotation)
	while true do
		Citizen.Wait(0)
		local camRot = GetGameplayCamRot(0)
		if (noclipmode == true) then
			SetEntityRotation(GetPlayerPed(-1), 0.0, 0.0, camRot.z, 1, true)
		end
	end
end)

Citizen.CreateThread(function() --Vehicle Indicators
	while true do
		Citizen.Wait(0)
		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		if IsControlPressed(1, 21) and IsControlJustReleased(1, 174) then --Left (A + DPAD Left) or (Shift + Arrow Keys - LEFT)
			SetVehicleIndicatorLights(playerVeh, 1, true)
			SetVehicleIndicatorLights(playerVeh, 0, false)
		elseif IsControlPressed(1, 21) and IsControlJustReleased(1, 175) then --Right (A + DPAD Right) or (Shift + Arrow Keys - RIGHT)
			SetVehicleIndicatorLights(playerVeh, 0, true)
			SetVehicleIndicatorLights(playerVeh, 1, false)
		elseif IsControlPressed(1, 21) and IsControlJustReleased(1, 173) then --Off (A + DPAD Down) or (Shift + Arrow Keys - DOWN)
			SetVehicleIndicatorLights(playerVeh, 0, false)
			SetVehicleIndicatorLights(playerVeh, 1, false)
		elseif IsControlPressed(1, 21) and IsControlJustReleased(1, 172) then --Both (A + DPAD UP) or (Shift + Arrow Keys - UP)
			SetVehicleIndicatorLights(playerVeh, 0, true)
			SetVehicleIndicatorLights(playerVeh, 1, true)
		end
	end
end)

Citizen.CreateThread(function() --Cinematic Cam Disabled
	while true do
		Citizen.Wait(0)
		SetCinematicButtonActive(false)
	end
end)

Citizen.CreateThread(function() --Freeze Radio Station
	while true do
		Citizen.Wait(0)
		if (freezeradio == true) then
			if (GetPlayerRadioStationName() ~= radioname) then
				SetRadioToStationName(radioname)
				SetVehRadioStation(GetVehiclePedIsIn(GetPlayerPed(-1), false), radioname)
			end
		end
	end
end)

Citizen.CreateThread(function() --Bodyguard Teleport
	while true do
		Citizen.Wait(0)
		local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
		local GroupHandle = GetPlayerGroup(PlayerId())
		for i = 0, 6 do
			local ped = GetPedAsGroupMember(GroupHandle, i)
			local PedPos = GetEntityCoords(ped, true)
			if (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, PedPos.x, PedPos.y, PedPos.z) >= 50) then
				SetEntityCoords(ped, playerPedPos.x, playerPedPos.y, playerPedPos.z, false, false, false, true)
				SetEntityVisible(ped, true, 0)
			end
		end
	end
end)

Citizen.CreateThread(function() --Vibrator
	while true do
		Citizen.Wait(1)

		if (vibrator == true) then
			SetPadShake(0, 999999999, 255)
		elseif (vibrator == false) then
			StopPadShake(0)
		end
	end
end)

Citizen.CreateThread(function() --Area - Cleaning Every 5 Minutes(Coords: 0.0, 0.0, 0.0)
	while true do
		Citizen.Wait(300000)
		ClearArea(0.0, 0.0, 0.0, 5.0, true, false, false, false)
		Citizen.InvokeNative(0x957838AAF91BD12D, 0.0, 0.0, 0.0, 5.0, false, false, false, false)
		ClearAreaOfCops(0.0, 0.0, 0.0, 5.0, 0)
		ClearAreaOfObjects(0.0, 0.0, 0.0, 5.0, 0)
		ClearAreaOfPeds(0.0, 0.0, 0.0, 5.0, 1)
		ClearAreaOfProjectiles(0.0, 0.0, 0.0, 5.0, 0)
		ClearAreaOfVehicles(0.0, 0.0, 0.0, 5.0, false, false, false, false, false)
	end
end)

function Draw(text, r, g, b, x, y, width, height, layer) --Funtion To Draw Strings
	SetTextColour(r, g, b, 127)
	SetTextFont(0)
	SetTextScale(width, height)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(true)
	SetTextDropshadow(0, 0, 0, 0, 0)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	Citizen.InvokeNative(0x61BB1D9B3A95D802, layer)
	DrawText(x, y)
end

function _DrawRect(x, y, width, height, r, g, b, a, layer) --Function To Draw A Rect
	Citizen.InvokeNative(0x61BB1D9B3A95D802, layer)
	DrawRect(x, y, width, height, r, g, b, a)
end

function FirstToUpper(str) --Function To Turn First Letter in String To Upper
    return (str:gsub("^%l", string.upper))
end