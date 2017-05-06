-- This is Koprov team proprety. --
-- You can use it, share it and modify it BUT you're not allowed to make benefit with it. --
-- Contact us for more informations at koprov.fr --
-- RegisterNetEvent('veh:rcheckveh')
local vehshop = {
	opened = false,
	title = "Gestion de la voiture",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.9,
		y = 0.08,
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
				{name = "Gérer les portes", description = ""},
				{name = "Limitateur de vitesse", description = ""},
				{name = "Eteindre le moteur", description = ""},
			}
		},
		["portes"] = {  -- avant vehicles
			title = "Gestion des portes", 
			name = "Gérer les portes",
			buttons = { 
				{name = "Coffre", description = ''},
				{name = "Capot", description = ''},
				{name = "Avant gauche", description = ''},
				{name = "Avant droite", description = ''},
				{name = "Arrière gauche", description = ''},
				{name = "Arrière droite", description = ''},
			}
		},
		["limitateur"] = {
			title = "Limitateur", 
			name = "Limitateur de vitesse",
			buttons = { 
				{name = "10", description = ''},
				{name = "30", description = ''},
				{name = "50", description = ''},
				{name = "70", description = ''},
				{name = "90", description = ''},
				{name = "110", description = ''},
			}
		},
		["moteur"] = {
			title = "Eteindre le moteur", 
			name = "Eteindre le moteur",
			buttons = { 
				{name = "Put this off", description = ''},
			}
		},
	}
}



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

function OpenCreator()		

	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0

end
function CloseCreator()
	Citizen.CreateThread(function()
		local ped = LocalPed()
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
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
	local menu = vehshop.menu
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
	local menu = vehshop.menu
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
local menu = vehshop.menu
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
		if (IsControlJustPressed(1,182)) then -- change to IsPlayerInCar
			if vehshop.opened then
				CloseCreator()
			end
			local player = PlayerId()	
			local playerVeh = nil
			local playerVeh = GetVehiclePedIsIn(player, true)
			if playerVeh ~= nil then
					OpenCreator()
			end
		end
		if vehshop.opened then
			local ped = LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			drawTxt(vehshop.selectedbutton.."/"..tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false
			
			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then
					
					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,vehshop.menu.x,y,selected)

					
					y = y + 0.04
					
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end	
		end
		if vehshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
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


-- main : portes / limitateur 


function ButtonSelected(button)
	Citizen.Trace(tostring(button.name))
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu -- menu
	local btn = button.name --Gerer les portes
	if this == "main" then
		if btn == "Gérer les portes" then
			OpenMenu('portes')
		elseif btn == "Limitateur de vitesse" then
			OpenMenu('limitateur')
		elseif btn == "Eteindre le moteur" then
			OpenMenu('moteur')
		end
	elseif this == "Gérer les portes" then
		if btn == "Coffre" then
			OpenDoor('Coffre')
		elseif btn == "Capot" then
			OpenDoor('Capot')
		elseif btn == "Avant gauche" then
			OpenDoor('Avant gauche')
		elseif btn == "Avant Droite" then
			OpenDoor('Avant Droite')
		elseif btn == "Arrière gauche" then
			OpenDoor("Arrière gauche")
		elseif btn == "Arrière droite" then
			OpenDoor('Arrière droite')
		end
	elseif this == "Limitateur de vitesse" then
		if btn == "10" then
			OpenLimitator('10')
		elseif btn == "30" then
			OpenLimitator('30')
		elseif btn == "50" then
			OpenLimitator('50')
		elseif btn == "70" then
			OpenLimitator('70')
		elseif btn == "90" then
			OpenLimitator("90")
		elseif btn == "110" then
			OpenLimitator('110')
		end

	end
end

function OpenMenu(menu)
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "portes" then
		vehshop.lastmenu = "main"
	elseif menu == "limitateur"  then
		vehshop.lastmenu = "main"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu	
end


function Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		CloseCreator()
	elseif vehshop.currentmenu ~= "main" then
		OpenMenu(vehshop.lastmenu)
	else
		OpenMenu(vehshop.lastmenu)
	end
	
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end


--AddEventHandler('veh:rcheckveh', function(veh, playerGotThisVeh, running)
--  isrunning = running
--  isyourcar = playerGotThisVeh
-- end)
