local medicveh = {
	opened = false,
	title = "Garage",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 }, -- ???
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
				{name = "Ambulance", costs = 0, description = {}, model = "ambulance"},
				{name = "Huntley", costs = 0, description = {}, model = "huntley"},
				{name = "Banalisé", costs = 0, description = {}, model = "fbi"},
			}
		},
	}
}

local fakecar = {model = '', car = nil}
local boughtcar = false
local vehicle_price = 0

local stationGarage = {
	{x=406.871, y=-1427.79, z=29.4387}
}

function LocalPed()
	return GetPlayerPed(-1)
end

-------------------------------------------------
----------------CONFIG SELECTION----------------
-------------------------------------------------
function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = medicveh.currentmenu
	if this == "main" then
		TriggerServerEvent('CheckMedicVeh',button.model)
	end
end
-------------------------------------------------
------------------FINISH AND CLOSE---------------
-------------------------------------------------
RegisterNetEvent('FinishMedicCheckForVeh')
AddEventHandler('FinishMedicCheckForVeh', function()
	boughtcar = true
	CloseVeh()
end)
-------------------------------------------------
-------------------PLAYER HAVE VEH---------------
-------------------------------------------------
function DoesPlayerHaveVehicle(model,button,y,selected)
		local t = false
		--TODO:check if player own car
		if t then
			drawMenuRight("OWNED",medicveh.menu.x,y,selected)
		end
end
-------------------------------------------------
----------------CONFIG OPEN MENU-----------------
-------------------------------------------------
function OpenMenuVeh(menu)
	fakecar = {model = '', car = nil}
	medicveh.lastmenu = medicveh.currentmenu
	if menu == "main" then
		medicveh.lastmenu = "main"
	end
	medicveh.menu.from = 1
	medicveh.menu.to = 10
	medicveh.selectedbutton = 0
	medicveh.currentmenu = menu
end
-------------------------------------------------
----------------IS NEAR-----------------
-------------------------------------------------
function isNearStationGarage()
	for i = 1, #stationGarage do
		local ply = GetPlayerPed(-1)
		local plyCoords = GetEntityCoords(ply, 0)
		local distance = GetDistanceBetweenCoords(stationGarage[i].x, stationGarage[i].y, stationGarage[i].z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
		if(distance < 30) then
			DrawMarker(1, stationGarage[i].x, stationGarage[i].y, stationGarage[i].z-1, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.0, 185, 169, 65, 200, 0, 0, 2, 0, 0, 0, 0)
		end
		if(distance < 2) then
			return true
		end
	end
end
-------------------------------------------------
------------------DRAW NOTIFY--------------------
-------------------------------------------------
function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
-------------------------------------------------
------------------DRAW TITLE MENU----------------
-------------------------------------------------
function drawMenuTitle(txt,x,y)
local menu = medicveh.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
-------------------------------------------------
------------------DRAW MENU BOUTON---------------
-------------------------------------------------
function drawMenuButton(button,x,y,selected)
	local menu = medicveh.menu
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
-------------------------------------------------
------------------DRAW MENU INFO-----------------
-------------------------------------------------
function drawMenuInfo(text)
	local menu = medicveh.menu
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
-------------------------------------------------
----------------DRAW MENU DROIT------------------
-------------------------------------------------
function drawMenuRight(txt,x,y,selected)
	local menu = medicveh.menu
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
-------------------------------------------------
-------------------DRAW TEXT---------------------
-------------------------------------------------
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
-------------------------------------------------
----------------CONFIG BACK MENU-----------------
-------------------------------------------------
function Back()
	if backlock then
		return
	end
	backlock = true
	if medicveh.currentmenu == "main" then
		CloseVeh()
	elseif vehshop.currentmenu == "main" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
	else
		OpenMenuVeh(medicveh.lastmenu)
	end
end
-------------------------------------------------
----------------FONCTION ???????-----------------
-------------------------------------------------
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
-------------------------------------------------
----------------FONCTION OPEN--------------------
-------------------------------------------------
function OpenVeh() --OpenCreator
	boughtcar = false
	local ped = LocalPed()
	local pos = {406.871,-1427.79,29.4387}
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	medicveh.currentmenu = "main"
	medicveh.opened = true
	medicveh.selectedbutton = 0
end
-------------------------------------------------
----------------FONCTION CLOSE-------------------
-------------------------------------------------
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
			medicvehicle = CreateVehicle(model, plyCoords["x"], plyCoords["y"], plyCoords["z"],90.0,true,false)
			SetModelAsNoLongerNeeded(model)
			--[[for i,mod in pairs(mods) do
				SetVehicleModKit(medicvehicle,0)
				SetVehicleMod(medicvehicle,i,mod)
			end]]
			
			SetVehicleMod(medicvehicle, 11, 2)
			SetVehicleMod(medicvehicle, 12, 2)
			SetVehicleMod(medicvehicle, 13, 2)
			SetVehicleEnginePowerMultiplier(medicvehicle, 10.0)
			
			SetVehicleOnGroundProperly(medicvehicle)
			SetVehicleHasBeenOwnedByPlayer(medicvehicle,true)
			local id = NetworkGetNetworkIdFromEntity(medicvehicle)
			SetNetworkIdCanMigrate(id, true)
			Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(medicvehicle))
			SetVehicleColours(medicvehicle,colors[1],colors[2])
			SetVehicleExtraColours(medicvehicle,extra_colors[1],extra_colors[2])
			TaskWarpPedIntoVehicle(GetPlayerPed(-1),medicvehicle,-1)
			SetEntityVisible(ped,true)
			
			if DoesEntityExist(fakecar.car) then
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
			end
		end
		
		medicveh.opened = false
		medicveh.menu.from = 1
		medicveh.menu.to = 10
	end)
end
-------------------------------------------------
----------------FONCTION OPEN MENU---------------
-------------------------------------------------
local backlock = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(isNearStationGarage()) then
			if(medicvehicle ~= nil) then --existingVeh
				DisplayHelpText('Press ~INPUT_CONTEXT~ to store ~b~your vehicle',0,1,0.5,0.8,0.6,255,255,255,255)
			else
				DisplayHelpText('Press ~INPUT_CONTEXT~ to open the ~b~tow garage',0,1,0.5,0.8,0.6,255,255,255,255)
			end
					
			if IsControlJustPressed(1,51) then
				if(medicvehicle ~= nil) then
					SetEntityAsMissionEntity(medicvehicle, true, true)
					Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(medicvehicle))
					medicvehicle = nil
				else
					OpenVeh()
				end
			end
		end
		if GetDistanceBetweenCoords(406.871, -1427.79, 29.4387,GetEntityCoords(GetPlayerPed(-1))) > 5 then
			if medicveh.opened then
				CloseVeh()
			end
		end
		if medicveh.opened then
			local ped = LocalPed()
			local menu = medicveh.menu[medicveh.currentmenu]
			drawTxt(medicveh.title,1,1,medicveh.menu.x,medicveh.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, medicveh.menu.x,medicveh.menu.y + 0.08)
			drawTxt(medicveh.selectedbutton.."/"..tablelength(menu.buttons),0,0,medicveh.menu.x + medicveh.menu.width/2 - 0.0385,medicveh.menu.y + 0.067,0.4, 255,255,255,255)
			local y = medicveh.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= medicveh.menu.from and i <= medicveh.menu.to then

					if i == medicveh.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,medicveh.menu.x,y,selected)
					--if button.distance ~= nil then
						--drawMenuRight(button.distance.."m",medicveh.menu.x,y,selected)
					--end
					y = y + 0.04
					if medicveh.currentmenu == "main" then
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
									SetEntityCollision(veh,false,false)
									-- TaskWarpPedIntoVehicle(LocalPed(),veh,-1)
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
		if medicveh.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,27) then
				if medicveh.selectedbutton > 1 then
					medicveh.selectedbutton = medicveh.selectedbutton -1
					if buttoncount > 10 and medicveh.selectedbutton < medicveh.menu.from then
						medicveh.menu.from = medicveh.menu.from -1
						medicveh.menu.to = medicveh.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,173)then
				if medicveh.selectedbutton < buttoncount then
					medicveh.selectedbutton = medicveh.selectedbutton +1
					if buttoncount > 10 and medicveh.selectedbutton > medicveh.menu.to then
						medicveh.menu.to = medicveh.menu.to + 1
						medicveh.menu.from = medicveh.menu.from + 1
					end
				end
			end
		end

	end
end)
---------------------------------------------------
------------------EVENT SPAWN VEH------------------
---------------------------------------------------
RegisterNetEvent('medicveh:spawnVehicle')
AddEventHandler('medicveh:spawnVehicle', function(v)
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