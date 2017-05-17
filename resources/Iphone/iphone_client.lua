-- This is Koprov team proprety. --
-- You can use it, share it and modify it BUT you're not allowed to make benefit with it. --
-- Contact us for more informations at koprov.fr --
-- RegisterNetEvent('veh:rcheckveh')

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




isCop = false --------------- A ENLEVER
guiEnabled = false
ActualJob = 0
notificationInProgress = false

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

RegisterNetEvent("service:updateJobs")
AddEventHandler("service:updateJobs", function(jobid)
	ActualJob = jobid
end)

RegisterNetEvent("service:onloaded")
AddEventHandler("service:onloaded", function(jobid)
	ActualJob = jobid
	
end)


local vehshop = {
	opened = false,
	title = "Poche et Actions",
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
		to = 7,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "Telephone", 
			name = "main",
			buttons = { 
				{name = "Telephone", description = ""},
				{name = "Emotes", description = ""},
				{name = "Carte d'identite", description = ""},
				{name = "Services", description = ""},
				{name = "Police", description = ""}
			}
		},
		["Telephone"] = {  -- avant vehicles
			title = "Telephone", 
			name = "Telephone",
			buttons = { 
				{name = "Repertoire", description = ''},
				{name = "Boite de reception", description = ''},
				{name = "Envoyer un SMS", description = ''},
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
		["Services"] = {
			title = "Services", 
			name = "Services",
			buttons = {
				{name = "Police ", description = ""},
				{name = "Médecin", description = ""},
				{name = "Dépanneur", description = ""},
				{name = "Taxi", description = ""}
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
				{name = "Faire rentrer dans le vehicule", description = ""},
				{name = "Faire sortir du vehicule [WIP]", description = ""}
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

				if isCop and vehshop.currentmenu == "main" then
					buttoncount = tablelength(menu.buttons)
				elseif vehshop.currentmenu == "main" then
					buttoncount = tablelength(menu.buttons) - 1
				else buttoncount = tablelength(menu.buttons)
				end

				drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
				drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
				drawTxt(vehshop.selectedbutton.."/"..buttoncount,0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
				local y = vehshop.menu.y + 0.12
				
				local selected = false


			testtest = false
			
			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then
					
					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end

					if button.name ~= "Police" then
						drawMenuButton(button,vehshop.menu.x,y,selected)
						y = y + 0.04
					elseif button.name == "Police" and isCop  then 
						drawMenuButton(button,vehshop.menu.x,y,selected)
						y = y + 0.04
					end
					
					--y = y + 0.04
					
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
			IdCard()
		elseif btn == "Police" and isCop then
			OpenMenu("Police")
		elseif btn == "Services" then
			OpenMenu("Services")
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
		elseif btn == "Envoyer un SMS" then
			SendSMS()
		end

	elseif this == "Police" then
		if btn == "Menotter" then
			Menotter()
		elseif btn == "Fouiller" then
			Fouiller()
		elseif btn == "Amande" then
			Amande()
		elseif btn == "Controler l'identite" then
			IdControl()
		elseif btn == "Faire rentrer dans le vehicule" then
			EnterVehicle()
		elseif btn == "Faire sortir du vehicule" then
			SortirVehicle()
		end

	elseif this == "Services" then
		if btn == "Police " then 
			Services(btn)
		elseif btn == "Médecin" then 
			Services(btn)
		elseif btn == "Dépanneur" then 
			Services(btn)
		elseif btn == "Taxi" then 
			Services(btn)
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
	elseif menu == "Services" then
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
	
	if id == 0 then  
		PlayEmote("mp_player_int_uppersalute","mp_player_int_salute",32)
	elseif id == 1 then  
		TaskHandsUp(GetPlayerPed(-1), 1000, GetPlayerPed(-1), -1, true) 
	elseif id == 2 then    
		test=0
	elseif id == 3 then    
		test=0
	elseif id == 4 then    
		test=0
	elseif id == 5 then    
		test=0
	elseif id == 6 then    
		test=0
	elseif id == 7 then    
		test=0
	end
end

function PlayEmote(dict, name, flags)

RequestAnimDict(dict, flags)
          local i = 0

        	while not HasAnimDictLoaded(dict) and i < 250 do -- max time, 10 seconds
            	Citizen.Wait(10)
            	RequestAnimDict(dict)
            	i = i+1
        	end

			if HasAnimDictLoaded(dict) then
				TaskPlayAnim(GetPlayerPed(-1),dict,name,8,1,-1,flags,0,0,0,0)
		 	end

			Citizen.Wait(0)
        	while GetEntityAnimCurrentTime(GetPlayerPed(-1),dict,name) <= 0.95 and IsEntityPlayingAnim(GetPlayerPed(-1),dict,name,3) do
				Citizen.Wait(0)
        	end

end

function SendSMS()

end

function Repertoire()

end

function BoiteReception()

end

function Services(nom_service)
	if nom_service == "Police " then

		TriggerServerEvent('service:connectedbyid', 2)	

		Citizen.CreateThread(
		function()
			while isCopConnected == nil do
				Citizen.Wait(1)

				RegisterNetEvent('services:cbcopconnected')
				AddEventHandler('services:cbcopconnected',
					function(cb)
						isCopConnected = cb
						if not(isCopConnected) then
							ShowNotification("Pas de policiers en ville")
						else
							local p_coords = GetEntityCoords(GetPlayerPed(-1), true)
							local x = p_coords.x
							local y = p_coords.y
							local z = p_coords.z
							TriggerServerEvent('service:sendservice', 2 ,GetPlayerServerId(PlayerId()), x, y, z)
						end
					end
				)
			end
		end)

	elseif nom_service == "Médecin" then

		TriggerServerEvent('service:connectedbyid', 3)

		Citizen.CreateThread(
		function()
			while isMedicConnected == nil do
				Citizen.Wait(1)

				RegisterNetEvent('services:cbmedconnected')
				AddEventHandler('services:cbmedconnected',
					function(cb)
						isMedicConnected = cb
						if not(isMedicConnected) then
							ShowNotification("Pas de médecins en ville")
						else
							local p_coords = GetEntityCoords(GetPlayerPed(-1), true)
							local x = p_coords.x
							local y = p_coords.y
							local z = p_coords.z
							TriggerServerEvent('service:sendservice', 3 , GetPlayerServerId(PlayerId()), x, y, z)
						end
					end
				)
			end
		end)

	elseif nom_service == "Taxi" then

		TriggerServerEvent('service:connectedbyid', 9)	

		Citizen.CreateThread(
		function()
			while isTaxiConnected == nil do
				Citizen.Wait(1)

				RegisterNetEvent('services:cbtaxconnected')
				AddEventHandler('services:cbtaxconnected',
					function(cb)
						isTaxiConnected = cb
						if not(isTaxiConnected) then
							ShowNotification("Pas de taxis en ville")
						else
							local p_coords = GetEntityCoords(GetPlayerPed(-1), true)
							local x = p_coords.x
							local y = p_coords.y
							local z = p_coords.z
							TriggerServerEvent('service:sendservice', 9 ,GetPlayerServerId(PlayerId()), x, y, z)
						end
					end
				)
			end
		end)

	elseif nom_service == "Dépanneur" then

		TriggerServerEvent('service:connectedbyid', 4)

		Citizen.CreateThread(
		function()
			while isDepanConnected == nil do
				Citizen.Wait(1)

				RegisterNetEvent('services:cbdepconnected')
				AddEventHandler('services:cbdepconnected',
					function(cb)
						isDepanConnected = cb

						if not(isDepanConnected) then
							ShowNotification("Pas de dépanneurs en ville")
						else 
							local p_coords = GetEntityCoords(GetPlayerPed(-1), true)
							local x = p_coords.x
							local y = p_coords.y
							local z = p_coords.z
							TriggerServerEvent('service:sendservice', 4 ,GetPlayerServerId(PlayerId()), x, y, z)
						end
					end
				)
			end
		end)



	end
end


function IdCard()
	TriggerServerEvent("Iphone:checkid", GetPlayerServerId(PlayerId()), 0)
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
			
			ShowNotification(tostring(resultat))
		end
	end



		resultat_n = tonumber(resultat)
		
		Fines(resultat_n)
		--TriggerServerEvent("Iphone:amande", resultat_n, target_player,distance)

	CloseCreator()

end

function IdControl() -- IL FAUT METTRE LA TARGET DANS TARGET : Utiliser GetClosestPlayer
	
	local target, distance = GetClosestPlayer()
	
	TriggerServerEvent("Iphone:checkid", GetPlayerServerId(target), 1)
end


function SortirVehicle()
	t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("police:confirmUnseat", GetPlayerServerId(t))
	else
		TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "No player near you (maybe get closer) !")
	end
end

function EnterVehicle()
	TriggerServerEvent("Iphone:forceenter")
end

function Fines(amount)
	t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("police:finesGranted", GetPlayerServerId(t), amount)
	else
		TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "No player near you (maybe get closer) !")
	end
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

RegisterNetEvent("Iphone:rcheckid")
AddEventHandler("Iphone:rcheckid", function(first_name, last_name, matricule, phone, gender)
	ShowNotification("L'identité de la personne est : ".. first_name .. " " .. last_name .. " | " .. " Matricule : " .. matricule .. " Téléphone : " .. phone .. "Genre : " ..gender  )		
		
end)

RegisterNetEvent("Iphone:rgetidui")  -- IL FAUT PRENDRE LE LAST ET LE FIRST NAME
AddEventHandler("Iphone:rgetidui", function(firstname, lastename, matricule, phone, gender)
	
	----------PARTIE UI -----------
	guiEnabled = not guiEnabled
	
	if guiEnabled then
	    	SendNUIMessage({
		type = "enableui",
		tlastname = lastename,
		tfirstname = firstname,
		tid = matricule,
		tphone = phone,
		tgender = gender
	    })

	else
		SendNUIMessage({
			type = "disableui"
		})
		
	end
end)

RegisterNetEvent('service:sendserviceto')
AddEventHandler('service:sendserviceto',
	function(service_id, playersender, x, y, z, sourceplayersender)
		callAlreadyTaken = false
		local playerServerId = GetPlayerServerId(PlayerId())

		if playersender == playerServerId then playersenderisreceiver = true else playersenderisreceiver = false end

		Citizen.CreateThread(
			function()
				if ActualJob == service_id and not playersenderisreceiver then  --  C'EST ICI QU'IL FAUDRAIT CHECKER S'IL EST EN SERVICE SI LE SERVICEID = POLICIER/MEDIC MAIS BON FLEMME POUR LE MOMENT
					local controlPressed = false

					while notificationInProgress do
						Citizen.Wait(0)
					end

					local notifReceivedAt = GetGameTimer()

					if not callAlreadyTaken then
						ShowNotification('<b>~r~Appel : ~s~ <br><br>~b~quelqu\'un a besoin de votre service~s~: </b>')
						ShowNotification('<b>Appuyez sur ~g~Y~s~ pour prendre l\'appel</b>')
					end

					while not controlPressed and not callAlreadyTaken do
						Citizen.Wait(0)
						notificationInProgress = true

						if (GetTimeDifference(GetGameTimer(), notifReceivedAt) > 10000) then -- APPEL REDUIT à 10 SECONDES POUR LES SERVICES
							callAlreadyTaken = true
							ShowNotification('L\'appel a été pris par ~b~')
						end

						if IsControlPressed(1, Keys["Y"]) and not callAlreadyTaken then
						
							callAlreadyTaken = true
							controlPressed = true

							
							TriggerServerEvent('service:takecall', service_id ,GetPlayerName(PlayerId()), playerServerId, x, y, z, sourceplayersender)
						end

						if callAlreadyTaken or controlPressed then
							notificationInProgress = false
						end
					end
				end
			end
		)
	end
)

RegisterNetEvent("service:calltaken")
AddEventHandler("service:calltaken", function(service_id, playerName, playerID, x, y, z, sourceplayersender)
	
		local playerServerId = GetPlayerServerId(PlayerId())
		callAlreadyTaken = true
		if playerServerID == sourceplayersender then playersenderisreceiver = true else playersenderisreceiver=false end -- a changer le true
		
		if ActualJob == service_id and not playersenderisreceiver then  --ActualJob == service_id
			ShowNotification('L\'appel a été pris par ~b~')
		end
		
		if playerServerId == playerID then
			TriggerServerEvent('service:ssendnotifservicesencer', sourceplayersender, service_id)
			StartService(x, y, z, sourceplayersender, service_id)
		end

end)

RegisterNetEvent('service:csendnotifservicesencer')
AddEventHandler('service:csendnotifservicesencer',
	function(service_id)
		if service_id == 2 then servicetxt = "policer"
		elseif service_id == 3 then servicetxt = "médecin"
		elseif service_id == 9 then servicetxt = "taxi"
		elseif service_id == 4 then servicetxt = "dépanneur"
		end
		ShowNotification("<b> Un </b>".. servicetxt .." est en train de venir")
	end
)

function StartService(x, y, z, sourceplayersender, service_id)

	Blipvariable = AddBlipForCoord(x, y, z)
    N_0x80ead8e2e1d5d52e(Blipvariable)
    SetBlipRoute(Blipvariable, 1)
	
	ShowNotification('L\'appelant vous à transmis ses données GPS')

	Citizen.CreateThread(
		function()
			local isNear = false
			local ped = GetPlayerPed(-1);
			while not isNear do
				Citizen.Wait(0)
				isNear = isNearArea(x, y, z)

				if isNear then
						if Blipvariable ~= nil and DoesBlipExist(Blipvariable) then
                            Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(Blipvariable))
                            Blipvariable = nil
                        end
				end
			end
	end)

end

function isNearArea(x,y,z) -- Je ne vais pas utiliser le z finalement, à voir
	local coords_player = GetEntityCoords(GetPlayerPed(-1), true)
	local x2 = coords_player.x
	local y2 = coords_player.y
	local z2 = coords_player.z
	local dist = GetDistanceBetweenCoords(x, y, z, x2, y2, z2, false)
	

	if dist > 10.0 then
		return false
	else
		return true
	end
end
