local Pizza = {
	opened = false,
	title = "Pizza",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 155, g = 155, b = 255, a = 200, type = 1},
}

local Pizza_locations = {
	{outsidePizza = {-844.7975,-1142.353,6.772}},
}

local Pizza_blips ={}
local inrangeofPizza = false
local inrangeofPizza3 = false
local boughtcar = false

local function LocalPed()
	return GetPlayerPed(-1)
end

function drawTxtPizza(text,font,centre,x,y,scale,r,g,b,a)
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

function IsPlayerInRangeOfPizza()
	return inrangeofPizza
end

function IsPlayerInRangeOfPizza3()
	inrangeofPizza3
end

function ShowPizzaBlips(bool)
	if bool and #Pizza_blips == 0 then
		for station,pos in pairs(Pizza_locations) do
			local loc = pos
			pos = pos.outsidePizza
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,417)
			SetBlipColour(blip, 6)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Domino's Pizza")
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(Pizza_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #Pizza_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				local inrange3 = false
				for i,b in ipairs(Pizza_blips) do
					if (clientjobID == 10) and IsPedInAnyVehicle(LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.outsidePizza[1],b.pos.outsidePizza[2],b.pos.outsidePizza[3],GetEntityCoords(LocalPed()),true) > 0 then
						DrawMarker(0,-853.2299,-1143.416,5.902624,0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
						currentlocation = b
						if GetDistanceBetweenCoords(-853.2299,-1143.416,5.902624,GetEntityCoords(LocalPed()),true) < 3 then
							ShowInfoJobPecheur("Appuyez sur ~INPUT_CONTEXT~ pour sortir un ~b~Scooter~w~.", 0)
						    inrange3 = true
						end
					end
				end
				inrangeofPizza = inrange
				inrangeofPizza = inrange3
			end
		end)
	elseif bool == false and #Pizza_blips > 0 then
		for i,b in ipairs(Pizza_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		Pizza_blips = {}
	end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1,38) and inrangeofPizza3 then
            TriggerServerEvent('CheckPizzaVehi')
			inrangeofPizza3 = false
			inrange3 = false
        end
    end
end)

onJobPizza = 0

pizza = {peds = {}, flag = {}, blip = {}, cars = {}, coords = {cx={}, cy={}, cz={}}}

function StartJob(jobid)
	if jobid == 1 then -- pizza
		showLoadingPromp("Vos pizzas chauffent.", 2000, 3)
		pizza.coords.cx[1],pizz.coords.cy[1],pizz.coords.cz[1] = -1004.788,-1154.824,1.64603
		pizza.coords.cx[2],pizz.coords.cy[2],pizz.coords.cz[2] = -1113.937,-1193.136,1.827304
		pizza.coords.cx[3],pizz.coords.cy[3],pizz.coords.cz[3] = -1075.903,-1026.452,4.031562
		pizza.coords.cx[4],pizz.coords.cy[4],pizz.coords.cz[4] = -1056.485,-1001.234,1.639098
		pizza.coords.cx[5],pizz.coords.cy[5],pizz.coords.cz[5] = -1090.886,-926.188,2.630009
		pizza.coords.cx[6],pizz.coords.cy[6],pizz.coords.cz[6] = -1075.903,-1026.452,4.031562
		pizza.coords.cx[7],pizz.coords.cy[7],pizz.coords.cz[7] = -1181.652,-988.6455,1.634243
		pizza.coords.cx[8],pizz.coords.cy[8],pizz.coords.cz[8] = -1151.11,-990.905,1.638789
		pizza.coords.cx[9],pizz.coords.cy[9],pizz.coords.cz[9] = -1022.788,-896.3149,4.908271
		pizza.coords.cx[10],pizz.coords.cy[10],pizz.coords.cz[10] = -1060.738,-826.829,18.69866
		pizza.coords.cx[11],pizz.coords.cy[11],pizz.coords.cz[11] = -968.6487,-1329.453,5.144861
		pizza.coords.cx[12],pizz.coords.cy[12],pizz.coords.cz[12] = -1185.5,-1386.238,4.112149
		pizza.coords.cx[13],pizz.coords.cy[13],pizz.coords.cz[13] = -1132.848,-1456.029,4.372081
		pizza.coords.cx[14],pizz.coords.cy[14],pizz.coords.cz[14] = -1125.602,-1544.203,5.391256
		pizza.coords.cx[15],pizz.coords.cy[15],pizz.coords.cz[15] = -1084.74,-1558.709,4.10145
		pizza.coords.cx[16],pizz.coords.cy[16],pizz.coords.cz[16] = -1098.367,-1679.272,3.853804
		pizza.coords.cx[17],pizz.coords.cy[17],pizz.coords.cz[17] = -1155.863,-1574.202,8.344403
		pizza.coords.cx[18],pizz.coords.cy[18],pizz.coords.cz[18] = -1122.675,-1557.524,5.277201
		pizza.coords.cx[19],pizz.coords.cy[19],pizz.coords.cz[19] = -1108.679,-1527.393,6.265457
		pizza.coords.cx[20],pizz.coords.cy[20],pizz.coords.cz[20] = -1273.549,-1382.664,3.81341
		pizza.coords.cx[21],pizz.coords.cy[21],pizz.coords.cz[21] = -1342.454,-1234.849,5.420023
		pizza.coords.cx[22],pizz.coords.cy[22],pizz.coords.cz[22] = -1351.21,-1128.669,3.626104
		pizza.coords.cx[23],pizz.coords.cy[23],pizz.coords.cz[23] = -1343.232,-1043.639,7.303696
		pizza.coords.cx[24],pizz.coords.cy[24],pizz.coords.cz[24] = -729.2556,-880.1547,22.22747
		pizza.coords.cx[25],pizz.coords.cy[25],pizz.coords.cz[25] = -831.3006,-864.8558,20.22383
		pizza.coords.cx[26],pizz.coords.cy[26],pizz.coords.cz[26] = -810.4093,-978.4364,13.74061
		pizza.coords.cx[27],pizz.coords.cy[27],pizz.coords.cz[27] = -683.8874,-876.8568,24.02004
		pizza.coords.cx[28],pizz.coords.cy[28],pizz.coords.cz[28] = -1031.316,-903.0217,3.692086
		pizza.coords.cx[29],pizz.coords.cy[29],pizz.coords.cz[29] = -1262.703,-1123.342,7.092357
		pizza.coords.cx[30],pizz.coords.cy[30],pizz.coords.cz[30] = -1225.079,-1208.524,7.619214
		pizza.coords.cx[31],pizz.coords.cy[31],pizz.coords.cz[31] = -1207.095,-1263.851,6.378308
		pizza.coords.cx[32],pizz.coords.cy[32],pizz.coords.cz[32] = -1086.787,-1278.122,5.09411
		pizza.coords.cx[33],pizz.coords.cy[33],pizz.coords.cz[33] = -886.1298,-1232.698,5.006698
		pizza.coords.cx[34],pizz.coords.cy[34],pizz.coords.cz[34] = -753.5927,-1512.016,4.370816
		pizza.coords.cx[35],pizz.coords.cy[35],pizz.coords.cz[35] = -696.3545,-1386.89,4.846177
		pizza.veh[1] = GetVehiclePedIsUsing(GetPlayerPed(-1))
		pizza.flag[1] = 1
		pizza.flag[2] = 34+GetRandomIntInRange(1, 35)
		Wait(2000)
		DrawMissionTextPizza("Conduisez et allez livrer les ~h~~y~Pizza~w~.", 10000)
		onJobPizza = 1
	end
end

function DrawMissionTextPizza(m_text, showtime)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function showLoadingPrompPizza(showText, showTime, showType)
	Citizen.CreateThread(function()
		Citizen.Wait(0)
		N_0xaba17d7ce615adbf("STRING")
		AddTextComponentString(showText)
		N_0xbd12f8228410d9b4(showType)
		Citizen.Wait(showTime)
		N_0x10d373323e5b9c0d()
	end)
end

function ShowInfoJobPizza(text, state)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

function StopJobPizza(jobid)
	if jobid == 1 then
		if pizza.blip[1] ~= nil and DoesBlipExist(pizza.blip[1]) then
			Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(pizz.blip[1]))
			pizza.blip[1] = nil 
		end
		onJobPizza = 0
		pizza.veh[1] = nil
		pizza.flag[1] = nil
		pizza.flag[2] = nil
	end
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if onJobPizza == 0 then
			if (clientjobID == 10) then
				if IsPedIsSittingInAnyVehicle(GetPlayerPed(-1)) then
					if IsVehicleModel(GetVehiclePedIsUsing(GetPlayerPed(-1)), GetHashKey("faggio2", _r)) then
						StartJobPizza(1)
					end
				end
			end
		elseif onJobPizza == 1 then
			if DoesEntityExist(pizza.veh[1]) and IsVehicleDriveable(pizza.veh[1], 0) then

				if pizza.flag[1] == 1 then
					pizza.flag[2] = GetRandomIntInRange(1, 34)
					pizza.blip[1] = AddBlipForCoord(pizza.coords.cx[pizza.flag[2]], pizza.coords.cy[pizza.flag[2]], pizza.coords.cz[pizza.flag[2]])
					N_0x80ead8e2e1d5d52e(pizz.blip[1])
					SetBlipRoute(pizza.blip[1], 1)
					pizza.flag[1] = 2
				end
				if pizza.flag[1] == 2 then
					if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), pizza.coords.cx[pizza.flag[2]], pizza.coords.cy[pizza.flag[2]], pizza.coords.cz[pizza.flag[2]], true) > 2.0001 then
						DrawMarker(1, pizza.coords.cx[pizza.flag[2]], pizza.coords.cy[pizza.flag[2]], pizz.coords.cz[pizz.flag[2]]-1.0001, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
					else
						if pizza.blip[1] ~= nil and DoesBlipExist(pizza.blip[1]) then
							Citizen.InokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(pizza.blip[1]))
							pizza.blip[1] = nil
						end
					if IsPedInAnyVehicle(LocalPed(), true) == false then
						ShowInfoJobPizza("Appuyez sur ~INPUT_CONTEXT~ pour ~b~livrer~w~ la pizza.", 0)
						if IsControlJustPressed(1, 38) then

							DrawMissionTextPizza("~h~Vous avez ~g~livrer~w~ une pizza !", 5000)
							TriggerServerEvent('pizza:getpaid')
							pizza.flag[1] = 1
							pizza.flag[2] = 34+GetRandomIntInRange(1, 35)
						end
					end
				end

				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(pizz.veh[1]), true) > 50.0001 then
					StopJobPizza(1)
				else

				end

			else
				StopJobPizza(1)
				DrawMissionTextPizza("Votre scooter est ~h~~r~cassé~w~.", 5000)
			end
		end
	end
end) 