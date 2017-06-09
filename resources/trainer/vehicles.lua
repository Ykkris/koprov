local despawnable, autodelete, mapblip, vehgodmode,
	  vehvisibiledamage, flyingcar, reducevehgrip,
	  setvisible, setgravity, rainbowcar, boostcar,
	  seatbelt, fancy, showextras, vehiclecol,
	  extracol, neoncolor, frontleft, frontright,
	  rearleft, rearright, hood, trunk, needforspeed, 
	  neonleft, neonright, neonfront, neonback, rainbowneons, 
	  bunnyhop
	  
local R = 0
local G = 0
local B = 0

local function _SetEntityAsNoLongerNeeded(entity) --Native Invoking
	Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(entity))
end

function SpawnVehicle(model, x, y, z) --Vehicle Spawning
	local playerPed = GetPlayerPed(-1)
	local playerHeading = GetEntityHeading(playerPed)
	local playerVeh = GetVehiclePedIsIn(playerPed, true)
	local playerPedPos = GetEntityCoords(playerPed, true)

	if IsModelValid(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(1)
			blockinput = true
		end
		if autodelete then
			if IsPedInAnyVehicle(playerPed, true) then
				local lastVeh = GetPlayersLastVehicle()
				ClearPedTasksImmediately(playerPed)
				SetEntityVisible(lastVeh, false, 0)
				SetEntityCoords(lastVeh, 0.0, 0.0, 0.0, false, false, false, true)
				SetEntityAsMissionEntity(lastVeh, 1, 1)
				DeleteVehicle(lastVeh)
				ClearAreaOfVehicles(playerPedPos.x, playerPedPos.y, playerPedPos.z, 50.0, false, false, false, false, false)
				drawNotification("~g~Old Vehicle Deleted!")
			end
		end
		local veh = CreateVehicle(model, x, y, z + 1, playerHeading, true, true)
		SetPedIntoVehicle(playerPed, veh, -1)
		if mapblip then
			local vehblip = AddBlipForEntity(veh)
			if IsPedInAnySub(playerPed) then  --Submersible Blips (Submersible & Kraken)
				SetBlipSprite(vehblip, 308)
			elseif IsPedInAnyTaxi(playerPed) then  --Taxi Blip
				SetBlipSprite(vehblip, 56)
				SetBlipColour(vehblip, 5)
			elseif (GetVehicleClass(veh) == 8) or (GetVehicleClass(veh) == 13) then --Motorcycle & Bike Blips
				if (model == GetHashKey("POLICEB")) then --Police Bike Blip
					SetBlipSprite(vehblip, 226)
					SetBlipColour(vehblip, 63)
				else
					SetBlipSprite(vehblip, 226) --Motorcycle Blips
				end
			elseif (GetVehicleClass(veh) == 10) or (GetVehicleClass(veh) == 11) or (GetVehicleClass(veh) == 17) or (GetVehicleClass(veh) == 20) then  --Industrial, Utility, Service & Commercial Blips
				if (model == GetHashKey("TRASH")) or (model == GetHashKey("TRASH2")) then --Trash Blips
					SetBlipSprite(vehblip, 318)
				elseif (model == GetHashKey("SADLER")) or (model == GetHashKey("SADLER2")) or (model == GetHashKey("GUARDIAN")) then --Sadler & Guardian Blips
					SetBlipSprite(vehblip, 227)
				else
					SetBlipSprite(vehblip, 67) --Industrial, Utility, Service & Commercial Blips
				end
			elseif (GetVehicleClass(veh) == 14) then --Boat Blips
				if (model == GetHashKey("MARQUIS")) then --Marquis Blip
					SetBlipSprite(vehblip, 410)
				else
					SetBlipSprite(vehblip, 427) --Boat Blips
				end
			elseif (GetVehicleClass(veh) == 16) then --Plane Blips
				if (model == GetHashKey("BESRA")) or (model == GetHashKey("HYDRA")) or (model == GetHashKey("LAZER")) then --Jet Blips
					SetBlipSprite(vehblip, 424)
				elseif (model == GetHashKey("BLIMP")) or (model == GetHashKey("BLIMP2")) then --Blimp Blips
					SetBlipSprite(vehblip, 401)
				elseif (model == GetHashKey("CUBAN800")) or (model == GetHashKey("DODO"))or (model == GetHashKey("DUSTER"))or (model == GetHashKey("STUNT"))or (model == GetHashKey("MAMMATUS"))or (model == GetHashKey("VELUM"))or (model == GetHashKey("VELUM2"))or (model == GetHashKey("VESTRA")) then --Small Plane Blip
					SetBlipSprite(vehblip, 251)
				else
					SetBlipSprite(vehblip, 423) --Large Plane Blips
				end
			elseif (GetVehicleClass(veh) == 18) then --Emergency Blips
				if (model == GetHashKey("LGUARD")) or (model == GetHashKey("PRANGER")) then --Lifeguard & Park Ranger - Normal Blip
					SetBlipSprite(vehblip, 227)
				else
					SetBlipSprite(vehblip, 198) --Emergency Blips
					if (model == GetHashKey("PBUS")) then
						SetBlipColour(vehblip, 63)
					end
				end
			else --Everything Else - Normal Blip
				if (GetVehicleClass(playerVeh) ~= 15) then
					if (model == GetHashKey("RHINO")) then --Rhino Blip
						SetBlipSprite(vehblip, 421)
					elseif (model == GetHashKey("DUNE")) or (model == GetHashKey("DUNE2")) or (model == GetHashKey("DUNE4")) or (model == GetHashKey("DUNE5")) then --Dune Blip (Dune, Spacedocker 6 Ramp Buggys)
						SetBlipSprite(vehblip, 147)
					elseif (model == GetHashKey("BOXVILLE")) or (model == GetHashKey("BOXVILLE2")) or (model == GetHashKey("BOXVILLE3")) or (model == GetHashKey("BOXVILLE4")) or (model == GetHashKey("CAMPER")) or (model == GetHashKey("JOURNEY")) or (model == GetHashKey("TACO")) then --Boxville, Camper, Journey & Taco Van Blips
						SetBlipSprite(vehblip, 67)
					elseif (model == GetHashKey("INSURGENT")) or (model == GetHashKey("TECHNICAL")) or (model == GetHashKey("LIMO2")) then --Insurgent Pickup, Technical & Turreted Limo Blips
						SetBlipSprite(vehblip, 426)
					else
						SetBlipSprite(vehblip, 227) --Everything Else - Normal Blip
					end
				end
			end
		end
		if despawnable then
			_SetEntityAsNoLongerNeeded(veh)
			if (despawnable == true) then
				drawNotification("~g~Vehicle Despawn Enabled!")
			else
				drawNotification("~r~Vehicle Despawn Disabled!")
			end
		end
		blockinput = false
		drawNotification("~g~Vehicle spawned!")
	else
		drawNotification("~r~Invalid Model!")
	end
end

RegisterNUICallback("veh", function(data, cb) --Vehicle Options
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local action = data.action
	local newstate = data.newstate

	if action == "fixclean" then --Fixing And Cleaning
		if IsPedInAnyVehicle(playerPed, true) then
			SetVehicleFixed(playerVeh)
			SetVehicleDirtLevel(playerVeh, 0.0)
			SetVehicleLights(playerVeh, 0)
			Citizen.InvokeNative(0x1FD09E7390A74D54, playerVeh, 0)
			drawNotification("~g~Vehicle repaired & cleaned!")
		else
			drawNotification("~r~Not in a vehicle!")
		end
	elseif action == "upgrade" then --Maximum Upgrade
		if IsPedInAnyVehicle(playerPed, true) then
			ClearVehicleCustomPrimaryColour(playerVeh)
			ClearVehicleCustomSecondaryColour(playerVeh)
			SetVehicleModKit(playerVeh, 0)
			SetVehicleWheelType(playerVeh, 7)
			SetVehicleMod(playerVeh, 0, GetNumVehicleMods(playerVeh, 0) - 1, true)
			SetVehicleMod(playerVeh, 1, GetNumVehicleMods(playerVeh, 1) - 1, true)
			SetVehicleMod(playerVeh, 2, GetNumVehicleMods(playerVeh, 2) - 1, true)
			SetVehicleMod(playerVeh, 3, GetNumVehicleMods(playerVeh, 3) - 1, true)
			SetVehicleMod(playerVeh, 4, GetNumVehicleMods(playerVeh, 4) - 1, true)
			SetVehicleMod(playerVeh, 5, GetNumVehicleMods(playerVeh, 5) - 1, true)
			SetVehicleMod(playerVeh, 6, GetNumVehicleMods(playerVeh, 6) - 1, true)
			SetVehicleMod(playerVeh, 7, GetNumVehicleMods(playerVeh, 7) - 1, true)
			SetVehicleMod(playerVeh, 8, GetNumVehicleMods(playerVeh, 8) - 1, true)
			SetVehicleMod(playerVeh, 9, GetNumVehicleMods(playerVeh, 9) - 1, true)
			SetVehicleMod(playerVeh, 10, GetNumVehicleMods(playerVeh, 10) - 1, true)
			SetVehicleMod(playerVeh, 11, GetNumVehicleMods(playerVeh, 11) - 1, true)
			SetVehicleMod(playerVeh, 12, GetNumVehicleMods(playerVeh, 12) - 1, true)
			SetVehicleMod(playerVeh, 13, GetNumVehicleMods(playerVeh, 13) - 1, true)
			SetVehicleMod(playerVeh, 14, 51, false)
			SetVehicleMod(playerVeh, 15, GetNumVehicleMods(playerVeh, 15) - 1, true)
			SetVehicleMod(playerVeh, 16, GetNumVehicleMods(playerVeh, 16) - 1, true)
			ToggleVehicleMod(playerVeh, 17, true)
			ToggleVehicleMod(playerVeh, 18, true)
			ToggleVehicleMod(playerVeh, 19, true)
			ToggleVehicleMod(playerVeh, 20, true)
			ToggleVehicleMod(playerVeh, 21, true)
			ToggleVehicleMod(playerVeh, 22, true)
			SetVehicleMod(playerVeh, 23, 1, true)
			SetVehicleMod(playerVeh, 24, 1, true)
			SetVehicleMod(playerVeh, 25, GetNumVehicleMods(playerVeh, 25) - 1, true)
			SetVehicleMod(playerVeh, 27, GetNumVehicleMods(playerVeh, 27) - 1, true)
			SetVehicleMod(playerVeh, 28, GetNumVehicleMods(playerVeh, 28) - 1, true)
			SetVehicleMod(playerVeh, 30, GetNumVehicleMods(playerVeh, 30) - 1, true)
			SetVehicleMod(playerVeh, 33, GetNumVehicleMods(playerVeh, 33) - 1, true)
			SetVehicleMod(playerVeh, 34, GetNumVehicleMods(playerVeh, 34) - 1, true)
			SetVehicleMod(playerVeh, 35, GetNumVehicleMods(playerVeh, 35) - 1, true)
			SetVehicleMod(playerVeh, 38, GetNumVehicleMods(playerVeh, 38) - 1, true)
			SetVehicleTyreSmokeColor(playerVeh, 0, 0, 0)
			SetVehicleWindowTint(playerVeh, 1)
			SetVehicleTyresCanBurst(playerVeh, false)
			SetVehicleNumberPlateText(playerVeh, 'F-MOD')
			SetVehicleNumberPlateTextIndex(playerVeh, 5)
			SetVehicleModColor_1(playerVeh, 4, 12, 0)
			SetVehicleModColor_2(playerVeh, 4, 131)
			SetVehicleColours(playerVeh, 12, 131)
			SetVehicleExtraColours(playerVeh, 92, 92)
			drawNotification("~g~Vehicle Upgraded!")
		else
			drawNotification("~r~Not in a vehicle!")
		end
	elseif action == "downgrade" then --Downgrade
		if IsPedInAnyVehicle(playerPed, true) then
			SetVehicleModKit(playerVeh, 0)
			SetVehicleWheelType(playerVeh, 4)
			SetVehicleMod(playerVeh, 0, -1, 0)
			SetVehicleMod(playerVeh, 1, -1, 0)
			SetVehicleMod(playerVeh, 2, -1, 0)
			SetVehicleMod(playerVeh, 3, -1, 0)
			SetVehicleMod(playerVeh, 4, -1, 0)
			SetVehicleMod(playerVeh, 5, -1, 0)
			SetVehicleMod(playerVeh, 6, -1, 0)
			SetVehicleMod(playerVeh, 7, -1, 0)
			SetVehicleMod(playerVeh, 8, -1, 0)
			SetVehicleMod(playerVeh, 9, -1, 0)
			SetVehicleMod(playerVeh, 10, -1, 0)
			SetVehicleMod(playerVeh, 11, -1, 0)
			SetVehicleMod(playerVeh, 12, -1, 0)
			SetVehicleMod(playerVeh, 13, -1, 0)
			SetVehicleMod(playerVeh, 14, -1, 0)
			SetVehicleMod(playerVeh, 15, -1, 0)
			SetVehicleMod(playerVeh, 16, -1, 0)
			ToggleVehicleMod(playerVeh, 17, false)
			ToggleVehicleMod(playerVeh, 18, false)
			ToggleVehicleMod(playerVeh, 19, false)
			ToggleVehicleMod(playerVeh, 20, false)
			ToggleVehicleMod(playerVeh, 21, false)
			ToggleVehicleMod(playerVeh, 22, false)
			SetVehicleMod(playerVeh, 23, 9, true)
			SetVehicleMod(playerVeh, 24, 9, true)
			SetVehicleMod(playerVeh, 25, -1, true)
			SetVehicleMod(playerVeh, 27, -1, true)
			SetVehicleMod(playerVeh, 28, -1, true)
			SetVehicleMod(playerVeh, 30, -1, true)
			SetVehicleMod(playerVeh, 33, -1, true)
			SetVehicleMod(playerVeh, 34, -1, true)
			SetVehicleMod(playerVeh, 35, -1, true)
			SetVehicleMod(playerVeh, 38, -1, true)
			SetVehicleTyreSmokeColor(playerVeh, 0, 0, 0)
			SetVehicleWindowTint(playerVeh, -1)
			SetVehicleTyresCanBurst(playerVeh, true)
			SetVehicleNumberPlateText(playerVeh, "F-MOD")
			SetVehicleNumberPlateTextIndex(playerVeh, 5)
			SetVehicleModColor_1(playerVeh, 5, 1, 0)
			SetVehicleModColor_2(playerVeh, 5, 1)
			SetVehicleCustomPrimaryColour(playerVeh, 255, 51, 255)
			SetVehicleCustomSecondaryColour(playerVeh, 255, 51, 255)
			drawNotification("~g~Vehicle Downgraded!")
		else
			drawNotification("~r~Not in a vehicle!")
		end	
	elseif action == "flipvehicle" then --Flip
		if IsPedInAnyVehicle(playerPed, true) then
			SetVehicleOnGroundProperly(playerVeh)
			drawNotification("~g~Vehicle Flipped!")
		else
			drawNotification("~r~Not in a vehicle!")
		end
	elseif action == "fuckup" then --Fuck Up Current Vehicle
		if IsPedInAnyVehicle(playerPed, true) then
			StartVehicleAlarm(playerVeh)
			DetachVehicleWindscreen(playerVeh)
			SmashVehicleWindow(playerVeh, 0)
			SmashVehicleWindow(playerVeh, 1)
			SmashVehicleWindow(playerVeh, 2)
			SmashVehicleWindow(playerVeh, 3)
			SetVehicleTyreBurst(playerVeh, 0, true, 1000.0)
			SetVehicleTyreBurst(playerVeh, 1, true, 1000.0)
			SetVehicleTyreBurst(playerVeh, 2, true, 1000.0)
			SetVehicleTyreBurst(playerVeh, 3, true, 1000.0)
			SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
			SetVehicleTyreBurst(playerVeh, 5, true, 1000.0)
			SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
			SetVehicleTyreBurst(playerVeh, 7, true, 1000.0)
			SetVehicleDoorBroken(playerVeh, 0, true)
			SetVehicleDoorBroken(playerVeh, 1, true)
			SetVehicleDoorBroken(playerVeh, 2, true)
			SetVehicleDoorBroken(playerVeh, 3, true)
			SetVehicleDoorBroken(playerVeh, 4, true)
			SetVehicleDoorBroken(playerVeh, 5, true)
			SetVehicleDoorBroken(playerVeh, 6, true)
			SetVehicleDoorBroken(playerVeh, 7, true)
			SetVehicleLights(playerVeh, 1)
			Citizen.InvokeNative(0x1FD09E7390A74D54, playerVeh, 1)
			SetVehicleNumberPlateTextIndex(playerVeh, 5)
			SetVehicleNumberPlateText(playerVeh, "ANALSWAG")
			SetVehicleDirtLevel(playerVeh, 10.0)
			SetVehicleModColor_1(playerVeh, 1)
			SetVehicleModColor_2(playerVeh, 1)
			SetVehicleCustomPrimaryColour(playerVeh, 255, 51, 255)
			SetVehicleCustomSecondaryColour(playerVeh, 255, 51, 255)
			drawNotification("~g~Vehicle Fucked Up!")
		else
			drawNotification("~r~Not in a vehicle!")
		end
	elseif action == "delete" then --Delete
		if (fancy == true) then
			ClearPedTasksImmediately(playerPed)
			SetEntityVisible(playerVeh, false, 0)
			SetEntityCoords(playerVeh, 999999.0, 999999.0, 999999.0, false, false, false, true)
			FreezeEntityPosition(playerVeh, true)
			SetEntityAsMissionEntity(playerVeh, 1, 1)
			DeleteVehicle(playerVeh)
			fancy = false
		else
			SetEntityAsMissionEntity(playerVeh, 1, 1)
			DeleteVehicle(playerVeh)
		end
		drawNotification("~g~Vehicle Deleted!")
	elseif action == "vehiclegodmode" then --Godmode
		vehgodmode = newstate
		SetVehicleFixed(playerVeh)
		SetVehicleDirtLevel(playerVeh, 0.0)
		SetVehicleEngineHealth(playerVeh, 1000.0)
		if (vehgodmode == true) then
			drawNotification("~g~Vehicle Godmode Enabled!")
		else
			drawNotification("~r~Vehicle Godmode Disabled!")
		end
	elseif action == "fly" then --Flying Car
		flyingcar = newstate
		if (flyingcar == true) then
			drawNotification("~g~Flying Car Enabled!")
		else
			drawNotification("~r~Flying Car Disabled!")
		end
	elseif action == "reducevehiclegrip" then --Reducing Grip
		reducevehgrip = newstate
		if (reducevehgrip == true) then
			drawNotification("~g~Vehicle Grip Disabled!")
		else
			drawNotification("~r~Vehicle Grip Enabled!")
		end
	elseif action == "visible" then --Visibility
		setvisible = newstate
		if (setvisible == true) then
			drawNotification("~g~Vehicle Visible!")
		else
			drawNotification("~r~Vehicle Invisible!")
		end
	elseif action == "gravity" then --Gravity
		setgravity = newstate
		if (setgravity == true) then
			drawNotification("~g~Vehicle Gravity Enabled!")
		else
			drawNotification("~r~Vehicle Gravity Disabled!")
		end
	elseif action == "rainbowc" then --Rainbow Car
		rainbowcar = newstate
		if (rainbowcar == true) then
			drawNotification("~g~Rainbow Car Enabled!")
		else
			drawNotification("~r~Rainbow Car Disabled!")
		end
	elseif action == "rainbown" then --Rainbow Neons
		rainbowneons= newstate
		if (rainbowneons == true) then
			drawNotification("~g~Rainbow Neons Enabled!")
		else
			drawNotification("~r~Rainbow Neons Disabled!")
		end
	elseif action == "hornboost" then  --Boost On Horn
		boostcar = newstate
		if (boostcar == true) then
			drawNotification("~g~Boost Car Enabled!")
		else
			drawNotification("~r~Boost Car Disabled!")
		end
	elseif action == "sb" then --Bike Seatbelt
		seatbelt = newstate
		if (seatbelt == true) then
			drawNotification("~g~Seatbelt Enabled!")
		else
			drawNotification("~r~Seatbelt Disabled!")
		end
	elseif action == "bunny" then --Bike Seatbelt
		bunnyhop = newstate
		if (bunnyhop == true) then
			drawNotification("~g~Bunny Hop Enabled!~n~ Jump With X/ Spacebar")
		else
			drawNotification("~r~Bunny Hop Disabled!")
		end
	end

	cb("ok")
end)

RegisterNUICallback("fancy", function(data, cb) --Fancy Vehicle Spawning
	local playerPed = GetPlayerPed(-1)
	local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
	local action = data.action

	if action == "fzufo" then
		local coords = GetEntityCoords(playerPed, true)
		SetEntityCoords(playerPed, -2051.9, 3237.0, 1456.9)
		RequestModel(GetHashKey("dt1_tc_dufo_core"))
		while not HasModelLoaded(GetHashKey("dt1_tc_dufo_core")) do
			Citizen.Wait(1)
		end
		SetEntityCoords(playerPed, coords)
		local Object = CreateObject(GetHashKey("dt1_tc_dufo_core"), -2051.9, 3237.0, 1456.9, 0, 0, 1)
		RequestModel(GetHashKey("SKYLIFT"))
		while not HasModelLoaded(GetHashKey("SKYLIFT")) do
			Citizen.Wait(1)
		end
		local veh = CreateVehicle(GetHashKey("SKYLIFT"), x, y, z + 1, GetEntityHeading(playerPed), true, true)
		SetPedIntoVehicle(playerPed, veh, -1)
		_SetEntityAsNoLongerNeeded(veh)
		AttachEntityToEntity(Object, veh, 0, 0.0, -4.0, 4.0, 0.0, 0.0, 0.0, true, true, true, false, 1, true)
		fancy = true
	elseif action == "acufo" then
		local coords = GetEntityCoords(playerPed, true)
		SetEntityCoords(playerPed, 2490.4, 3774.8, 2414.0)
		RequestModel(GetHashKey("dt1_tc_ufocore"))
		while not HasModelLoaded(GetHashKey("dt1_tc_ufocore")) do
			Citizen.Wait(1)
		end
		SetEntityCoords(playerPed, coords)
		local Object = CreateObject(GetHashKey("dt1_tc_ufocore"), 2490.4, 3774.8, 2414.0, 0, 0, 1)
		RequestModel(GetHashKey("SKYLIFT"))
		while not HasModelLoaded(GetHashKey("SKYLIFT")) do
			Citizen.Wait(1)
		end
		local veh = CreateVehicle(GetHashKey("SKYLIFT"), x, y, z + 1, GetEntityHeading(playerPed), true, true)
		SetPedIntoVehicle(playerPed, veh, -1)
		_SetEntityAsNoLongerNeeded(veh)
		AttachEntityToEntity(Object, veh, 0, 0.0, -4.0, 4.0, 0.0, 0.0, 0.0, true, true, true, false, 1, true)
		fancy = true
	elseif action == "monsurgent" then
		RequestModel(GetHashKey("INSURGENT2"))
		while not HasModelLoaded(GetHashKey("INSURGENT2")) do
			Citizen.Wait(1)
		end
		local vehProp = CreateVehicle(GetHashKey("INSURGENT2"), x, y, z + 1, GetEntityHeading(playerPed), true, true)
		DetachVehicleWindscreen(vehProp)
		SpawnVehicle(GetHashKey("MONSTER"), x, y, z)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		AttachEntityToEntity(vehProp, playerVeh, 0, 0.0, 0.05, 0.4, 0.0, 0.0, 0.0, true, true, true, false, 1, true)
		SetVehicleOnGroundProperly(vehProp)
		SetEntityInvincible(vehProp, true)
		SetVehicleExplodesOnHighExplosionDamage(vehProp, false)
		fancy = true
	elseif action == "monsterbus" then
		RequestModel(GetHashKey("bus"))
		while not HasModelLoaded(GetHashKey("bus")) do
			Citizen.Wait(1)
		end
		local vehProp = CreateVehicle(GetHashKey("bus"), x, y, z + 1, GetEntityHeading(playerPed), true, true)
		DetachVehicleWindscreen(vehProp)
		SpawnVehicle(GetHashKey("MARSHALL"), x, y, z)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		AttachEntityToEntity(vehProp, playerVeh, 0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, true, true, true, false, 1, true)
		SetVehicleOnGroundProperly(vehProp)
		SetEntityInvincible(vehProp, true)
		SetVehicleExplodesOnHighExplosionDamage(vehProp, false)
		fancy = true
	end

	cb("ok")
end)

RegisterNUICallback("vehspawn", function(data, cb) --Vehicle Spawning
	local playerPed = GetPlayerPed(-1)
	local x, y, z = table.unpack(GetEntityCoords(playerPed, true))

	if data.action == "despawn" then
		despawnable = data.newstate
		return
	elseif data.action == "delete" then
		autodelete = data.newstate
		return
	elseif data.action == "mark" then
		mapblip = data.newstate
		return
	elseif data.action == "input" then
		DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 25)
		blockinput = true

		while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
			Citizen.Wait(1)
		end

		local result = GetOnscreenKeyboardResult()
		if result then
			SpawnVehicle(GetHashKey(string.upper(result)), x, y, z)
		end

		blockinput = false
		return
	end

	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local vehhash = GetHashKey(data.action)

	SpawnVehicle(vehhash, x, y, z)

	cb("ok")
end)

RegisterNUICallback("primetalchrome", function(data, cb) --Vehicle Color (Primary Metals & Chrome)
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local colorindex = tonumber(data.action)
	local modColor

	if colorindex == 120 or data.action == "custom" then
		modColor = 5
	else
		modColor = 4
	end
	
	if IsPedInAnyVehicle(playerPed, true) then
		SetVehicleModColor_1(playerVeh, modColor)
		if data.action == "custom" then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "" .. R .. "," .. G .. "," .. B .. "", "", "", "", 25)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(1)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				local result = GetOnscreenKeyboardResult()
				local color = stringsplit(result, ",")
				R = tonumber(color[1])
				G = tonumber(color[2])
				B = tonumber(color[3])
				Citizen.Wait(500)
				blockinput = false
				SetVehicleCustomPrimaryColour(playerVeh, R, G, B)
				SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
			else
				Citizen.Wait(500)
				blockinput = false
			end
		else
			ClearVehicleCustomPrimaryColour(playerVeh)
			SetVehicleColours(playerVeh, colorindex, vehiclecol[2])
			SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
		end
		drawNotification("~g~Repainted Primary Color")
	else
		drawNotification("~r~Not in a vehicle!")
	end
	cb("ok")
end)

RegisterNUICallback("primatte", function(data, cb) --Vehicle Color (Primary Matte)
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local colorindex = tonumber(data.action)

	if IsPedInAnyVehicle(playerPed, true) then
		SetVehicleModColor_1(playerVeh, 3)
		ClearVehicleCustomPrimaryColour(playerVeh)
		if data.action == "custom" then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "" .. R .. "," .. G .. "," .. B .. "", "", "", "", 25)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(1)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				local result = GetOnscreenKeyboardResult()
				local color = stringsplit(result, ",")
				R = tonumber(color[1])
				G = tonumber(color[2])
				B = tonumber(color[3])
				Citizen.Wait(500)
				blockinput = false
				SetVehicleCustomPrimaryColour(playerVeh, R, G, B)
				SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
			else
				Citizen.Wait(500)
				blockinput = false
			end
		else
			SetVehicleColours(playerVeh, colorindex, vehiclecol[2])
			SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
		end
		drawNotification("~g~Repainted Primary Color")
	else
		drawNotification("~r~Not in a vehicle!")
	end
	cb("ok")
end)

RegisterNUICallback("primetallic", function(data, cb) --Vehicle Color (Primary Metallic)
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local colorindex = tonumber(data.action)

	if IsPedInAnyVehicle(playerPed, true) then
		SetVehicleModColor_1(playerVeh, 1)
		ClearVehicleCustomPrimaryColour(playerVeh)
		if data.action == "custom" then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "" .. R .. "," .. G .. "," .. B .. "", "", "", "", 25)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(1)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				local result = GetOnscreenKeyboardResult()
				local color = stringsplit(result, ",")
				R = tonumber(color[1])
				G = tonumber(color[2])
				B = tonumber(color[3])
				Citizen.Wait(500)
				blockinput = false
				SetVehicleCustomPrimaryColour(playerVeh, R, G, B)
				SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
			else
				Citizen.Wait(500)
				blockinput = false
			end
		else
			SetVehicleColours(playerVeh, colorindex, vehiclecol[2])
			SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
		end
		drawNotification("~g~Repainted Primary Color")
	else
		drawNotification("~r~Not in a vehicle!")
	end
	cb("ok")
end)

RegisterNUICallback("secmetalchrome", function(data, cb) --Vehicle Color (Secondary Metals & Chrome)
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local colorindex = tonumber(data.action)
	local modColor

	if colorindex == 120 or data.action == "custom" then
		modColor = 5
	else
		modColor = 4
	end
	
	if IsPedInAnyVehicle(playerPed, true) then
		SetVehicleModColor_2(playerVeh, modColor)
		if data.action == "custom" then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "" .. R .. "," .. G .. "," .. B .. "", "", "", "", 25)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(1)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				local result = GetOnscreenKeyboardResult()
				local color = stringsplit(result, ",")
				R = tonumber(color[1])
				G = tonumber(color[2])
				B = tonumber(color[3])
				Citizen.Wait(500)
				blockinput = false
				SetVehicleCustomSecondaryColour(playerVeh, R, G, B)
				SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
			else
				Citizen.Wait(500)
				blockinput = false
			end
		else
			ClearVehicleCustomSecondaryColour(playerVeh)
			SetVehicleColours(playerVeh, vehiclecol[1], colorindex)
			SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
		end
		drawNotification("~g~Repainted Secondary Color")
	else
		drawNotification("~r~Not in a vehicle!")
	end
	cb("ok")
end)

RegisterNUICallback("secmatte", function(data, cb) --Vehicle Color (Secondary Matte)
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local colorindex = tonumber(data.action)

	if IsPedInAnyVehicle(playerPed, true) then
		SetVehicleModColor_2(playerVeh, 3)
		ClearVehicleCustomSecondaryColour(playerVeh)
		if data.action == "custom" then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "" .. R .. "," .. G .. "," .. B .. "", "", "", "", 25)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(1)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				local result = GetOnscreenKeyboardResult()
				local color = stringsplit(result, ",")
				R = tonumber(color[1])
				G = tonumber(color[2])
				B = tonumber(color[3])
				Citizen.Wait(500)
				blockinput = false
				SetVehicleCustomSecondaryColour(playerVeh, R, G, B)
				SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
			else
				Citizen.Wait(500)
				blockinput = false
			end
		else
			SetVehicleColours(playerVeh, vehiclecol[1], colorindex)
			SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
		end
		drawNotification("~g~Repainted Secondary Color")
	else
		drawNotification("~r~Not in a vehicle!")
	end
	cb("ok")
end)

RegisterNUICallback("secmetallic", function(data, cb) --Vehicle Color (Secondary Metallic)
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local colorindex = tonumber(data.action)

	if IsPedInAnyVehicle(playerPed, true) then
		SetVehicleModColor_2(playerVeh, 1)
		ClearVehicleCustomSecondaryColour(playerVeh)
		if data.action == "custom" then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "" .. R .. "," .. G .. "," .. B .. "", "", "", "", 25)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(1)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				local result = GetOnscreenKeyboardResult()
				local color = stringsplit(result, ",")
				R = tonumber(color[1])
				G = tonumber(color[2])
				B = tonumber(color[3])
				Citizen.Wait(500)
				blockinput = false
				SetVehicleCustomSecondaryColour(playerVeh, R, G, B)
				SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
			else
				Citizen.Wait(500)
				blockinput = false
			end
		else
			SetVehicleColours(playerVeh, vehiclecol[1], colorindex)
			SetVehicleExtraColours(playerVeh, extracol[1], extracol[2])
		end
		drawNotification("~g~Repainted Secondary Color")
	else
		drawNotification("~r~Not in a vehicle!")
	end
	cb("ok")
end)

RegisterNUICallback("pearl", function(data, cb) --Vehicle Color (Pearlescent)
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local colorindex = tonumber(data.action)

	if IsPedInAnyVehicle(playerPed, true) then
		SetVehicleExtraColours(playerVeh, colorindex, extracol[2])
		drawNotification("~g~Repainted Pearlescent Color")
	else
		drawNotification("~r~Not in a vehicle!")
	end
	cb("ok")
end)

RegisterNUICallback("rims", function(data, cb) --Vehicle Color (Pearlescent)
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local colorindex = tonumber(data.action)

	if IsPedInAnyVehicle(playerPed, true) then
		SetVehicleExtraColours(playerVeh, extracol[1], colorindex)
		drawNotification("~g~Repainted Rims Color")
	else
		drawNotification("~r~Not in a vehicle!")
	end
	cb("ok")
end)

RegisterNUICallback("neons", function(data, cb) --Vehicle Neons
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local action = data.action
	local newstate = data.newstate

	if IsPedInAnyVehicle(playerPed, true) then
		if action == "left" then
			neonleft = newstate
			if (neonleft == true) then
				drawNotification("~g~Left Neon Enabled!")
			else
				drawNotification("~r~Left Neon Disabled!")
			end
		elseif action == "right" then
			neonright = newstate
			if (neonright == true) then
				drawNotification("~g~Right Neon Enabled!")
			else
				drawNotification("~r~Right Neon Disabled!")
			end
		elseif action == "front" then
			neonfront = newstate
			if (neonfront == true) then
				drawNotification("~g~Front Neon Enabled!")
			else
				drawNotification("~r~Front Neon Disabled!")
			end
		elseif action == "back" then
			neonback = newstate
			if (neonback == true) then
				drawNotification("~g~Back Neon Enabled!")
			else
				drawNotification("~r~Back Neon Disabled!")
			end
		elseif action == "color" then
			DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "" .. R .. "," .. G .. "," .. B .. "", "", "", "", 25)
			blockinput = true

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait(1)
			end
			if UpdateOnscreenKeyboard() ~= 2 then
				local result = GetOnscreenKeyboardResult()
				local color = stringsplit(result, ",")
				R = tonumber(color[1])
				G = tonumber(color[2])
				B = tonumber(color[3])
				Citizen.Wait(500)
				blockinput = false
				SetVehicleNeonLightsColour(playerVeh, R, G, B)
				drawNotification("~g~Changed Neon Color")
			else
				Citizen.Wait(500)
				blockinput = false
			end
		end
	else
		drawNotification("~r~Not in a vehicle!")
	end
	
	cb("ok")
end)

RegisterNUICallback("openclosedoors", function(data, cb) --Door Menu
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local action = data.action
	
	if action == "0" then
		if IsPedInAnyVehicle(playerPed, true) then
			if GetVehicleDoorAngleRatio(playerVeh, 0) > 0.0 then 
				SetVehicleDoorShut(playerVeh, 0, false)
				drawNotification("~r~Front Left Door Closed!")
			else
				SetVehicleDoorOpen(playerVeh, 0, false)
				frontleft = true
			end
		else
			drawNotification("~r~Not in a vehicle!")
		end
	elseif action == "1" then 
		if IsPedInAnyVehicle(playerPed, true) then
			if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then 
				SetVehicleDoorShut(playerVeh, 1, false)
				drawNotification("~r~Front Right Door Closed!")
			else
				SetVehicleDoorOpen(playerVeh, 1, false)
				frontright = true
			end
		else
			drawNotification("~r~Not in a vehicle!")
		end
	elseif action == "2" then 
		if IsPedInAnyVehicle(playerPed, true) then
			if GetVehicleDoorAngleRatio(playerVeh, 2) > 0.0 then 
				SetVehicleDoorShut(playerVeh, 2, false)
				drawNotification("~r~Rear Left Door Closed!")
			else
				SetVehicleDoorOpen(playerVeh, 2, false)
				rearleft = true
			end
		else
			drawNotification("~r~Not in a vehicle!")
		end
	elseif action == "3" then 
		if IsPedInAnyVehicle(playerPed, true) then
			if GetVehicleDoorAngleRatio(playerVeh, 3) > 0.0 then 
				SetVehicleDoorShut(playerVeh, 3, false)
				drawNotification("~r~Rear Right Door Closed!")
			else
				SetVehicleDoorOpen(playerVeh, 3, false)
				rearright = true
			end
		else
			drawNotification("~r~Not in a vehicle!")
		end
	elseif action == "4" then 
		if IsPedInAnyVehicle(playerPed, true) then
			if GetVehicleDoorAngleRatio(playerVeh, 4) > 0.0 then 
				SetVehicleDoorShut(playerVeh, 4, false)
				drawNotification("~r~Hood Closed!")
			else
				SetVehicleDoorOpen(playerVeh, 4, false)
				hood = true
			end
		else
			drawNotification("~r~Not in a vehicle!")
		end
	elseif action == "5" then 
		if IsPedInAnyVehicle(playerPed, true) then
			if GetVehicleDoorAngleRatio(playerVeh, 5) > 0.0 then 
				SetVehicleDoorShut(playerVeh, 5, false)
				drawNotification("~r~Trunk Closed!")
			else
				SetVehicleDoorOpen(playerVeh, 5, false)
				trunk = true
			end
		else
			drawNotification("~r~Not in a vehicle!")
		end
	end
end)

RegisterNUICallback("extra", function(data, cb) --Extra Menu
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local action = data.action
	local extra = tonumber(action)
	local newstate = data.newstate
	
	if action == "show" then
		showextras = newstate
		drawNotification("~g~Showing Extras States!")
		drawNotification("~y~Disappears In 10 Seconds!")
	else
		if IsPedInAnyVehicle(playerPed, true) then
			if (DoesExtraExist(playerVeh, extra) == 1) then
				if (IsVehicleExtraTurnedOn(playerVeh, extra) == 1) then
					SetVehicleExtra(playerVeh, extra, true)
					drawNotification("~r~Extra " .. action .. " Disabled!")
				else
					SetVehicleExtra(playerVeh, extra, false)
					drawNotification("~g~Extra " .. action .. " Enabled!")
				end
			else
				drawNotification("~r~Extra " .. action .. " Not Existing!")
			end
		else
			drawNotification("~r~Not in a vehicle!")
		end
	end
end)

Citizen.CreateThread(function() --Door Messages
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)

		if (frontleft == true) then --Front Left Door Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(playerVeh, 0) == 0.0 then
				drawNotification("~r~No Front Left Door!")
			else
				drawNotification("~g~Front Left Door Opened!")
			end
			frontleft = false
		elseif (frontright == true) then --Front Right Door Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(playerVeh, 1) == 0.0 then
				drawNotification("~r~No Front Right Door!")
			else
				drawNotification("~g~Front Right Door Opened!")
			end
			frontright = false
		elseif (rearleft == true) then --Rear Left Door Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(playerVeh, 2) == 0.0 then
				drawNotification("~r~No Rear Left Door!")
			else
				drawNotification("~g~Rear Left Door Opened!")
			end
			rearleft = false
		elseif (rearright == true) then --Rear Right Door Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(playerVeh, 3) == 0.0 then
				drawNotification("~r~No Rear Right Door!")
			else
				drawNotification("~g~Rear Right Door Opened!")
			end
			rearright = false
		elseif (hood == true) then --Hood Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(playerVeh, 4) == 0.0 then
				drawNotification("~r~No Hood!")
			else
				drawNotification("~g~Hood Opened!")
			end
			hood = false
		elseif (trunk == true) then --Trunk Message
			Citizen.Wait(50)
			if GetVehicleDoorAngleRatio(playerVeh, 5) == 0.0 then
				drawNotification("~r~No Trunk!")
			else
				drawNotification("~g~Trunk Opened!")
			end
			trunk = false
		end
	end
end)

Citizen.CreateThread(function() --Neons
	while true do
		Citizen.Wait(0)
		if (neonleft == true) then
			SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 0, true)
		elseif (neonleft == false) then
			SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 0, false)
		end
		if (neonright == true) then
			SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 1, true)
		elseif (neonright == false) then
			SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 1, false)
		end
		if (neonfront == true) then
			SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 2, true)
		elseif (neonfront == false) then
			SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 2, false)
		end
		if (neonback == true) then
			SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 3, true)
		elseif (neonback == false) then
			SetVehicleNeonLightEnabled(GetVehiclePedIsIn(GetPlayerPed(-1)), 3, false)
		end
	end
end)

Citizen.CreateThread(function() --Godmode
	while true do
		Citizen.Wait(0)
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1))
		if (vehgodmode == false) then
			SetVehicleCanBeVisiblyDamaged(playerVeh, true)
			SetVehicleTyresCanBurst(playerVeh, true)
			SetEntityInvincible(playerVeh, false)
			SetEntityProofs(playerVeh, false, false, false, false, false, false, false, false)
			SetVehicleWheelsCanBreak(playerVeh, true)
			SetVehicleExplodesOnHighExplosionDamage(playerVeh, true)
			SetEntityOnlyDamagedByPlayer(playerVeh, true)
			SetEntityCanBeDamaged(playerVeh, true)
		elseif (vehgodmode == true) then
			SetVehicleCanBeVisiblyDamaged(playerVeh, false)
			SetVehicleTyresCanBurst(playerVeh, false)
			SetEntityInvincible(playerVeh, true)
			SetEntityProofs(playerVeh, true, true, true, true, true, true, true, true)
			SetVehicleWheelsCanBreak(playerVeh, false)
			SetVehicleExplodesOnHighExplosionDamage(playerVeh, false)
			SetEntityOnlyDamagedByPlayer(playerVeh, false)
			SetEntityCanBeDamaged(playerVeh, false)
		end
	end
end)

Citizen.CreateThread(function() --Flying Car
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		local Speed = GetEntitySpeed(playerVeh)
		local Rot = GetEntityRotation(playerVeh, 2)
		
		if Speed < 10.0 then
			Speed = Speed + 15.0
		end
		if (flyingcar == true) then
			if IsControlPressed(1, 21) then --Instant Stop
				SetVehicleForwardSpeed(playerVeh, 0.0)
			elseif IsControlPressed(1, 71) then --Forward
				SetVehicleForwardSpeed(playerVeh, Speed * 1.01)
			elseif IsControlPressed(1, 72) then --Backward
				SetVehicleForwardSpeed(playerVeh, -70.0)
			end
			if (IsPedInAnyHeli(playerPed) == false) and (IsPedInAnyPlane(playerPed) == false) then
				if IsControlPressed(1, 89) then --Left (Everything Else than Helicopters and Planes)
					SetEntityRotation(playerVeh, Rot.x, Rot.y, Rot.z + 0.5, 2, 1)
				elseif IsControlPressed(1, 90) then --Right (Everything Else than Helicopters and Planes)
					SetEntityRotation(playerVeh, Rot.x, Rot.y, Rot.z - 0.5, 2, 1)
				elseif IsControlPressed(1, 108) then --Left Roll (Everything Else than Helicopters and Planes)
					SetEntityRotation(playerVeh, Rot.x, Rot.y - 0.75, Rot.z, 2, 1)
				elseif IsControlPressed(1, 109) then --Right Roll (Everything Else than Helicopters and Planes)
					SetEntityRotation(playerVeh, Rot.x, Rot.y + 0.75, Rot.z, 2, 1)
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Reducing Grip
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		if playerVeh then
			SetVehicleReduceGrip(playerVeh, reducevehgrip)
		end
	end
end)

Citizen.CreateThread(function() --Visibility
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		if playerVeh then
			SetEntityVisible(playerVeh, setvisible, 0)
		end
	end
end)

Citizen.CreateThread(function() --Gravity
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		if playerVeh then
			SetVehicleGravity(playerVeh, setgravity)
		end
	end
end)

Citizen.CreateThread(function() --Boost On Horn
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)

		if (boostcar == true) then
			if IsControlPressed(1, 71) and IsControlPressed(1, 86) then
				SetVehicleBoostActive(playerVeh, 1, 0)
				SetVehicleForwardSpeed(playerVeh, 75.0)
				StartScreenEffect("RaceTurbo", 0, 0)
			elseif IsControlPressed(1, 72) and IsControlPressed(1, 86) then
				SetVehicleBoostActive(playerVeh, 1, 0)
				SetVehicleForwardSpeed(playerVeh, -75.0)
			end
			SetVehicleBoostActive(playerVeh, 0, 0)
		end
	end
end)

Citizen.CreateThread(function() --Seatbelt
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)

		if (seatbelt == true) then
			SetPedCanBeKnockedOffVehicle(playerPed, 1)
			SetPedCanRagdoll(playerPed, false)
			if (IsPedRagdoll(playerPed) == true) then
				SetPedIntoVehicle(playerPed, playerVeh, -1)
			end
		end
	end
end)

Citizen.CreateThread(function() --Bunny Hop
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)

		if (bunnyhop == true) then
			if IsPedInAnyVehicle(playerPed, true) and IsControlJustReleased(1, 21) and IsVehicleOnAllWheels(playerVeh) then
				ApplyForceToEntity(playerVeh, 1, 0.0, 0.0, 12.5, 0.0, 0.0, 0.0, 1, true, true, true, true, true)
			end
		end
	end
end)

Citizen.CreateThread(function() --Vehicle Blip Rotation
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, true)
		local vehicleblip = GetBlipFromEntity(playerVeh)
		
		if vehicleblip then
			if (GetVehicleClass(playerVeh) == 8) or (GetVehicleClass(playerVeh) == 13) then
				SetBlipRotation(vehicleblip, math.ceil(GetEntityHeading(playerVeh)) - 90)
			else
				SetBlipRotation(vehicleblip, math.ceil(GetEntityHeading(playerVeh)))
			end
		end
	end
end)

Citizen.CreateThread(function() --Helicopter Blip
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, true)
		
		
		if (GetVehicleClass(playerVeh) == 15) and (IsVehicleModel(playerVeh, GetHashKey("SKYLIFT")) == false) then --Helicopter Blips
			if IsPedInAnyVehicle(playerPed) then
				if GetBlipSprite(GetBlipFromEntity(playerVeh)) ~= 422 then
					RemoveBlip(GetBlipFromEntity(playerVeh))
					AddBlipForEntity(playerVeh)
					SetBlipSprite(GetBlipFromEntity(playerVeh), 422)
				end
			else
				if GetBlipSprite(GetBlipFromEntity(playerVeh)) ~= 64 then
					RemoveBlip(GetBlipFromEntity(playerVeh))
					AddBlipForEntity(playerVeh)
					SetBlipSprite(GetBlipFromEntity(playerVeh), 64)
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Emergency Blip Color Flash
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, true)
		
		
		if (GetVehicleClass(playerVeh) == 18) then --Emergency Blips
			if IsPedInAnyVehicle(playerPed) then
				if GetBlipSprite(GetBlipFromEntity(playerVeh)) == 198 then
					if IsVehicleSirenOn(playerVeh) then
						if GetBlipColour(GetBlipFromEntity(playerVeh)) ~= 76 then
							Citizen.Wait(250)
							SetBlipColour(GetBlipFromEntity(playerVeh), 76)
						elseif GetBlipColour(GetBlipFromEntity(playerVeh)) ~= 63 then
							Citizen.Wait(250)
							SetBlipColour(GetBlipFromEntity(playerVeh), 63)
						end
					else
						SetBlipColour(GetBlipFromEntity(playerVeh), 0)
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Rainbow Car
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		local rgb = RGBRainbow(0.825)

		if (rainbowcar == true) then
			SetVehicleCustomPrimaryColour(playerVeh, rgb.r, rgb.g, rgb.b)
			SetVehicleCustomSecondaryColour(playerVeh, rgb.r, rgb.g, rgb.b)
			Citizen.Wait(350)
		end
	end
end)

Citizen.CreateThread(function() --Rainbow Neons
	while true do
		Citizen.Wait(1)

		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		local rgb = RGBRainbow(0.825)

		if (rainbowneons == true) then
			SetVehicleNeonLightsColour(playerVeh, rgb.r, rgb.g, rgb.b)
			Citizen.Wait(350)
		end
	end
end)

Citizen.CreateThread(function() --Hide Extras States
	while true do
		Citizen.Wait(1)
		
		if (showextras == true) then
			Citizen.Wait(1000000)
			drawNotification("~r~Hidding Extras States")
			showextras = false
		end
	end
end)

Citizen.CreateThread(function() --Show Extras States
	while true do
		Citizen.Wait(1)
		
		local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local extra1, extra2, extra3, extra4, extra5,
			  extra6, extra7, extra8, extra9, extra10,
			  extra11, extra12, extra13, extra14

		if DoesExtraExist(playerVeh, 1) then
			if (IsVehicleExtraTurnedOn(playerVeh, 1) == 1) then
				extra1 = "ON"
			else
				extra1 = "OFF"
			end
		else
			extra1 = "N/A"
		end
		if DoesExtraExist(playerVeh, 2) then
			if (IsVehicleExtraTurnedOn(playerVeh, 2) == 1) then
				extra2 = "ON"
			else
				extra2 = "OFF"
			end
		else
			extra2 = "N/A"
		end
		if DoesExtraExist(playerVeh, 3) then
			if (IsVehicleExtraTurnedOn(playerVeh, 3) == 1) then
				extra3 = "ON"
			else
				extra3 = "OFF"
			end
		else
			extra3 = "N/A"
		end
		if DoesExtraExist(playerVeh, 4) then
			if (IsVehicleExtraTurnedOn(playerVeh, 4) == 1) then
				extra4 = "ON"
			else
				extra4 = "OFF"
			end
		else
			extra4 = "N/A"
		end
		if DoesExtraExist(playerVeh, 5) then
			if (IsVehicleExtraTurnedOn(playerVeh, 5) == 1) then
				extra5 = "ON"
			else
				extra5 = "OFF"
			end
		else
			extra5 = "N/A"
		end
		if DoesExtraExist(playerVeh, 6) then
			if (IsVehicleExtraTurnedOn(playerVeh, 6) == 1) then
				extra6 = "ON"
			else
				extra6 = "OFF"
			end
		else
			extra6 = "N/A"
		end
		if DoesExtraExist(playerVeh, 7) then
			if (IsVehicleExtraTurnedOn(playerVeh, 7) == 1) then
				extra7 = "ON"
			else
				extra7 = "OFF"
			end
		else
			extra7 = "N/A"
		end
		if DoesExtraExist(playerVeh, 8) then
			if (IsVehicleExtraTurnedOn(playerVeh, 8) == 1) then
				extra8 = "ON"
			else
				extra8 = "OFF"
			end
		else
			extra8 = "N/A"
		end
		if DoesExtraExist(playerVeh, 9) then
			if (IsVehicleExtraTurnedOn(playerVeh, 9) == 1) then
				extra9 = "ON"
			else
				extra9 = "OFF"
			end
		else
			extra9 = "N/A"
		end
		if DoesExtraExist(playerVeh, 10) then
			if (IsVehicleExtraTurnedOn(playerVeh, 10) == 1) then
				extra10 = "ON"
			else
				extra10 = "OFF"
			end
		else
			extra10 = "N/A"
		end
		if DoesExtraExist(playerVeh, 11) then
			if (IsVehicleExtraTurnedOn(playerVeh, 11) == 1) then
				extra11 = "ON"
			else
				extra11 = "OFF"
			end
		else
			extra11 = "N/A"
		end
		if DoesExtraExist(playerVeh, 12) then
			if (IsVehicleExtraTurnedOn(playerVeh, 12) == 1) then
				extra12 = "ON"
			else
				extra12 = "OFF"
			end
		else
			extra12 = "N/A"
		end
		if DoesExtraExist(playerVeh, 13) then
			if (IsVehicleExtraTurnedOn(playerVeh, 13) == 1) then
				extra13 = "ON"
			else
				extra13 = "OFF"
			end
		else
			extra13 = "N/A"
		end
		if DoesExtraExist(playerVeh, 14) then
			if (IsVehicleExtraTurnedOn(playerVeh, 14) == 1) then
				extra14 = "ON"
			else
				extra14 = "OFF"
			end
		else
			extra14 = "N/A"
		end
		
		if (showextras == true) then
			opname("~r~" .. extra1 .. "", 0.900, 0.1550 + 0.0365)
			opname("~r~" .. extra2 .. "", 0.900, 0.1915 + 0.0365)
			opname("~r~" .. extra3 .. "", 0.900, 0.2280 + 0.0365)
			opname("~r~" .. extra4 .. "", 0.900, 0.2645 + 0.0365)
			opname("~r~" .. extra5 .. "", 0.900, 0.3010 + 0.0365)
			opname("~r~" .. extra6 .. "", 0.900, 0.3375 + 0.0365)
			opname("~r~" .. extra7 .. "", 0.900, 0.3740 + 0.0365)
			opname("~r~" .. extra8 .. "", 0.900, 0.4105 + 0.0365)
			opname("~r~" .. extra9 .. "", 0.900, 0.4470 + 0.0365)
			opname("~r~" .. extra10 .. "", 0.900, 0.4835 + 0.0365)
			opname("~r~" .. extra11 .. "", 0.900, 0.5200 + 0.0365)
			opname("~r~" .. extra12 .. "", 0.900, 0.5565 + 0.0365)
			opname("~r~" .. extra13 .. "", 0.900, 0.5930 + 0.0365)
			opname("~r~" .. extra14 .. "", 0.900, 0.6295 + 0.0365)
		end
	end
end)

Citizen.CreateThread(function() --Get Current Vehicle Colors (Vehicle Color Menu)
	while true do
		Citizen.Wait(1)

		vehiclecol = table.pack(GetVehicleColours(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
		extracol = table.pack(GetVehicleExtraColours(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
		neoncolor = table.pack(GetVehicleNeonLightsColour(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
		
	end
end)

function RGBRainbow(frequency) --Rainbow Car Function (Credits to Ash)
    local result = {}

    result.r = math.floor(math.sin((GetGameTimer() / 5000) * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin((GetGameTimer() / 5000) * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin((GetGameTimer() / 5000) * frequency + 4) * 127 + 128)

    return result
end