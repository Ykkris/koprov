RegisterNetEvent('four:RemoveVehicle')
RegisterNetEvent('four:DisplayVehicles')
RegisterNetEvent('four:enteredVehicle')

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

local four = {
	opened = false,
	title = "four",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.9,
		y = 0.2,
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
				{name = "Sortir ton véhicule", description = "", action = "sortir"},
			}
    	},
  	}
}

local fakecar = {model = '', car = nil}
local four_locations = {{
entering = {402.459,-1633.436,29.291}, -- point de spawn 
outside = {409.284, -1622.797,29.291} -- ouverture du menu

}}


local four_blips ={}
local inrangeoffour = false
local currentlocation = nil
local boughtcar = false

local function LocalPed()
	return GetPlayerPed(-1)
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

function IsPlayerInRangeOfFour()
	return inrangeofFour
end

function ShowFourBlips(bool)
	if bool and #four_blips == 0 then
		for station,pos in pairs(four_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			SetBlipSprite(blip,357)
			SetBlipColour(blip, 3)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Fourrière')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(four_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #four_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(four_blips) do
					DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
					if GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 2 then
						drawTxt('Appuie sur ~g~Entrée~s~ ouvrir le menu',0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inrange = true
					end
				end
				inrangeoffour = inrange
			end
		end)
		Citizen.CreateThread(function()
			while #four_blips > 0 do
				Citizen.Wait(0)
				local inrange = true
				for i,b in ipairs(four_blips) do
					DrawMarker(1,b.pos.outside[1],b.pos.outside[2],b.pos.outside[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
					if GetDistanceBetweenCoords(b.pos.outside[1],b.pos.outside[2],b.pos.outside[3],GetEntityCoords(LocalPed())) < 4 then
						drawTxt('Sortie de fourrière, ne pas encombrer inutilement.',0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inrange = true
					end
				end
				inrangeoffour = inrange
			end
		end)
		Citizen.CreateThread(function()
			while #four_blips > 0 do
				Citizen.Wait(0)
				local inrange = true
				for i,b in ipairs(four_blips) do
					DrawMarker(1,b.pos.outside[1],b.pos.outside[2],b.pos.outside[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
					if GetDistanceBetweenCoords(b.pos.outside[1],b.pos.outside[2],b.pos.outside[3],GetEntityCoords(LocalPed())) < 5 then
						drawTxt('',0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inrange = true
					end
				end
				inrangeoffour = inrange
			end
		end)
	elseif bool == false and #four_blips > 0 then
		for i,b in ipairs(four_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		four_blips = {}
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


function CheckForVehicle() 
	Citizen.CreateThread(function()		
		Citizen.Wait(500)
		local caissei = GetVehiclePedIsIn(PlayerPedId(), 1)
		SetEntityAsMissionEntity(caissei, true, true)		
		local platecaissei = GetVehicleNumberPlateText(caissei)
		if DoesEntityExist(caissei) then
				TriggerServerEvent('fours:SetVehIn', platecaissei)
		end   
	end)
end

function OpenCreator()
	boughtcar = false
	local ped = LocalPed()
	local pos = currentlocation.pos.outside
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	four.currentmenu = "main"
	four.opened = true
	four.selectedbutton = 0
end

local vehicle_price = 0

function CloseCreator()
	Citizen.CreateThread(function()
		four.opened = false
		four.menu.from = 1
		four.menu.to = 10
	end)
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function OpenVehicles()
	local ped = LocalPed()
	local pos = currentlocation.pos.outside
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	four.currentmenu = "list"
	four.opened = true
	four.selectedbutton = 0
end

function drawMenuButton(button,x,y,selected)
	local menu = four.menu
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
	local menu = four.menu
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
	local menu = four.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
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

function drawMenuTitle(txt,x,y)
	local menu = four.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do 
		count = count + 1 
	end
	return count
end

function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function DoesPlayerHaveVehicle(model,button,y,selected)
	local t = false
		if t then
		drawMenuRight("OWNED",four.menu.x,y,selected)
	else
		drawMenuRight(button.costs.."$",four.menu.x,y,selected)
	end
end

local backlock = false
	Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
			if IsControlJustPressed(1,201) and IsPlayerInRangeOfFour() then
				if four.opened then
					CloseCreator()
				else
					OpenCreator()
				end
			end   
		if four.opened then
			local ped = LocalPed()
			local menu = four.menu[four.currentmenu]
			drawTxt(four.title,1,1,four.menu.x,four.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, four.menu.x,four.menu.y + 0.08)
			drawTxt(four.selectedbutton.."/"..tablelength(menu.buttons),0,0,four.menu.x + four.menu.width/2 - 0.0385,four.menu.y + 0.067,0.4, 255,255,255,255)
			local y = four.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false
			for i,button in pairs(menu.buttons) do
				if i >= four.menu.from and i <= four.menu.to then
					if i == four.selectedbutton then
						selected = true
					else
						selected = false
					end
				drawMenuButton(button,four.menu.x,y,selected)
				y = y + 0.04
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if four.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if four.selectedbutton > 1 then
					four.selectedbutton = four.selectedbutton -1
					if buttoncount > 10 and four.selectedbutton < four.menu.from then
						four.menu.from = four.menu.from -1
						four.menu.to = four.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if four.selectedbutton < buttoncount then
					four.selectedbutton = four.selectedbutton +1
					if buttoncount > 10 and four.selectedbutton > four.menu.to then
						four.menu.to = four.menu.to + 1
						four.menu.from = four.menu.from + 1
					end
				end
			end
		end
	end
end)




function round(num, idp)
	if idp and idp>0 then
		local mult = 10^idp
		return math.floor(num * mult + 0.5) / mult
	end
	return math.floor(num + 0.5)
end

function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = four.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Sortir ton véhicule" then
			TriggerServerEvent('fours:GetPlayerVehs',source)
			--TriggerServerEvent('fours:CheckForSpawnVeh',source)
		end
	elseif this == "list" then
		four.currentmenu = "main"
		four.opened = false
		SpawnVehicle(button.model, button.plate, button.state, button.primarycolor, button.secondarycolor)
	end
end

function OpenMenu(menu)
	fakecar = {model = '', car = nil}
	four.lastmenu = four.currentmenu
	if menu == "vehicles" then
		four.lastmenu = "main"
	elseif menu == "bikes"  then
		four.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		four.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		four.lastmenu = "race_create_objects"
	end
	four.menu.from = 1
	four.menu.to = 10
	four.selectedbutton = 0
	four.currentmenu = menu
end


function Back()
	if backlock then
		return
	end
	backlock = true
	if four.currentmenu == "main" then
		CloseCreator()
	elseif four.currentmenu == "list" then
		four.currentmenu = "main"
	end
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function SpawnVehicle(vehicle, plate, state, primarycolor, secondarycolor)
	local myPed = GetPlayerPed(-1)
	local car = GetHashKey(vehicle)
	local plate = plate
	local state = state
	local primarycolor = primarycolor
	local secondarycolor = secondarycolor
	Citizen.CreateThread(function()			
		Citizen.Wait(1000)
		local caisseo = GetClosestVehicle(409.284, -1622.797,29.291, 3.000, 0, 70)
		if DoesEntityExist(caisseo) then
			drawNotification("La zone est ~r~encombré~w~") 
		else
			if state == "out" then
				drawNotification("Ce véhicule n'est pas dans la fourrière")
			else	
				RequestModel(car)
				while not HasModelLoaded(car) do
					Citizen.Wait(0)
				end
				veh = CreateVehicle(car, 409.284, -1622.797,29.291, 0.0, true, false)
				SetVehicleNumberPlateText(veh, plate)
				SetEntityAsMissionEntity(veh, true, true)
				SetVehicleHasBeenOwnedByPlayer(veh, myPed)
				SetVehicleOnGroundProperly(veh)
				SetVehicleColours(veh, primarycolor, secondarycolor)
				SetEntityInvincible(veh, false) 
				drawNotification("Véhicule ~g~sorti~w~, bonne route!")				
				TriggerServerEvent('fours:SetVehOut', plate)
			end   
			CloseCreator()
		end
	end)
end

local firstspawn = 0
	AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		ShowfourBlips(true)
		firstspawn = 1
	end
end)

AddEventHandler('fours:RemoveVehicle', function(found, plate, cassei)
	if found == false then
		--pas vehicule
	else
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			local present = true
			while present do
				local car = GetPlayersLastVehicle()
				Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(car))
				Citizen.Wait(500)
				local test_car = GetPlayersLastVehicle()
				test_plate = GetVehicleNumberPlateText(test_car)
				if plate ~= test_plate then
					present = false
				end
			end
				--Citizen.Wait(500)
				--car = GetClosestVehicle(215.124, -791.377, 30.836, 3.000, 0, 70)
			--end
			--SetEntityAsMissionEntity(caissei, true, true)
			--Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(caissei))
			--TriggerServerEvent('fours:SetVehIn', plate)
			--else
			--	drawNotification("Aucun véhicule n'est sur la zone")
			--end   
		end)
	end
end)

AddEventHandler('fours:DisplayVehicles', function(buttons)

	local list = { 
		title = "VEHICLES",
		name = "list",
		buttons = buttons
	}

   	four.menu["list"] = list
    if buttons[1] == nil then
    	drawNotification("Vous n'avez aucun véhicule a la fourrière")
    else
    	OpenVehicles()
    end

end)

-- When entering a vehicle, sets the vehicle as mission entity to prevent it from disappear
AddEventHandler('four:enteredVehicle', function(data)

	local car = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	if car then
        SetVehicleHasBeenOwnedByPlayer(car, GetPlayerPed(-1))
 	end
end)