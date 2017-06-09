local all, setinfinite, oneshot, explosiveammo, fireammo, teleportgun, deletegun, zentornogun, vehicleweapons, vehicleweaponsinstructions, VehicleWeaponHash

RegisterNUICallback("weapons", function(data, cb)
	local action = data.action
	local newstate = data.newstate
	
	if action == "giveall" then --Give All Weapons
		all = true
	elseif action == "removeall" then --Remove All Weapons
		RemoveAllPedWeapons(GetPlayerPed(-1), true)
		drawNotification("~g~All Weapons Removed.")
	elseif action == "infinite" then --Infinite Ammo
		setinfinite = newstate
		if (setinfinite == true) then
			drawNotification("~g~Infinite Ammo & No Reload Enabled")
		else
			drawNotification("~r~Infinite Ammo & No Reload Disabled")
		end
	elseif action == "oneshotkill" then --One Shot Kill
		oneshot = newstate
		if (oneshot == true) then
			drawNotification("~g~One Shot Kill Enabled")
		else
			drawNotification("~r~One Shot Kill Disabled")
		end
	elseif action == "explosive" then --Explosive Ammo
		explosiveammo = newstate
		if (explosiveammo == true) then
			drawNotification("~g~Explosive Ammo Enabled")
		else
			drawNotification("~r~Explosive Ammo Disabled")
		end
	elseif action == "fire" then --Fire Ammo
		fireammo = newstate
		if (fireammo == true) then
			drawNotification("~g~Fire Ammo Enabled")
		else
			drawNotification("~r~Fire Ammo Disabled")
		end
	elseif action == "telegun" then --Teleport Gun
		teleportgun = newstate
		if (teleportgun == true) then
			drawNotification("~g~Teleport Gun Enabled!~n~~w~Use The ~b~Heavy Sniper!~n~~b~Aim ~w~and ~b~Shoot ~w~To Teleport!")
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), 99999, false, false)
			SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), 0)
		else
			drawNotification("~r~Teleport Gun Disabled")
		end
	elseif action == "delegun" then --Delete Gun
		deletegun = newstate
		if (deletegun == true) then
			drawNotification("~g~Delete Gun Enabled!~n~~w~Use The ~b~Pistol!~n~~b~Aim ~w~and ~b~Shoot ~w~To Delete!")
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 0, false, false)
			SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 0)
		else
			drawNotification("~r~Delete Gun Disabled")
		end
	elseif action == "zengun" then --Zentorno Gun
		zentornogun = newstate
		if (zentornogun == true) then
			drawNotification("~g~Vehicle Gun Enabled!~n~~w~Use The ~b~AP Pistol~n~~b~Aim ~w~and ~b~Shoot!")
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), 0, false, false)
			SetPedAmmo(GetPlayerPed(-1), GetHashKey(WEAPON_APPISTOL), 0)
		else
			drawNotification("~r~Vehicle Gun Disabled")
		end
	end

	cb("ok")
end)

RegisterNUICallback("vehicleweap", function(data, cb)
	local newstate = data.newstate
	
	if data.action == "vehweap" then --Vehicle Weapons
		vehicleweapons = newstate
		if (vehicleweapons == true) then
			vehicleweaponsinstructions = true
			drawNotification("~g~Vehicle Weapons Enabled!")
		else
			drawNotification("~r~Vehicle Weapons Disabled")
		end
	else
		VehicleWeaponHash = GetHashKey(data.action)
	end

	cb("ok")
end)

RegisterNUICallback("wepgive", function(data, cb)
	local playerPed = GetPlayerPed(-1)
	local weapon = data.action

	GiveWeaponToPed(playerPed, GetHashKey(weapon), 9999, true, true)

	cb("ok")
end)

RegisterNUICallback("wepremove", function(data, cb)
	local playerPed = GetPlayerPed(-1)
	local weapon = data.action

	RemoveWeaponFromPed(playerPed, GetHashKey(weapon))
	
	cb("ok")
end)

Citizen.CreateThread(function() --Give All Weapons
	while true do
		Wait(1)

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
		if (all == true) then
			for i = 1, 62 do
				GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weapon[i]), 99999, false, false)
			end
			drawNotification("~g~All Weapons Given.")
			all = false
		end
	end
end)

Citizen.CreateThread(function() --Infinite Ammo
	while true do
		Wait(1)

		if (setinfinite == true) then
			SetPedInfiniteAmmo(GetPlayerPed(-1), true)
			SetPedInfiniteAmmoClip(GetPlayerPed(-1), true)
			SetPedAmmo(GetPlayerPed(-1), (GetSelectedPedWeapon(GetPlayerPed(-1))), 999)
		elseif (setinfinite == false) then
			SetPedInfiniteAmmo(GetPlayerPed(-1), false)
			SetPedInfiniteAmmoClip(GetPlayerPed(-1), false)
		end
	end
end)

Citizen.CreateThread(function() --Explosive Ammo
	while true do
		Wait(1)

		if (explosiveammo == true) then
			SetExplosiveAmmoThisFrame(PlayerId())
			SetExplosiveMeleeThisFrame(PlayerId())
		end
	end
end)

Citizen.CreateThread(function() --Fire Ammo
	while true do
		Wait(1)

		if (fireammo == true) then
			SetFireAmmoThisFrame(PlayerId())
		end
	end
end)

Citizen.CreateThread(function() --One Shot Kill
	while true do
		Citizen.Wait(1)

		if oneshot then
			SetPlayerWeaponDamageModifier(PlayerId(), 100.0)
		else
			SetPlayerWeaponDamageModifier(PlayerId(), 1.0)
		end
	end
end)

Citizen.CreateThread(function() --Teleport Gun
	while true do
		Citizen.Wait(1)
		
		local x, y, z = table.unpack(BulletCoords())
		
		if teleportgun then
			if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_HEAVYSNIPER")) then
				if (x ~= 0.0) and (y ~= 0.0) and (z ~= 0.0) then
					SetEntityCoords(GetPlayerPed(-1), x, y, z)
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Delete Gun
	while true do
		Citizen.Wait(1)

		local gotEntity = getEntity(PlayerId())
		
		if (deletegun == true) then
			if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL")) then
				if IsPlayerFreeAiming(PlayerId()) then
					if IsControlJustReleased(28, 237) or IsControlJustReleased(1, 142) then
						SetEntityAsMissionEntity(gotEntity, 1, 1)
						DeleteEntity(gotEntity)
						drawNotification("~g~Deleted!")
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Vehicle Gun
	while true do
		Citizen.Wait(1)

		local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
		
		if (zentornogun == true) then
			if (GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_APPISTOL")) then
				if IsPlayerFreeAiming(PlayerId()) then
					if IsControlPressed(28, 237) or IsControlPressed(1, 142) then
						while not HasModelLoaded(GetHashKey("ZENTORNO")) do
							Citizen.Wait(1)
							RequestModel(GetHashKey("ZENTORNO"))
						end
						local veh = CreateVehicle(GetHashKey("ZENTORNO"), playerPedPos.x, playerPedPos.y, playerPedPos.z + 2.0, GetEntityHeading(GetPlayerPed(-1)), true, true)
						SetEntityAsNoLongerNeeded(veh)
						SetEntityNoCollisionEntity(GetPlayerPed(-1), veh, true)
						SetVehicleForwardSpeed(veh, 150.0)
						Citizen.Wait(333)
					else
						SetEntityCollision(GetPlayerPed(-1), true, true)
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Vehicle Gun (Delete)
	while true do
		Citizen.Wait(1)

		local NearestVehicle = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1), true), 9999.9999, GetHashKey("ZENTORNO"), 71)
		local playerPedPos = GetEntityCoords(GetPlayerPed(-1), true)
		local NearestVehiclePos = GetEntityCoords(NearestVehicle, true)
		
		if (zentornogun == true) then
			if (IsVehicleSeatFree(NearestVehicle, -1) == false) then
				if (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, NearestVehiclePos.x, NearestVehiclePos.y, NearestVehiclePos.z) >= 20.0) then
					SetEntityAsMissionEntity(NearestVehicle, 1, 1)
					DeleteVehicle(NearestVehicle)
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Vehicle Weapons
	while true do
		Citizen.Wait(1)

		if (vehicleweapons == true) then
			if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				if IsControlPressed(1, 68) then
					local playerVeh = GetVehiclePedIsIn(GetPlayerPed(-1), true)
					local getcoords1 = GetOffsetFromEntityInWorldCoords(playerVeh, 0.6, 0.671, 0.35)
					local getcoords2 = GetOffsetFromEntityInWorldCoords(playerVeh, -0.6, 0.671, 0.35)
					local getcoords3 = GetOffsetFromEntityInWorldCoords(playerVeh, 0.6, 5.071, 0.35)
					local getcoords4 = GetOffsetFromEntityInWorldCoords(playerVeh, -0.6, 5.071, 0.35)
					ShootSingleBulletBetweenCoords(getcoords1.x, getcoords1.y, getcoords1.z, getcoords3.x, getcoords3.y, getcoords3.z, 500, 0, VehicleWeaponHash, GetPlayerPed(-1), true, false, 500.0)
					ShootSingleBulletBetweenCoords(getcoords2.x, getcoords2.y, getcoords2.z, getcoords4.x, getcoords4.y, getcoords4.z, 500, 0, VehicleWeaponHash, GetPlayerPed(-1), true, false, 500.0)
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Vehicle Weapons Instructions
	while true do
		Citizen.Wait(1)

		if (vehicleweaponsinstructions == true) then
			DisplayHelpMessage("~INPUT_VEH_AIM~ To Shoot When In A Vehicle")
		end
	end
end)

Citizen.CreateThread(function() --Vehicle Weapons Instructions (Auto Hide)
	while true do
		Citizen.Wait(1)

		if (vehicleweaponsinstructions == true) then
			Citizen.Wait(30000)
			vehicleweaponsinstructions = false
		end
	end
end)

function getEntity(player) --Function To Get Entity Player Is Aiming At
	local result, entity = GetEntityPlayerIsFreeAimingAt(player, Citizen.ReturnResultAnyway())
	return entity
end

function BulletCoords() --Function To Get Coords Of Last Bulletimpact
	local result, coord = GetPedLastWeaponImpactCoord(GetPlayerPed(-1), Citizen.ReturnResultAnyway())
	return coord
end