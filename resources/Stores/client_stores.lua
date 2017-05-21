local foodstore = {
	opened = false,
	title = "Superette",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = {r = 0, g = 155, b = 255, a = 200, type = 1},
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
			title = "Categories",
			name = "main",
			buttons = {
				{title = "Acheter vivres", name = "Acheter", description = ""},
				{title = "Vendre vivres", name = "Vendre", description = ""},
			}
		},
		["Acheter"] = {
			title = "Acheter vivres",
			name = "Acheter",
			buttons = {
				{title = "Bouteille d'eau", name = "Eau", costs = 10, description = {}},
				{title = "Sandwich", name = "Sandwich", costs = 15},
			}
		},
		["Vendre"] = {
			title = "Vendre vivres",
			name = "Vendre",
			buttons = {

			}
		},
	}
}

local stores_locations = {
	{ entering = {25.647,-1344.672,28.497}, inside = {25.647,-1344.672,29.497}, outside = {25.647,-1344.672,29.497} },
}

local stores_blips = {}
local inrangeofstores = false
local currentlocation = nil
local boughtVivre = false

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

function IsPlayerInRangeOfstores()
	return inrangeofstores
end

function ShowStoresBlips(bool)
	if bool and #stores_blips == 0 then
		for station,pos in pairs(stores_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])

			SetBlipSprite(blip,52)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Superette')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(stores_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #stores_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(stores_blips) do
					if IsPlayerWantedLevelGreater(GetPlayerIndex(),0) == false and foodstore.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false and GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 10 then
						DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
						if GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 2 then
							drawTxt('Appuyez sur ~g~ENTRER~s~ pour acheter des ~b~vivres',0,1,0.5,0.8,0.6,255,255,255,255)
							currentlocation = b
							inrange = true
						end
					end
				end
				inrangeofstores = inrange
			end
		end)
	elseif bool == false and #stores_blips > 0 then
		for i,b in ipairs(stores_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		stores_blips = {}
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
	return (str:gsub("^$1", string.upper))
end

function OpenCreator()
	boughtVivre = false
	local ped = GetPlayerPed(-1)
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped, true)
	SetEntityVisible(ped, false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2], g)
	SetEntityHeading(ped,pos[4])
	foodstore.currentmenu = "main"
	foodstore.opened = true
	foodstore.selectedbutton = 0
end

function CloseCreator()
	Citizen.CreateThread(function()
		local ped = GetPlayerPed(-1)
		if not boughtVivre then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped, false)
			SetEntityVisible(ped, true)
			foodstore.opened = false
			foodstore.menu.from = 1
			foodstore.menu.to = 10
		else
			local pos = currentlocation.pos.entering
		end
	end)
end

function drawMenuButton(button,x,y,selected)
	local menu = foodstore.menu
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
	AddTextComponentString(button.title)
	if selected then
		DrawRect(x, y, menu.width, menu.height, 255, 255, 255, 255)
	else
		DrawRect(x, y, menu.width, menu.height, 0, 0, 0, 150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuRight(txt,x,y,selected)
	local menu = foodstore.menu
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
local menu = foodstore.menu
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
  for _ in pairs(T) do count = count + 1 end
  return count
end

function Notify(text)
SetNotificationTextEntry('STRING')
AddTextComponentString(text)
DrawNotification(false, false)
end

local backlock = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and IsPlayerInRangeOfstores() then
			if foodstore.opened then
				CloseCreator()
			else
				OpenCreator()
			end
		end
		if foodstore.opened then
			local ped = LocalPed()
			local menu = foodstore.menu[foodstore.currentmenu]
			drawTxt(foodstore.title,1,1,foodstore.menu.x, foodstore.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, foodstore.menu.x,foodstore.menu.y + 0.08)
			drawTxt(foodstore.selectedbutton.."/"..tablelength(menu.buttons),0,0,foodstore.menu.x + foodstore.menu.width/2 - 0.0385,foodstore.menu.y + 0.067,0.4, 255,255,255,255)
			local y = foodstore.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= foodstore.menu.from and i <= foodstore.menu.to then

					if i == foodstore.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,foodstore.menu.x,y,selected)
					if button.costs ~= nil then
					end
					y = y + 0.04
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if foodstore.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustPressed(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if foodstore.selectedbutton > 1 then
					foodstore.selectedbutton = foodstore.selectedbutton -1
					if buttoncount > 10 and foodstore.selectedbutton < foodstore.menu.from then
						foodstore.menu.from = foodstore.menu.from -1
						foodstore.menu.to = foodstore.menu.to -1
					end
				end
			end
			if IsControlJustPressed(1,187) then
				if foodstore.selectedbutton < buttoncount then
					foodstore.selectedbutton = foodstore.selectedbutton +1
					if buttoncount > 10 and foodstore.selectedbutton > foodstore.menu.to then
						foodstore.menu.to = foodstore.menu.to + 1
						foodstore.menu.from = foodstore.menu.from + 1
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
	local this = foodstore.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Acheter" then
			OpenMenu('Acheter')
		elseif btn == "Vendre" then
			OpenMenu('Vendre')
		end
	else
		TriggerServerEvent('CheckMoneyForFood',button.model,button.costs)
	end
end

RegisterNetEvent('FinishMoneyCheckForFood')
AddEventHandler('FinishMoneyCheckForFood', function()
	boughtVivre = true
	CloseCreator()
end)

function OpenMenu(menu)
	foodstore.lastmenu = foodstore.currentmenu
	foodstore.menu.from = 1
	foodstore.menu.to = 10
	foodstore.selectedbutton = 0
	foodstore.currentmenu = menu
end

function Back()
	if backlock then
		return
	end
	backlock = true
	if foodstore.currentmenu == "main" then
		boughtVivre = false
		CloseCreator()
	else
		OpenMenu(foodstore.lastmenu)
	end
end

function stringstarts(String,Start)
	return string.sub(String,1,string.len(Start)) ==Start
end

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		ShowStoresBlips(true)
		firstspawn = 1
	end
	TriggerServerEvent("foodstore:playerSpawned", spawn)
end)

RegisterNetEvent('giveFood')
AddEventHandler('giveFood', function(name, delay)
	Citizen.CreateThread(function()
		local food = --id dans bdd
		Wait(delay)
		GiveFoodToPed(GetPlayerPed(-1), food, 1000, 0, false)
	end)
end)