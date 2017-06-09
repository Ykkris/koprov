local x = 0.0
local y = 0.0
local z = 0.0

RegisterNUICallback("location", function(data, cb)
	local playerPed = GetPlayerPed(-1)
	local action = data.action
	local playerVeh = GetVehiclePedIsIn(playerPed, 0)
	local coords = stringsplit(data.action, ",")
	local x = tonumber(coords[1])
	local y = tonumber(coords[2])
	local z = tonumber(coords[3])
	
	RequestCollisionAtCoord(x, y, z)

	if action == "fib" then
		x = 135.5
		y = -749.0
		z = 260.0
		NetworkOverrideClockTime(20, 0, 0)
	elseif action == "iaa" then
		x = 113.9
		y = -618.5
		z = 206.0
		NetworkOverrideClockTime(20, 0, 0)
	elseif action == "dhospital" then
		x = 356.8
		y = -590.1
		z = 43.3
		NetworkOverrideClockTime(20, 0, 0)
	elseif action == "jewerly" then
		x = -630.4
		y = -236.7
		z = 37.0
		NetworkOverrideClockTime(20, 0, 0)
	elseif action == "stripclub" then
		x = 97.2
		y = -1290.9
		z = 29.2
		NetworkOverrideClockTime(20, 0, 0)
	elseif action == "morgue" then
		x = 244.9
		y = -1374.7
		z = 39.5
		NetworkOverrideClockTime(20, 0, 0)
	elseif action == "union" then
		x = 2.6
		y = -667.0
		z = 16.1
		NetworkOverrideClockTime(20, 0, 0)
	elseif action == "oneil" then
		--IPL Removing/Requesting
		RemoveIpl("farm_burnt")
		RemoveIpl("farm_burnt_lod")
		RemoveIpl("farm_burnt_props")
		RemoveIpl("farmint_cap")
		RequestIpl("farm")
		RequestIpl("farm_lod")
		RequestIpl("farmint")
		RequestIpl("farmint_lod")
		RequestIpl("des_farmhs_startimap")
		RequestIpl("farm_props")

		x = 2452.2
		y = 4954.5
		z = 45.0
	elseif action == "oneilb" then
		--IPL Removing/Requesting
		RemoveIpl("farm")
		RemoveIpl("farm_lod")
		RemoveIpl("farmint")
		RemoveIpl("farmint_lod")
		RemoveIpl("des_farmhs_startimap")
		RemoveIpl("farm_props")
		RemoveIpl("farmint_cap")
		RequestIpl("farm_burnt")
		RequestIpl("farm_burnt_lod")
		RequestIpl("farm_burnt_props")

		x = 2452.2
		y = 4954.5
		z = 45.0
	elseif action == "planecrash" then
		--IPL Requesting
		RequestIpl("Plane_crash_trench")
		if DoesEntityExist("prop_shamal_crash") then
			DeleteObject("prop_shamal_crash")
		end
		
		local plane = CreateObject(GetHashKey("prop_shamal_crash"), 2808.386, 4796.483, 46.200, false, false)
		SetEntityRotation(plane, -1.204,  -1.671, -9.383, 2, true)
		FreezeEntityPosition(plane, true)
		
		x = 2814.7
		y = 4758.5
		z = 47.5
	end
	if IsPedInAnyVehicle(playerPed, 0) and (GetPedInVehicleSeat(playerVeh, -1) == playerPed) then
		SetEntityCoords(playerVeh, x, y, z)
	else
		SetEntityCoords(playerPed, x, y, z)
	end
	drawNotification("~g~Succesfully Teleported!")

	cb("ok")
end)

RegisterNUICallback("customlocation", function(data, cb)
	local playerPed = GetPlayerPed(-1)
	local action = data.action
	local playerVeh = GetVehiclePedIsIn(playerPed, 0)

	if action == "set" then
		DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "" .. x .. "," .. y .. "," .. z .. "", "", "", "", 25)
		blockinput = true

		while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
			Citizen.Wait(1)
		end
		if UpdateOnscreenKeyboard() ~= 2 then
			local result = GetOnscreenKeyboardResult()
			local coords = stringsplit(result, ",")
			x = tonumber(coords[1]) + 0.0
			y = tonumber(coords[2]) + 0.0
			z = tonumber(coords[3]) + 0.0
			Citizen.Wait(500)
			blockinput = false
		else
			Citizen.Wait(500)
			blockinput = false
		end
	elseif action == "teleport" then
		RequestCollisionAtCoord(x, y, z)
		if IsPedInAnyVehicle(playerPed, 0) and (GetPedInVehicleSeat(playerVeh, -1) == playerPed) then
			SetEntityCoords(playerVeh, x, y, z)
		else
			SetEntityCoords(playerPed, x, y, z)
		end

		drawNotification("~g~Succesfully Teleported!")
	end
	
	cb("ok")
end)

Citizen.CreateThread(function() --IPL Removing/Requesting
	while true do
		Wait(1)
		if (IsIplActive("hei_yacht_heist") == false) then
			--Heist Yacht IPLs
			RequestIpl("hei_yacht_heist")
			RequestIpl("hei_yacht_heist_Bar")
			RequestIpl("hei_yacht_heist_Bedrm")
			RequestIpl("hei_yacht_heist_Bridge")
			RequestIpl("hei_yacht_heist_DistantLights")
			RequestIpl("hei_yacht_heist_enginrm")
			RequestIpl("hei_yacht_heist_LODLights")
			RequestIpl("hei_yacht_heist_Lounge")
			--Simeon's Showroom IPLs
			RemoveIpl("shutter_closed")
			RemoveIpl("fakeint")
			RequestIpl("v_carshowroom")
			RequestIpl("shutter_open")
			RequestIpl("shr_int")
			RequestIpl("csr_inMission")
			RequestIpl("fakeint_boards_lod")
			--FIB Building IPLs 
			RequestIpl("FIBlobbyfake")
			RequestIpl("fiblobby")
			RequestIpl("fiblobby_lod")
			RequestIpl("fib_heist_lights_lod")
			--Maze Bank Arena IPLs
			RemoveIpl("sp1_10_fake_interior")
			RequestIpl("SP1_10_real_interior")
			RequestIpl("sp1_10_real_interior_lod")
			--Fort Zancudo, Alien Camp & Mount Chilliad UFO IPL
			RequestIpl("ufo")
			RequestIpl("ufo_lod")
			RequestIpl("ufo_eye")
			--Cargo Ship IPL
			RequestIpl("cargoship")
			--Lifeinvader IPLs
			RemoveIpl("facelobbyfake")
			RequestIpl("facelobby")
			--Cluckin Bell IPLs
			RequestIpl("CS1_02_cf_onmission1")
			RequestIpl("CS1_02_cf_onmission2")
			RequestIpl("CS1_02_cf_onmission3")
			RequestIpl("CS1_02_cf_onmission4")
			RequestIpl("CS2_06_TriAf02")
			RemoveIpl("CS1_02_cf_offmission")
			--Union Deposity IPLs
			RemoveIpl("DT1_03_Gr_Closed")
			RequestIpl("FINBANK")
			RequestIpl("DT1_03_Shutter")
			--Jewerly IPLs
			RemoveIpl("bh1_16_refurb")
			RemoveIpl("jewel2fake")
			RequestIpl("post_hiest_unload")
			--Destroyed Hospital IPLs
			RemoveIpl("RC12B_Default")
			RemoveIpl("RC12B_Fixed")
			RequestIpl("RC12B_Destroyed")
			RequestIpl("RC12B_HospitalInterior")
			--The Morgue IPLs
			RequestIpl("Coroner_Int_on")
			--Fort Zancudo Gates IPLs
			RemoveIpl("cs3_07_mpgates")
			--Lester's Factory IPLs
			RequestIpl("id2_14_during_door")
			RequestIpl("id2_14_during1")
			RemoveIpl("id2_14_during2")
			RemoveIpl("id2_14_on_fire")
			RemoveIpl("id2_14_post_no_int")
			RemoveIpl("id2_14_pre_no_int")
		end
	end
end)

Citizen.CreateThread(function() --IPL Removing/Requesting (North Yankton & Heist Carrier)
	while true do
		Wait(1)
		
		local playerPed = GetPlayerPed(-1)
		local playerPedPos = GetEntityCoords(playerPed, true)
		local playerDist = Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, 4740.0, -5080.0, 107.0)
		local height
		GetWaterHeight(playerPedPos.x, playerPedPos.y, playerPedPos.z, height)
		local waterdist = Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, playerPedPos.x, playerPedPos.y, height)
		if (playerDist <= 3600.0) and (waterdist >= 77.0) then
			SetDrawMapVisible(true)
		--Removing The Heist Carrier Under North Yankton
			RemoveIpl("hei_carrier")
			RemoveIpl("hei_carrier_DistantLights")
			RemoveIpl("hei_Carrier_int1")
			RemoveIpl("hei_Carrier_int2")
			RemoveIpl("hei_Carrier_int3")
			RemoveIpl("hei_Carrier_int4")
			RemoveIpl("hei_Carrier_int5")
			RemoveIpl("hei_Carrier_int6")
			RemoveIpl("hei_carrier_LODLights")
		--Requesting The North Yankton Map
			RequestIpl("plg_01")
			RequestIpl("prologue01")
			RequestIpl("prologue01_lod")
			RequestIpl("prologue01c")
			RequestIpl("prologue01c_lod")
			RequestIpl("prologue01d")
			RequestIpl("prologue01d_lod")
			RequestIpl("prologue01e")
			RequestIpl("prologue01e_lod")
			RequestIpl("prologue01f")
			RequestIpl("prologue01f_lod")
			RequestIpl("prologue01g")
			RequestIpl("prologue01h")
			RequestIpl("prologue01h_lod")
			RequestIpl("prologue01i")
			RequestIpl("prologue01i_lod")
			RequestIpl("prologue01j")
			RequestIpl("prologue01j_lod")
			RequestIpl("prologue01k")
			RequestIpl("prologue01k_lod")
			RequestIpl("prologue01z")
			RequestIpl("prologue01z_lod")
			RequestIpl("plg_02")
			RequestIpl("prologue02")
			RequestIpl("prologue02_lod")
			RequestIpl("plg_03")
			RequestIpl("prologue03")
			RequestIpl("prologue03_lod")
			RequestIpl("prologue03b")
			RequestIpl("prologue03b_lod")
			RequestIpl("prologue03_grv_dug")
			RequestIpl("prologue03_grv_dug_lod")
			RequestIpl("prologue_grv_torch")
			RequestIpl("plg_04")
			RequestIpl("prologue04")
			RequestIpl("prologue04_lod")
			RequestIpl("prologue04b")
			RequestIpl("prologue04b_lod")
			RequestIpl("prologue04_cover")
			RequestIpl("des_protree_end")
			RequestIpl("des_protree_start")
			RequestIpl("des_protree_start_lod")
			RequestIpl("plg_05")
			RequestIpl("prologue05")
			RequestIpl("prologue05_lod")
			RequestIpl("prologue05b")
			RequestIpl("prologue05b_lod")
			RequestIpl("plg_06")
			RequestIpl("prologue06")
			RequestIpl("prologue06_lod")
			RequestIpl("prologue06b")
			RequestIpl("prologue06b_lod")
			RequestIpl("prologue06_int")
			RequestIpl("prologue06_int_lod")
			RequestIpl("prologue06_pannel")
			RequestIpl("prologue06_pannel_lod")
			RequestIpl("prologue_m2_door")
			RequestIpl("prologue_m2_door_lod")
			RequestIpl("plg_occl_00")
			RequestIpl("prologue_occl")
			RequestIpl("plg_rd")
			RequestIpl("prologuerd")
			RequestIpl("prologuerdb")
			RequestIpl("prologuerd_lod")
			RequestIpl("prologue03_grv_cov")
			RequestIpl("prologue03_grv_cov_lod")
			RequestIpl("prologue03_grv_fun")
		else
			SetDrawMapVisible(false)
		--Requesting The Heist Carrier Under North Yankton
			RequestIpl("hei_carrier")
			RequestIpl("hei_carrier_DistantLights")
			RequestIpl("hei_Carrier_int1")
			RequestIpl("hei_Carrier_int2")
			RequestIpl("hei_Carrier_int3")
			RequestIpl("hei_Carrier_int4")
			RequestIpl("hei_Carrier_int5")
			RequestIpl("hei_Carrier_int6")
			RequestIpl("hei_carrier_LODLights")
		--Removing The North Yankton Map
			RemoveIpl("plg_01")
			RemoveIpl("prologue01")
			RemoveIpl("prologue01_lod")
			RemoveIpl("prologue01c")
			RemoveIpl("prologue01c_lod")
			RemoveIpl("prologue01d")
			RemoveIpl("prologue01d_lod")
			RemoveIpl("prologue01e")
			RemoveIpl("prologue01e_lod")
			RemoveIpl("prologue01f")
			RemoveIpl("prologue01f_lod")
			RemoveIpl("prologue01g")
			RemoveIpl("prologue01h")
			RemoveIpl("prologue01h_lod")
			RemoveIpl("prologue01i")
			RemoveIpl("prologue01i_lod")
			RemoveIpl("prologue01j")
			RemoveIpl("prologue01j_lod")
			RemoveIpl("prologue01k")
			RemoveIpl("prologue01k_lod")
			RemoveIpl("prologue01z")
			RemoveIpl("prologue01z_lod")
			RemoveIpl("plg_02")
			RemoveIpl("prologue02")
			RemoveIpl("prologue02_lod")
			RemoveIpl("plg_03")
			RemoveIpl("prologue03")
			RemoveIpl("prologue03_lod")
			RemoveIpl("prologue03b")
			RemoveIpl("prologue03b_lod")
			RemoveIpl("prologue03_grv_dug")
			RemoveIpl("prologue03_grv_dug_lod")
			RemoveIpl("prologue_grv_torch")
			RemoveIpl("plg_04")
			RemoveIpl("prologue04")
			RemoveIpl("prologue04_lod")
			RemoveIpl("prologue04b")
			RemoveIpl("prologue04b_lod")
			RemoveIpl("prologue04_cover")
			RemoveIpl("des_protree_end")
			RemoveIpl("des_protree_start")
			RemoveIpl("des_protree_start_lod")
			RemoveIpl("plg_05")
			RemoveIpl("prologue05")
			RemoveIpl("prologue05_lod")
			RemoveIpl("prologue05b")
			RemoveIpl("prologue05b_lod")
			RemoveIpl("plg_06")
			RemoveIpl("prologue06")
			RemoveIpl("prologue06_lod")
			RemoveIpl("prologue06b")
			RemoveIpl("prologue06b_lod")
			RemoveIpl("prologue06_int")
			RemoveIpl("prologue06_int_lod")
			RemoveIpl("prologue06_pannel")
			RemoveIpl("prologue06_pannel_lod")
			RemoveIpl("prologue_m2_door")
			RemoveIpl("prologue_m2_door_lod")
			RemoveIpl("plg_occl_00")
			RemoveIpl("prologue_occl")
			RemoveIpl("plg_rd")
			RemoveIpl("prologuerd")
			RemoveIpl("prologuerdb")
			RemoveIpl("prologuerd_lod")
			RemoveIpl("prologue03_grv_cov")
			RemoveIpl("prologue03_grv_cov_lod")
			RemoveIpl("prologue03_grv_fun")
		end
	end
end)

Citizen.CreateThread(function() --Time Changing For Some Locations (1/3)
	while true do
		Wait(1)
		
		local playerPed = GetPlayerPed(-1)
		local playerPedPos = GetEntityCoords(playerPed, true)

		if (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, -234.0, -2001.0, 5.0) <= 23.0) or (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, -144.0, 6144.0, 33.0) <= 10.0) or (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, 97.0, -1287.0, 30.0) <= 2.0) then
			NetworkOverrideClockTime(20, 0, 0)
		end
	end
end)

Citizen.CreateThread(function() --Time Changing For Some Locations (2/3)
	while true do
		Wait(1)
		
		local playerPed = GetPlayerPed(-1)
		local playerPedPos = GetEntityCoords(playerPed, true)

		if (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, -71.0, 6266.0, 33.0) <= 10.0) or (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, 719.0, -973.0, 25.0) <= 2.0) or (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, 129.0, -1296.0, 30.0) <= 2.0) then
			NetworkOverrideClockTime(20, 0, 0)
		end
	end
end)

Citizen.CreateThread(function() --Time Changing For Some Locations (3/3)
	while true do
		Wait(1)
		
		local playerPed = GetPlayerPed(-1)
		local playerPedPos = GetEntityCoords(playerPed, true)

		if (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, -173.0, 6169.0, 33.0) <= 2.0) or (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, -629.0, -236.0, 38.0) <= 2.0) or (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, 333.0, -581.0, 43.0) <= 40.0) then
			NetworkOverrideClockTime(20, 0, 0)
		end
	end
end)

Citizen.CreateThread(function() --Time Changing For O'Neil Ranch
	while true do
		Wait(1)
		
		local playerPed = GetPlayerPed(-1)
		local playerPedPos = GetEntityCoords(playerPed, true)

		if (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, 2454.0, 4972.0, 47.0) <= 2.0) or (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, 2450.0, 4989.0, 47.0) <= 2.0) or (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, 2442.0, 4983.0, 47.0) <= 2.0) or (Vdist(playerPedPos.x, playerPedPos.y, playerPedPos.z, 2437.0, 4975.0, 47.0) <= 2.0) then
			NetworkOverrideClockTime(20, 0, 0)
		end
	end
end)

