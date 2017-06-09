local godmode, nowantedlevel, setvisible, stamina, fastrun, fastswim, superjump, everyignores, polignores, mChar, fChar, supermanmode
--local ghostmode --Just Some Testing

RegisterNUICallback("player", function(data, cb) --Player Options
	local playerPed = GetPlayerPed(-1)
	local action = data.action
	local newstate = data.newstate

	if action == "armorhealwash" then --Armor
		SetPedArmour(playerPed, 100)
		SetEntityHealth(playerPed, 200)
		ClearPedBloodDamage(playerPed)
		ResetPedVisibleDamage(playerPed)
		ClearPedLastWeaponDamage(playerPed)
		drawNotification("~g~Added Armor, Healed & Washed Your Ped!")
	elseif action == "test" then --TEST
		TriggerServerEvent("ID")
		drawNotification("~g~TEST")
	elseif action == "god" then --Godmode
		godmode = newstate
		if (godmode == true) then
			SetPedArmour(playerPed, 100)
			SetEntityHealth(playerPed, 200)
			drawNotification("~g~Godmode Enabled!")
		else
			drawNotification("~r~Godmode Disabled!")
		end
	elseif action == "visible" then --Visibility
		setvisible = newstate
		if (setvisible == true) then
			drawNotification("~g~Player Visible!")
		else
			drawNotification("~r~Player Invisible!")
		end
	elseif action == "suicide" then --Suicide
		SetEntityHealth(playerPed, 0)
		drawNotification("~r~Killed Player!")
	elseif action == "stamina" then --Infinite Stamina
		stamina = newstate
		if (stamina == true) then
			drawNotification("~g~Infinite Stamina Enabled!")
		else
			drawNotification("~r~Infinite Stamina Disabled!")
		end
	elseif action == "run" then --Fast Run
		fastrun = newstate
		if (fastrun == true) then
			drawNotification("~g~Fast Run Enabled!")
		else
			drawNotification("~r~Fast Run Disabled!")
		end
	elseif action == "swim" then --Fast Swim
		fastswim = newstate
		if (fastswim == true) then
			drawNotification("~g~Fast Swim Enabled!")
		else
			drawNotification("~r~Fast Swim Disabled!")
		end
	elseif action == "jump" then --Super Jump
		superjump = newstate
		if (superjump == true) then
			drawNotification("~g~Super Jump Enabled!")
		else
			drawNotification("~r~Super Jump Disabled!")
		end
	elseif action == "everyoneignores" then --Super Jump
		everyignores = newstate
		if (everyignores == true) then
			drawNotification("~g~Everyone Ignores You Enabled!")
		else
			drawNotification("~r~Everyone Ignores You Disabled!")
		end
	elseif action == "policeignores" then --Super Jump
		polignores = newstate
		if (polignores == true) then
			drawNotification("~g~Police Ignores You Enabled!")
		else
			drawNotification("~r~Police Ignores You Disabled!")
		end
	elseif action == "superman" then --Superman Mode
		supermanmode = newstate
		if (supermanmode == true) then
			drawNotification("~g~Superman Mode Enabled!")
		else
			drawNotification("~r~Superman Mode Disabled!")
		end
	elseif action == "ghost" then --Superman Mode
		ghostmode = newstate
		if (ghostmode == true) then
			drawNotification("~g~Ghost Mode Enabled!")
		else
			drawNotification("~r~Ghost Mode Disabled!")
		end
	end	

	cb("ok")
end)

RegisterNUICallback("wanted", function(data, cb) --Set Wanted Level
	local playerPed = GetPlayerPed(-1)
	local lvl = tonumber(data.action)
	
	if data.action == "clearwanted" then --Clear Wanted Level
		if nowantedlevel == true then
			drawNotification("~r~Not Possible While Wanted Level Is Disabled!")
		else
			SetPlayerWantedLevel(PlayerId(), 0, 0)
			SetPlayerWantedLevelNow(PlayerId(), 0)
			drawNotification("~g~Wanted Level Cleared!")
		end
	elseif data.action == "nowantedlvl" then --Disable Wanted Level
		nowantedlevel = data.newstate
		if (nowantedlevel == true) then
			drawNotification("~g~Wanted Level Disabled!")
		else
			drawNotification("~r~Wanted Level Enabled!")
		end
	else --Set Wanted Level
		if nowantedlevel == true then
			drawNotification("~r~Not Possible While Wanted Level Is Disabled!")
		else
			SetPlayerWantedLevel(player, lvl, 0)
			SetPlayerWantedLevelNow(player, lvl)
			drawNotification("~g~Set Wanted Level To " .. lvl .. "!")
		end
	end

	cb("ok")
end)

RegisterNUICallback("sexact", function(data, cb) --Player Animations (Sex Acts)
	local action = data.action
	local playerPed = GetPlayerPed(-1)
	local Request = RequestAnimDict
	local Loaded = HasAnimDictLoaded
	local Play = TaskPlayAnim
	
	SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
	
	if action == "stop" then
		ClearPedTasksImmediately(playerPed)
		drawNotification("~r~S*x Act stopped!")
	elseif action == "analget" then
		Request("rcmpaparazzo_2")
		while not Loaded("rcmpaparazzo_2") do
			Citizen.Wait(1)
		end
		
		if Loaded("rcmpaparazzo_2") then
			Play(playerPed, "rcmpaparazzo_2", "shag_loop_poppy", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~Getting Anal F*cked started!")
	elseif action == "analgive" then
		Request("rcmpaparazzo_2")
		while not Loaded("rcmpaparazzo_2") do
			Citizen.Wait(1)
		end
		
		if Loaded("rcmpaparazzo_2") then
			Play(playerPed, "rcmpaparazzo_2", "shag_loop_a", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~Anal F*cking started!")
	elseif action == "bjget" then
		Request("mini@prostitutes@sexnorm_veh")
		while not Loaded("mini@prostitutes@sexnorm_veh") do
			Citizen.Wait(1)
		end
		
		if Loaded("mini@prostitutes@sexnorm_veh") then
			Play(playerPed, "mini@prostitutes@sexnorm_veh", "bj_loop_male", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~Getting BJ started!")
	elseif action == "bjgive" then
		Request("mini@prostitutes@sexnorm_veh")
		while not Loaded("mini@prostitutes@sexnorm_veh") do
			Citizen.Wait(1)
		end
		
		if Loaded("mini@prostitutes@sexnorm_veh") then
			Play(playerPed, "mini@prostitutes@sexnorm_veh", "bj_loop_prostitute", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~Giving BJ started!")
	elseif action == "carget" then
		Request("mini@prostitutes@sexnorm_veh")
		while not Loaded("mini@prostitutes@sexnorm_veh") do
			Citizen.Wait(1)
		end
		
		if Loaded("mini@prostitutes@sexnorm_veh") then
			Play(playerPed, "mini@prostitutes@sexnorm_veh", "sex_loop_male", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~Getting Car S*x started!")
	elseif action == "cargive" then
		Request("mini@prostitutes@sexnorm_veh")
		while not Loaded("mini@prostitutes@sexnorm_veh") do
			Citizen.Wait(1)
		end
		
		if Loaded("mini@prostitutes@sexnorm_veh") then
			Play(playerPed, "mini@prostitutes@sexnorm_veh", "sex_loop_prostitute", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~Giving Car S*x started!")
	end
	cb("ok")
end)

RegisterNUICallback("strip", function(data, cb) --Player Animations (Strips)
	local action = data.action
	local playerPed = GetPlayerPed(-1)
	local Request = RequestAnimDict
	local Loaded = HasAnimDictLoaded
	local Play = TaskPlayAnim
	
	SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
	
	if action == "stop" then
		ClearPedTasksImmediately(playerPed)
		drawNotification("~r~Strip stopped!")
		
	elseif action == "1pole" then
		Request("mini@strip_club@pole_dance@pole_dance1")
		while not Loaded("mini@strip_club@pole_dance@pole_dance1") do
			Citizen.Wait(1)
		end
		
		if Loaded("mini@strip_club@pole_dance@pole_dance1") then
			Play(playerPed, "mini@strip_club@pole_dance@pole_dance1", "pd_dance_01", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~1. Pole Dance started!")
		
	elseif action == "2pole" then
		Request("mini@strip_club@pole_dance@pole_dance2")
		while not Loaded("mini@strip_club@pole_dance@pole_dance2") do
			Citizen.Wait(1)
		end
		
		if Loaded("mini@strip_club@pole_dance@pole_dance2") then
			Play(playerPed, "mini@strip_club@pole_dance@pole_dance2", "pd_dance_02", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~2. Pole Dance started!")
		
	elseif action == "3pole" then
		Request("mini@strip_club@pole_dance@pole_dance3")
		while not Loaded("mini@strip_club@pole_dance@pole_dance3") do
			Citizen.Wait(1)
		end
		
		if Loaded("mini@strip_club@pole_dance@pole_dance3") then
			Play(playerPed, "mini@strip_club@pole_dance@pole_dance3", "pd_dance_03", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~3. Pole Dance started!")
		
	elseif action == "lap" then
		Request("mp_am_stripper")
		while not Loaded("mp_am_stripper") do
			Citizen.Wait(1)
		end
		
		if Loaded("mp_am_stripper") then
			Play(playerPed, "mp_am_stripper", "lap_dance_girl", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~Lap Dance started!")
		
	elseif action == "private" then
		Request("mini@strip_club@private_dance@part1")
		while not Loaded("mini@strip_club@private_dance@part1") do
			Citizen.Wait(1)
		end
		
		if Loaded("mini@strip_club@private_dance@part1") then
			Play(playerPed, "mini@strip_club@private_dance@part1", "priv_dance_p1", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~Private Dance started!")
		
	end
	cb("ok")
end)

RegisterNUICallback("suicide", function(data, cb) --Player Animations (Suicide)
	local action = data.action
	local playerPed = GetPlayerPed(-1)
	local Request = RequestAnimDict
	local Loaded = HasAnimDictLoaded
	local Play = TaskPlayAnim
	
	if action == "stop" then
		ClearPedTasksImmediately(playerPed)
		SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
		drawNotification("~r~Suicide stopped!")
	elseif action == "pill" then
		Request("mp_suicide")
		while not Loaded("mp_suicide") do
			Citizen.Wait(1)
		end
		if Loaded("mp_suicide") then
			SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
			Play(playerPed, "mp_suicide", "pill", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~Pill Suicide started!")
	elseif action == "pistol" then
		Request("mp_suicide")
		while not Loaded("mp_suicide") do
			Citizen.Wait(1)
		end
		
		if Loaded("mp_suicide") then
			GiveWeaponToPed(playerPed, GetHashKey("WEAPON_PISTOL"), 99999, false, false)
			SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_PISTOL"), true)
			Play(playerPed, "mp_suicide", "pistol", 8.0, 0.0, -1, 9, 0, 0, 0, 0)
		end
		drawNotification("~g~Pistol Suicide started!")
	end
	cb("ok")
end)

RegisterNUICallback("playerskin", function(data, cb) --Player Skins
	local model = GetHashKey(data.action)
	local playerPed = GetPlayerPed(-1)
	
	if IsModelInCdimage(model) and IsModelValid(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(1)
		end
		SetPlayerModel(PlayerId(), model)
	end
	drawNotification("~g~Changed Player Model!")
	if (model == GetHashKey("mp_m_freemode_01")) then
		mChar = true
		drawNotification("~y~Getting Visible, Wait...")
	elseif (model == GetHashKey("mp_f_freemode_01")) then
		fChar = true
		drawNotification("~y~Getting Visible, Wait...")
	end
	SetModelAsNoLongerNeeded(model)

	cb("ok")
end)

RegisterNUICallback("playerscen", function(data, cb) --Player Scenarios
	local scenario = data.action
	local playerPed = GetPlayerPed(-1)
	
	if scenario == "stop" then
		ClearPedTasksImmediately(playerPed)
		drawNotification("~g~Scenario stopped!")
	else
		TaskStartScenarioInPlace(playerPed, scenario, 0, false)
		drawNotification("~g~Scenario started!")
	end

	cb("ok")
end)

Citizen.CreateThread(function() --Godmode
	while true do
		Citizen.Wait(1)

		if (godmode == true) then
			SetEntityInvincible(GetPlayerPed(-1), true)
			SetPlayerInvincible(PlayerId(), true)
			SetPedCanRagdoll(GetPlayerPed(-1), false)
			ClearPedBloodDamage(GetPlayerPed(-1))
			ResetPedVisibleDamage(GetPlayerPed(-1))
			ClearPedLastWeaponDamage(GetPlayerPed(-1))
			SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
			SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
			SetEntityCanBeDamaged(GetPlayerPed(-1), false)
--			Citizen.InvokeNative(0x26695EC767728D84, GetPlayerPed(-1), 2)
--			Citizen.InvokeNative(0x26695EC767728D84, GetPlayerPed(-1), 3)
		elseif (godmode == false) then
			SetEntityInvincible(GetPlayerPed(-1), false)
			SetPlayerInvincible(PlayerId(), false)
			SetPedCanRagdoll(GetPlayerPed(-1), true)
			SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
			SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), true)
			SetEntityCanBeDamaged(GetPlayerPed(-1), true)
--			Citizen.InvokeNative(0xD86D101FCFD00A4B, GetPlayerPed(-1), 2)
--			Citizen.InvokeNative(0xD86D101FCFD00A4B, GetPlayerPed(-1), 3)
		end
	end
end)

Citizen.CreateThread(function() --Visibility
	while true do
		Citizen.Wait(1)

		if (setvisible == true) then
			SetEntityVisible(GetPlayerPed(-1), true, 1)
		elseif (setvisible == false) then
			SetEntityVisible(GetPlayerPed(-1), false, 1)
		end
	end
end)

Citizen.CreateThread(function() --Infinite Stamina
	while true do
		Citizen.Wait(1)

		if (stamina == true) then
			RestorePlayerStamina(PlayerId(), 1.0)
		end
	end
end)

Citizen.CreateThread(function() --Disable Wanted Level
	while true do
		Citizen.Wait(1)

		if (nowantedlevel == true) then
			SetMaxWantedLevel(0)
			ClearPlayerWantedLevel(PlayerId())
			SetPoliceIgnorePlayer(PlayerId(), true)
			SetPlayerWantedLevel(PlayerId(), 0, 0)
			SetPlayerWantedLevelNow(PlayerId(), 0)
		elseif (nowantedlevel == false) then
			SetMaxWantedLevel(5)
			SetPoliceIgnorePlayer(PlayerId(), false)
		end
	end
end)

Citizen.CreateThread(function() --Enable Fast Run
	while true do
		Citizen.Wait(1)

		if (fastrun == true) then
			SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
			SetPedMoveRateOverride(GetPlayerPed(-1), 1.15)
		elseif (fastrun == false) then
			SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
			SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
		end
	end
end)

Citizen.CreateThread(function() --Enable Fast Swim
	while true do
		Citizen.Wait(1)

		if (fastswim == true) then
			SetSwimMultiplierForPlayer(PlayerId(), 1.49)
		elseif (fastswim == false) then
			SetSwimMultiplierForPlayer(PlayerId(), 1.0)
		end
	end
end)

Citizen.CreateThread(function() --Enable Super Jump
	while true do
		Citizen.Wait(1)

		if (superjump == true) then
			SetSuperJumpThisFrame(PlayerId())
		end
	end
end)

Citizen.CreateThread(function() --Everyone Ignores You
	while true do
		Citizen.Wait(1)

		if (everyignores == true) then
			SetEveryoneIgnorePlayer(PlayerId(), true)
		else
			SetEveryoneIgnorePlayer(PlayerId(), false)
		end
	end
end)

Citizen.CreateThread(function() --Police Ignores You
	while true do
		Citizen.Wait(1)

		if (policeignores == true) then
			SetPoliceIgnorePlayer(PlayerId(), true)
		else
			SetPoliceIgnorePlayer(PlayerId(), false)
		end
	end
end)

Citizen.CreateThread(function() --Superman Mode
	while true do
		Wait(1)
		
		local coords = Citizen.InvokeNative(0x0A794A5A57F8DF91, PlayerPedId(), Citizen.ResultAsVector())
		local SupermanZ
		if IsControlPressed(1, 33) then
			SupermanZ = 5.0
		else
			SupermanZ = 0.225
		end
		
		if (supermanmode == true) then
			GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("gadget_parachute"), 1, false, false)
			if IsPedInParachuteFreeFall(GetPlayerPed(-1)) then
				ApplyForceToEntity(PlayerPedId(), 1, coords.x * 2, coords.y * 2, SupermanZ, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
			end
		end
	end
end)

--[[Citizen.CreateThread(function() --Ghost Mode --Just Some Testing
	while true do
		Wait(1)
		
		if (ghostmode == true) then
			SetEntityAlpha(GetPlayerPed(-1), 254, false)
			Citizen.InvokeNative(0x0AFC4AF510774B47)
			SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey("WEAPON_UNARMED"), true)
			for i = 0, 23 do
				if (GetPlayerPed(i) ~= 0) and (GetPlayerPed(i) ~= GetPlayerPed(-1)) then
					if IsPedInAnyVehicle(GetPlayerPed(i), true) then
						SetEntityNoCollisionEntity(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(i), true), true)
						SetEntityAlpha(GetVehiclePedIsIn(GetPlayerPed(i), true), 150, false)
					end
					SetEntityNoCollisionEntity(GetPlayerPed(-1), GetPlayerPed(i), true)
					SetEntityAlpha(GetPlayerPed(i), 150, false)
				end
			end
		else
			ResetEntityAlpha(GetPlayerPed(-1))
			for i = 0, 23 do
				if (GetPlayerPed(i) ~= 0) and (GetPlayerPed(i) ~= GetPlayerPed(-1)) then
					if (GetEntityAlpha(GetPlayerPed(i)) == 150) then
						if IsPedInAnyVehicle(GetPlayerPed(i), true) then
							ResetEntityAlpha(GetVehiclePedIsIn(GetPlayerPed(i), true))
						end
						ResetEntityAlpha(GetPlayerPed(i))
					end
				end
			end
		end
	end
end)]]

Citizen.CreateThread(function() --Making Some Animals Visible
	while true do
		Citizen.Wait(1)

		if (IsPedHuman(GetPlayerPed(-1)) == false) then
			SetPedComponentVariation(GetPlayerPed(-1), 0, 0, 0, 0)
		end
	end
end)

Citizen.CreateThread(function() --Making MP Character Visible
	while true do
		Citizen.Wait(1)

		if (mChar == true) then
			Citizen.Wait(500)
			SetPedHeadBlendData(GetPlayerPed(-1), 4, 4, 0, 4, 4, 0, 1.0, 1.0, 0.0, false)
			SetPedComponentVariation(GetPlayerPed(-1), 2, 2, 4, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 4, 33, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 5, 45, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 8, 56, 1, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 11, 49, 0, 0)
			drawNotification("~g~Got Visible!")
			mChar = false
		elseif (fChar == true) then
			SetPedHeadBlendData(GetPlayerPed(-1), 25, 25, 0, 25, 25, 0, 1.0, 1.0, 0.0, false)
			SetPedComponentVariation(GetPlayerPed(-1), 2, 13, 3, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1))
			SetPedComponentVariation(GetPlayerPed(-1), 5, 45, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 8, 33, 1, 0)
			SetPedComponentVariation(GetPlayerPed(-1), 11, 42, 0, 0)
			drawNotification("~g~Got Visible!")
			fChar = false
		end
	end
end)