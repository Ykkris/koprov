-- This is Koprov team proprety. --
-- You can use it, share it and modify it BUT you're not allowed to make benefit with it. --
-- Contact us for more informations at koprov.fr --
-- RegisterNetEvent('veh:rcheckveh')

limitator = false
engine = true
isCop = true --------------- A ENLEVER

AddEventHandler("playerSpawned", function()
	TriggerServerEvent("police:checkIsCop")
end)

RegisterNetEvent('police:receiveIsCop')
AddEventHandler('police:receiveIsCop', function(result)
	if(result == "inconnu") then
		isCop = false
	else
		isCop = true
		rank = result
	end
end)

local vehshop = {
	opened = false,
	title = "Telephone",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 231, g = 76, b = 60, a = 255, type = 1 },
	menu = {
		x = 0.1,
		y = 0.15,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "Telephone", 
			name = "main",
			buttons = { 
				{name = "Telephone", description = ""},
				{name = "Emotes", description = ""},
				{name = "Carte d'identite", description = ""},
				{name = "Police", description = ""}
			}
		},
		["Telephone"] = {  -- avant vehicles
			title = "Telephone", 
			name = "Telephone",
			buttons = { 
				{name = "Repertoire", description = ''},
				{name = "Boite de reception", description = ''},
				{name = "Services", description = ''},
			}
		},
		["Emotes"] = {
			title = "Emotes", 
			name = "Emotes",
			buttons = { 
				{name = "Arreter l'emote", description = ''},
				{name = "Handsup", description = ''},
				{name = "No", description = ''},
				{name = "Damn", description = ''},
				{name = "Dance", description = ''},
				{name = "Salute", description = ''},
				{name = "Rock", description = ''},
				{name = "Why", description = ''},
				--{name = "110", description = ''},  AJOUTER UNE LIGNE POUR CHAQUE EMOTE PLUS VOIR LIGNE ~340 
			}
		},
		["Carte d'identite"] = {
			title = "Carte d'identite", 
			name = "Carte d'identite",
			buttons = { 
			}
		},
		["Police"] = {
			title = "Police",
			name = "Police",
			buttons = {
				{name = "Menotter", description = ""}, --mennoter , fouiller, mettre une amende, controler l'identite, oblige a rentrer dans le vehicle
				{name = "Fouiller", description = ""},
				{name = "Amande", description = ""},
				{name = "Controler l'identite", description = ""},
				{name = "Faire rentrer dans le vehicule", description = ""}
			},

		}
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
		Citizen.Wait(0)                                                                     --------
				
		if (IsControlJustPressed(1,213)) then 
			if vehshop.opened then
				CloseCreator()
			else
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

					if button ~= "Police" then
						drawMenuButton(button,vehshop.menu.x,y,selected)
					elseif button == "Police" and isCop then 
						drawMenuButton(button,vehshop.menu.x,y,selected)
					end
					
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
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu -- menu
	local btn = button.name --Gerer les portes

	
	-- Gros ajout très très desordonne ------------ Contactez Izio au 06....
	--if 
	  --  btn == "Coffre" then dtd(btn)
--elseif  btn == "Capot" then dtd(btn)
--elseif  btn == "Avant gauche" then dtd(btn)
--elseif  btn == "Avant droite" then dtd(btn)
--elseif  btn == "Arrière gauche" then dtd(btn)
--elseif  btn == "Arrière droite" then dtd(btn)
--elseif btn == "10"  then OpenLimitator(tonumber(btn))
--elseif btn == "30"  then OpenLimitator(tonumber(btn))
--elseif btn == "50"  then OpenLimitator(tonumber(btn))
--elseif btn == "90"  then OpenLimitator(tonumber(btn))
--elseif btn == "110"  then OpenLimitator(tonumber(btn))
--elseif btn == "Enlever la limite"  then OpenLimitator(500) -- trop hacky
--elseif btn == "Eteindre le moteur" then ToggleEngineOff()
--end	---------------------------------------------------------------------------

	if this == "main" then
		if btn == "Telephone" then
			OpenMenu('Telephone')
		elseif btn == "Emotes" then
			OpenMenu('Emotes')
		elseif btn == "Carte d'identite" then
			OpenMenu("Carte d'identite")
		elseif btn == "Police" and isCop then
			OpenMenu("Police")
		end
	elseif this == "Emotes" then
		if btn == "Arreter l'emote" then
			Emote(0)
		elseif btn == "Handsup" then
			Emote(1)
		elseif btn == "No" then
			Emote(2)
		elseif btn == "Damn" then
			Emote(3)
		elseif btn == "Dance" then
			Emote(4)
		elseif btn == "Salute" then
			Emote(5)
		elseif btn == "Rock" then
			Emote(6)
		elseif btn == "Why" then
			Emote(7)
		end
	elseif this == "Telephone" then
		if btn == "Repertoire" then
			Repertoire()
		elseif btn == "Boite de reception" then
			BoiteReception()
		elseif btn == "Services" then
			Services()
		end
	elseif this == "Carte d'identite" then
			IdCard()
	elseif this == "Police" then
		if btn == "Menotter" then
			Menotter()
		elseif btn == "Fouiller" then
			Fouiller()
		elseif btn == "Amande" then
			Amande()
		elseif btn == "Contrer l'identite" then
			IdControl()
		elseif btn == "Faire rentrer dans le vehicule" then
			EnterVehicle()
		end

	end
end

function OpenMenu(menu)
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "Telephone" then
		vehshop.lastmenu = "main"
	elseif menu == "Emotes"  then
		vehshop.lastmenu = "main"
	elseif menu == "Carte d'identite" then
		vehshop.lastmenu = "main"
	elseif menu == "Police" then
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


function ShowNotification(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(false, false)
end

function Emote(id) -- 0 - 7

end

function Repertoire()

end

function BoiteReception()

end

function Services()

end

function IdCard()

end

function Menotter()
	TriggerServerEvent("Iphone:cuff")
end

function Fouiller()
	TriggerServerEvent("Iphone:check")
end

function Amande() -- sous menu avec choix (7)prix choix (22)infractionss
	local editing = true
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while editing do
		Wait(0)
		if UpdateOnscreenKeyboard() == 2 then
			editing = false
			ShowNotification("Amande annulée")
			
		end
		if UpdateOnscreenKeyboard() == 1 then
			editing = false
			resultat = GetOnscreenKeyboardResult()
			ShowNotification("Amande envoyé")
			Citizen.Trace(resultat)
			ShowNotification(tostring(resultat))
		end
	end



		resultat_n = tonumber(resultat)
		Citizen.Trace(tostring(resultat_n))
		local target_player, distance = GetClosestPlayer()
		Citizen.Trace(tostring(target_player) .. " " .. tostring(distance))
		TriggerServerEvent("Iphone:amande", resultat_n, target_player,distance)

	CloseCreator()

end

function IdControl()
	
end

function EnterVehicle()
	TriggerServerEvent("Iphone:forceenter")
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end

function ShowNotification(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(false, false)
end

function GetPlayers()
	local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players	
end
