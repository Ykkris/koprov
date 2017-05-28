local taxiveh = {
	opened = false,
	title = "Taxi Garage",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1},
	menu = {
		x = 0.11,
		y = 0.25,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
				{name = "Taxi", cost = 0, description = {}, model = "taxi"},
			}
		},
	}
}

local fakecar = {model = '', car = nil}
local boughtcar = false
local vehicle_price = 0
local isTaxi = false

RegisterNetEvent('service:receiveJob')
AddEventHandler('service:receiveJob', function(result)
	job_id = result
	if job_id == 9 then
		isTaxi = true
	end
end)

local stationGarage = {
	{x=907.280, y=-176.027, z=74.128}
}

function LocalPed()
	return GetPlayerPed(-1)
end

function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = taxiveh.currentmenu
	if this == "main" then
		TriggerServerEvent('CheckTaxiVeh',button.model)
	end
end

RegisterNetEvent('FinishTaxiCheckForVeh')
AddEventHandler('FinishTaxiCheckForVeh', function()
	boughtcar = true
	CloseVeh()
end)

function DoesPlayerHaveVehicle(model,button,y,selected)
	fakecar = {model = '', car = nil}
	taxiveh.lastmenu = taxiveh.currentmenu
	if menu == "main" then
		taxiveh.lastmenu = "main"
	end
	taxiveh.menu.from = 1
	taxiveh.menu.to = 10
	taxiveh.selectedbutton = 0
	taxiveh.currentmenu = menu 
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function isNearStationGarage()
	for i = 1, #stationGarage do
		local ply = GetPlayerPed(-1)
		local plyCoords = GetEntityCoords(ply, 0)
		local distance = GetDistanceBetweenCoords(stationGarage[i].x, stationGarage[i].y, stationGarage[i].z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
		if(distance < 30) and isTaxi then
			DrawMarker(1, stationGarage[i].x, stationGarage[i].y, stationGarage[i].z-1, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.0, 185, 169, 65, 200, 0, 0, 2, 0, 0, 0, 0)
		end
		if(distance < 2) and isTaxi then
			return true
		end
	end
end

function drawMenuTitle(txt,x,y)
local menu = taxiveh.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuButton(button,x,y,selected)
	local menu = taxiveh.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = taxiveh.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)
end

function drawMenuRight(txt,x,y,selected)
	local menu = taxiveh.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	--SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
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

function Back()
	if backlock then
		return
	end
	backlock = true
	if taxiveh.currentmenu == "main" then
		CloseVeh()
	elseif vehshop.currentmenu == "main" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
	else
		OpenMenuVeh(taxiveh.lastmenu)
	end
end

function f(n)
	return n + 0.0001
end

function LocalPed()
	return GetPlayerPed(-1)
end

function try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function OpenVeh() --OpenCreator
	boughtcar = false
	local ped = LocalPed()
	local pos = {907.280,-176.027,74.128}
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	taxiveh.currentmenu = "main"
	taxiveh.opened = true
	taxiveh.selectedbutton = 0
end

function CloseVeh() -- Close Creator
	Citizen.CreateThread(function()
		local ped = LocalPed()
		if not boughtcar then
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			local veh = GetVehiclePedIsUsing(ped)
			local model = GetEntityModel(veh)
			local colors = table.pack(GetVehicleColours(veh))
			local extra_colors = table.pack(GetVehicleExtraColours(veh))
			local plyCoords = GetEntityCoords(ped, 0)

			local mods = {}
			for i = 0,24 do
				mods[i] = GetVehicleMod(veh,i)
			end
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))

			FreezeEntityPosition(ped,false)
			RequestModel(model)
			while not HasModelLoaded(model) do
				Citizen.Wait(0)
			end
			taxivehicle = CreateVehicle(model, plyCoords["x"], plyCoords["y"], plyCoords["z"],90.0,true,false)
			SetModelAsNoLongerNeeded(model)
			--[[for i,mod in pairs(mods) do
				SetVehicleModKit(policevehicle,0)
				SetVehicleMod(policevehicle,i,mod)
			end]]
			
			SetVehicleMod(taxivehicle, 11, 2)
			SetVehicleMod(taxivehicle, 12, 2)
			SetVehicleMod(taxivehicle, 13, 2)
			-- SetVehicleEnginePowerMultiplier(policevehicle, 35.0)
			
			SetVehicleOnGroundProperly(taxivehicle)
			SetVehicleHasBeenOwnedByPlayer(taxivehicle,true)
			local id = NetworkGetNetworkIdFromEntity(taxivehicle)
			SetNetworkIdCanMigrate(id, true)
			Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(taxivehicle))
			SetVehicleColours(taxivehicle,colors[1],colors[2])
			SetVehicleExtraColours(taxivehicle,extra_colors[1],extra_colors[2])
			TaskWarpPedIntoVehicle(GetPlayerPed(-1),taxivehicle,-1)
			SetEntityVisible(ped,true)
			
			if DoesEntityExist(fakecar.car) then
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
			end
		end
		
		taxiveh.opened = false
		taxiveh.menu.from = 1
		taxiveh.menu.to = 10
	end)
end

local backlock = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(isNearStationGarage()) then
			if(taxivehicle ~= nil) then --existingVeh
				DisplayHelpText('Press ~INPUT_CONTEXT~ to store ~b~your vehicle',0,1,0.5,0.8,0.6,255,255,255,255)
			else
				DisplayHelpText('Press ~INPUT_CONTEXT~ to open the ~b~cop garage',0,1,0.5,0.8,0.6,255,255,255,255)
			end
					
			if IsControlJustPressed(1,51) then
				if(taxivehicle ~= nil) then
					SetEntityAsMissionEntity(taxivehicle, true, true)
					Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(taxivehicle))
					taxivehicle = nil
				else
					OpenVeh()
				end
			end
		end
		if GetDistanceBetweenCoords(907.280, -176.027, 74.128,GetEntityCoords(GetPlayerPed(-1))) > 5 then
			if taxiveh.opened then
				CloseVeh()
			end
		end
		if taxiveh.opened then
			local ped = LocalPed()
			local menu = taxiveh.menu[taxiveh.currentmenu]
			drawTxt(taxiveh.title,1,1,taxiveh.menu.x,taxiveh.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, taxiveh.menu.x,taxiveh.menu.y + 0.08)
			drawTxt(taxiveh.selectedbutton.."/"..tablelength(menu.buttons),0,0,taxiveh.menu.x + taxiveh.menu.width/2 - 0.0385,taxiveh.menu.y + 0.067,0.4, 255,255,255,255)
			local y = taxiveh.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= taxiveh.menu.from and i <= taxiveh.menu.to then

					if i == taxiveh.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,taxiveh.menu.x,y,selected)
					--if button.distance ~= nil then
						--drawMenuRight(button.distance.."m",policeveh.menu.x,y,selected)
					--end
					y = y + 0.04
					if taxiveh.currentmenu == "main" then
						if selected then
								if fakecar.model ~= button.model then
									if DoesEntityExist(fakecar.car) then
										Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
									end
									local ped = LocalPed()
									local plyCoords = GetEntityCoords(ped, 0)
									local hash = GetHashKey(button.model)
									RequestModel(hash)
									while not HasModelLoaded(hash) do
										Citizen.Wait(0)
										drawTxt("~b~Loading...",0,1,0.5,0.5,1.5,255,255,255,255)

									end
									local veh = CreateVehicle(hash,plyCoords["x"], plyCoords["y"], plyCoords["z"],90.0,false,false)
									while not DoesEntityExist(veh) do
										Citizen.Wait(0)
										drawTxt("~b~Loading...",0,1,0.5,0.5,1.5,255,255,255,255)
									end
									FreezeEntityPosition(veh,true)
									SetEntityInvincible(veh,true)
									SetVehicleDoorsLocked(veh,4)
									--SetEntityCollision(veh,false,false)
									TaskWarpPedIntoVehicle(LocalPed(),veh,-1)
									for i = 0,24 do
										SetVehicleModKit(veh,0)
										RemoveVehicleMod(veh,i)
									end
									fakecar = { model = button.model, car = veh}
								end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if taxiveh.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if taxiveh.selectedbutton > 1 then
					taxiveh.selectedbutton = taxiveh.selectedbutton -1
					if buttoncount > 10 and taxiveh.selectedbutton < taxiveh.menu.from then
						taxiveh.menu.from = taxiveh.menu.from -1
						taxiveh.menu.to = taxiveh.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if taxiveh.selectedbutton < buttoncount then
					taxiveh.selectedbutton = taxiveh.selectedbutton +1
					if buttoncount > 10 and taxiveh.selectedbutton > taxiveh.menu.to then
						taxiveh.menu.to = taxiveh.menu.to + 1
						taxiveh.menu.from = taxiveh.menu.from + 1
					end
				end
			end
		end

	end
end)

RegisterNetEvent('taxiveh:spawnVehicle')
AddEventHandler('taxiveh:spawnVehicle', function(v)
	local car = GetHashKey(v)
	local playerPed = GetPlayerPed(-1)
	if playerPed and playerPed ~= -1 then
		RequestModel(car)
		while not HasModelLoaded(car) do
				Citizen.Wait(0)
		end
		local playerCoords = GetEntityCoords(playerPed)

		veh = CreateVehicle(car, playerCoords, 0.0, true, false)
		TaskWarpPedIntoVehicle(playerPed, veh, -1)
		SetEntityInvincible(veh, false)
	end
end)