-- This is Koprov team proprety. --
-- You can use it, share it and modify it BUT you're not allowed to make benefit with it. --
-- Contact us for more informations at koprov.fr --
-- RegisterNetEvent('veh:rcheckveh')

--------------------HARDCODING HARD HARD, BE PREPARED-------------------------

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

------------------------------------------------------------------------------
isCop = false --------------- A ENLEVER
guiEnabled = false
ActualJob = 0
notificationInProgress = false
taillemaxsms = 30

PhoneData = {
	phone_number = 0,
	contacts = {},
	sms = {},
	name = {}
}

reloadphone = false

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
			title = "Menus", 
			name = "main",
			buttons = { 
				{name = "Telephone", description = ""},
				{name = "Emotes", description = ""},
				{name = "Carte d'identite", description = ""},
				{name = "Services", description = ""},
				{name = "Donner de l'argent", description = ""},
				{name = "Police", description = ""}
			}
		},
		["Telephone"] = {  -- avant vehicles
			title = "Telephone", 
			name = "Telephone",
			buttons = { 
				{name = "Repertoire", description = ''},
				{name = "Boite de reception", description = ''},
				--{name = "Envoyer un SMS", description = ''},
			}
		},
		["Emotes"] = {
			title = "Emotes", 
			name = "Emotes",
			buttons = { 
				{name = "Arreter l'emote", description = ''},
				{name = "Se rendre", description = ''},
				{name = "Calme (long)", description = ''},
				{name = "Zut", description = ''},
				{name = "Dance", description = ''},
				{name = "Peur", description = ''},
				{name = "Fumer / AFK", description = ''},
				{name = "Applaudir (calme)", description = ''},
				{name = "Enlacer", description = ''},
				{name = "Pompe", description = ''},
				{name = "Applaudir 2", description = ''},
				{name = "Pompes 2", description = ''},
				{name = "Attendre", description = ''},
				{name = "Fuck", description = ''},
				{name = "Fumer 2", description = ''},
				{name = "Telephoner", description = ''},
				{name = "Allonger", description = ''},
				{name = "Pisser", description = ''},
				{name = "Siffler taxi", description = ''},
				{name = "Yoga", description = ''},
				{name = "Branler", description = ''},
				{name = "Selfie", description = ''},
				{name = "Prout 1", description = ''},
				{name = "Dancer", description = ''},
				{name = "Guitare", description = ''},
				{name = "High 5", description =''},
				{name = "Calme", description =''},
				{name = "Noter", description =''},
				{name = "Pêcher", description =''},
				{name = "Suicide", description =''},
				{name = "Assis", description =''},
				{name = "A terre", description =''},
				{name = "Wip", description =''},
				{name = "Gratter couilles", description =''},
				{name = "Arreter", description =''}
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
		["Donner de l'argent"] = {
			title = "Donner de l'argent",
			name = "Donner de l'argent",
			buttons = {

			}
		},
		["Police"] = {
			title = "Police",
			name = "Police",
			buttons = {
				{name = "Menotter", description = ""}, --mennoter , fouiller, mettre une amende, controler l'identite, oblige a rentrer dans le vehicle
				{name = "Fouiller", description = ""},
				{name = "Amende", description = ""},
				{name = "Controler l'identite", description = ""},
				{name = "Controler le vehicule", description = ""},
				{name = "Faire rentrer dans le vehicule", description = ""},
				{name = "Faire sortir du vehicule", description = ""}, --------------- Repertoire Boite de reception
			}
		},
		["Repertoire"] = {
			title = "Repertoire", 
			name = "Repertoire",
			buttons = {
				{name = "Ajouter un contact", description = "TestTest ça supporte combien de carracter exactemncarracter exactemncarracter exactemncarracter exactemncarracter exactemn"}
			}
		},
		["Boite de reception"] = {
			title = "Boite de reception",
			name = "Boite de reception",
			buttons = {   --  table = {name = sender.name.. " " ..sender.num }  for i=2, var, 1 do table.insert(vehshop.menu["Repertoire"].buttons, table)  end
			}
		},
		["Contact"] = {
			title = "Contact",
			name = "Contact",
			buttons = {
				{name = "Envoyer un Sms", description = ""}, --  table = {name = sender.name.. " " ..sender.num }  for i=2, var, 1 do table.insert(vehshop.menu["Repertoire"].buttons, table)  end
				{name = "Envoyer la position[WIP]", description = ""},
				-- waiting for izio :) {name = "Supprimer le Contact", description = ""}
			}
		},
	}
}

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

function drawMenuHelp(x, y, txt)
	local menu = vehshop.menu
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 , y - menu.height/2 )
end

function drawMenuTitle(txt,x,y)
	local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,231, 76, 60,150)
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
local last_time = GetGameTimer()
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)                                                                     --------
		if (IsControlJustPressed(1,213)) then --------------------------- On ouvre le menu si on appui sur la touche
			if vehshop.opened then
				CloseCreator()
			else
				OpenCreator()
			end
		end ----------------------------------------------------------------------------------------------------

		if vehshop.opened then
			local ped = LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu] -- vehshop.menu["Repertoire"].buttons

			if isCop and vehshop.currentmenu == "main" then
				buttoncount = tablelength(menu.buttons)
			elseif vehshop.currentmenu == "main" then
				buttoncount = tablelength(menu.buttons) - 1
			else
				buttoncount = tablelength(menu.buttons)
			end
			drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			drawTxt(vehshop.selectedbutton.."/"..buttoncount,0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12

			local selected = false

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
					elseif button.name == "Police" and isCop then  ------------------ On affiche le boutton que si on est flic 
						drawMenuButton(button,vehshop.menu.x,y,selected)
						y = y + 0.04
					end ------------------------------------------------------------------------------------------------------

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
	if this == "main" then
		if btn == "Telephone" then
			OpenMenu('Telephone')
		elseif btn == "Emotes" then
			OpenMenu('Emotes')
		elseif btn == "Carte d'identite" then
			IdCard()
		elseif btn == "Donner de l'argent" then
			GiveCash()
		elseif btn == "Police" and isCop then
			OpenMenu("Police")
		elseif btn == "Services" then
			OpenMenu("Services")
		end
	elseif this == "Emotes" then
		if btn == "Arreter l'emote" then
			Emote(0)
		elseif btn == "Se rendre" then
			Emote(1)
		elseif btn == "Calme (long)" then
			Emote(2)
		elseif btn == "Zut" then
			Emote(3)
		elseif btn == "Dance" then
			Emote(4)
		elseif btn == "Peur" then
			Emote(5)
		elseif btn == "Fumer / AFK" then
			Emote(6)
		elseif btn == "Applaudir (calme)" then
			Emote(7)
		elseif btn == "Enlacer" then
			Emote(8)
		elseif btn == "Pompe" then
			Emote(9)
		elseif btn == "Applaudir 2" then
			Emote(10)
		elseif btn == "Pompes 2" then
			Emote(11)
		elseif btn == "Attendre" then
			Emote(12)
		elseif btn == "Fuck" then
			Emote(13)
		elseif btn == "Fumer 2" then
			Emote(14)
		elseif btn == "Telephoner" then
			Emote(15)
		elseif btn == "Allonger" then
			Emote(16)
		elseif btn == "Pisser" then
			Emote(17)
		elseif btn == "Siffler taxi" then
			Emote(18)
		elseif btn == "Yoga" then
			Emote(19)
		elseif btn == "Branler" then
			Emote(20)
		elseif btn == "Selfie" then
			Emote(21)
		elseif btn == "Dancer" then
			Emote(22)
		elseif btn == "Guitare" then
			Emote(23)
		elseif btn == "High 5" then
			Emote(24)
		elseif btn == "Calme" then
			Emote(25)
		elseif btn == "Noter" then
			Emote(26)
		elseif btn == "Pêcher" then
			Emote(27)
		elseif btn == "Suicide" then
			Emote(28)
		elseif btn == "Assis" then
			Emote(29)
		elseif btn == "A terre" then
			Emote(30)
		elseif btn == "Wip" then
			Emote(31)
		elseif btn == "Gratter couilles" then
			Emote(32)
		elseif btn == "Arreter" then
			Emote(33)
		end

	elseif this == "Telephone" then
		if btn == "Repertoire" then
			OpenMenu("Repertoire")
		elseif btn == "Boite de reception" then
			OpenMenu("Boite de reception")
		--elseif btn == "Envoyer un SMS" then  POUR SI ON VEUT ACTIVER LE FAIT DE POUVOIR ENVOYER DES SMS SANS L'AVOIR DANS LE REPETOIRE
			--OpenMenu("Services")
		end

	elseif this == "Boite de reception" then
			text = button.description
			vehshop.menu.from = 1
			vehshop.menu.to = 10
			vehshop.selectedbutton = 0
			--ShowNotification(text)
			TriggerEvent("pNotify:SendNotification", { text = ""..text.."", type = "sms", timeout = 10000, layout = "bottomCenter",})

	elseif this == "Police" then
		if btn == "Menotter" then
			Menotter()
		elseif btn == "Fouiller" then
			Fouiller()
		elseif btn == "Amende" then
			Amande()
		elseif btn == "Controler l'identite" then
			IdControl()
		elseif btn == "Controler le vehicule" then
			PlateControl()
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

	elseif this == "Repertoire" then 
		if btn == "Ajouter un contact" then
			AddContact()
		else -- c'est que c'est forcément un contact de la table PhoneData.contacts
			toNumber = button.description
			vehshop.lastmenu = "Repertoire"
			vehshop.menu.from = 1
			vehshop.menu.to = 10
			vehshop.selectedbutton = 0
			vehshop.currentmenu = "Contact"
		end

	elseif this == "Contact" then
		if btn == "Envoyer un Sms" then
			local editing = true
			DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
			while editing do
				Wait(0)
				if UpdateOnscreenKeyboard() == 2 then 
					editing = false
					ShowNotification("Sms annulé")
				end
				if UpdateOnscreenKeyboard() == 1 then
					editing = false
					resultat = GetOnscreenKeyboardResult()
					ShowNotification("Sms envoyé")
				end
			end
			local sendSms = tostring(resultat)
			TriggerServerEvent("Iphone:sendsmsfromone", toNumber,sendSms)
			vehshop.menu.from = 1
			vehshop.menu.to = 10
			vehshop.selectedbutton = 0
			vehshop.currentmenu = "Repertoire"
		elseif btn == "Envoyer la position" then
			local name = PhoneData.name.first_name.. " " ..PhoneData.name.last_name
			local spos = GetEntityCoords(GetPlayerPed(-1), true)
			TriggerServerEvent("Iphone:sendposto", toNumber, sname, spos.x, spos.y, spos.z)
			vehshop.menu.from = 1
			vehshop.menu.to = 10
			vehshop.selectedbutton = 0
			vehshop.currentmenu = "Repertoire"
		elseif btn == "Supprimer le Contact" then
			TriggerServerEvent("Iphone:removecontact", toNumber)
			for i=1 , #PhoneData.contacts, 1 do
				if PhoneData.contacts[i].number == toNumber then
					table.remove(PhoneData.contacts, i)
				end
			end
			vehshop.menu.from = 1
			vehshop.menu.to = 10
			vehshop.selectedbutton = 0
			vehshop.currentmenu = "Repertoire"
		end
	end
end


	--PhoneData = {
	--phone_number = "numberHERE",
	--contacts = {
	--{first_name = "contact1", last_name = "contact1", number = "numberHERE"},
	--{etc...},
	--},
	--sms = {
	--{first_name = "test", last_name = "test", text = "test"},
	--{ etc ...}
	--},
	--name = {
	--{first_name = "Romain", last_name = "Billot"}
	--}
--}
			--table.insert(vehshop.menu["Repertoire"].buttons, {
					--first_name = tostring(result[1]),
					--last_name = tostring(result[2]),
					--number = tostring(resultat2)
					--})


--UI::BEGIN_TEXT_COMMAND_SET_BLIP_NAME("STRING");
--UI::_ADD_TEXT_COMPONENT_STRING("Name");
--UI::END_TEXT_COMMAND_SET_BLIP_NAME(blip);

RegisterNetEvent("Iphone:receivepos")
AddEventHandler("Iphone:receivepos", function(x, y, z, sendername)
	ShowNotification("Vous venez de recevoir la position de "..sendername)
	timer_pos = GetGameTimer()
	Blipvariable = AddBlipForCoord(x, y, z)
	N_0x80ead8e2e1d5d52e(Blipvariable)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(sendername)
	EndTextCommandSetBlipName(Blipvariable)
	SetBlipRoute(Blipvariable, 1)
	SetBlipRouteColor(Blipvariable, 48)
	finish = false
	while not(finish) do
		Wait(10)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		x1, y1, z1 = table.unpack(playersCoords)
		if GetDistanceBetweenCoords(x, y, z, x1, y1, z1, false) < 20 or (GetGameTimer() - timer_pos) > 600000 then
			if Blipvariable ~= nil and DoesBlipExist(Blipvariable) then
				Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(Blipvariable))
				Blipvariable = nil
			end
			finish = true
		end
	end
end)

RegisterNetEvent("Iphone:receivesms")
AddEventHandler("Iphone:receivesms", function(ssms)
	snameplusdate = ssms.first_name .. " " .. ssms.last_name .. " : ".. ssms.jour .. "/".. ssms.mois .. " à " .. ssms.heure .. "h" .. ssms.minute
	sname = ssms.first_name .. " " .. ssms.last_name
	if #PhoneData.sms >= taillemaxsms then
		ShowNotification("Vous venez de recevoir un sms mais la taille est dépassé. Veuillez faire le tri")
		table.remove(PhoneData.sms, 1)
	else
		-- ShowNotification("Vous venez de recevoir un message de : " ..sname)
		TriggerEvent("pNotify:SendNotification", { text = "Nouveau message de : <b style='color:green'>"..sname.."</b>.", type = "sms", timeout = 5000, layout = "bottomCenter",})
	end
	table.insert(vehshop.menu["Boite de reception"].buttons, {
						name = snameplusdate,
						description = ssms.text
					})
	local receiveSms = {
		first_name = ssms.first_name,
		last_name = ssms.last_name,
		text = ssms.text,
		jour = ssms.jour,
		heure = ssms.heure,
		minute = ssms.minute,
		mois = ssms.mois
	}

	table.insert(PhoneData.sms, receivesms)

end)

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
	elseif vehshop.currentmenu == "Emotes" or vehshop.currentmenu == "Telephone" or vehshop.currentmenu == "Services" or vehshop.currentmenu == "Police" then
		vehshop.currentmenu = "main"
	elseif vehshop.currentmenu == "Repertoire" then
		vehshop.currentmenu = "Telephone"
	else
		--OpenMenu(vehshop.lastmenu)
		vehshop.currentmenu = vehshop.lastmenu
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

function Emote(id) -- 0 - 7 -- IL FAUT JOUER AVEC LES FLAGS 0,32 et 120 en général d'après mes test LIS AUSSI LE PLAYEMOTE
	
	if id == 0 then  
		PlayEmote("on sen fou","grave ",120, 0.9 ,1, 0)  -- arreter l'emote
	elseif id == 1 then  
		PlayEmote("random@arrests","kneeling_arrest_idle",32, 0.2 ,0 , 0) -- main en l'air en étant au sol | 0.2 en duration == TRES COURT
	elseif id == 2 then    
		PlayEmote("amb@code_human_police_crowd_control@idle_a", "idle_a", 32, 0.85 ,0 , 0) -- Blabla bizarre
	elseif id == 3 then    
		PlayEmote("gestures@f@standing@casual","gesture_damn", 32, 0.95, 0, 0)					-- Je te laisse en ajouter a ta guise, je t'en ai prévu quelqu'un déjà :) Faut jouer avec les FLAGS : 0,32 et 120 (et avec le multiplier)
	elseif id == 4 then    -- {"rcmnigel1bnmt_1b","dance_intro_tyler",1} & {"rcmnigel1bnmt_1b","dance_loop_tyler",1}
		PlayEmote("rcmnigel1bnmt_1b", "dance_intro_tyler", 32, 1 ,0, 0)	
		PlayEmote("rcmnigel1bnmt_1b", "dance_loop_tyler", 32, 1 ,0 , 1)	
	elseif id == 5 then    
		animsAction({ lib = "amb@code_human_cower_stand@female@idle_a", anim = "idle_c" }) -- applause loud
	elseif id == 6 then    
		local smoke = true
		TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING", 0, true)
		while smoke do
			Wait(0)
			if IsControlJustPressed(1, 32) then
				PlayEmote("amb@world_human_smoking@male@male_a@exit", "exit", 32, 1, 0, 0)
				smoke = false
			end
		end
	elseif id == 7 then    
		PlayEmote("amb@world_human_cheering@male_e", "base", 120, 1, 0, 0) -- applause calm
	elseif id == 8 then    
		animsAction({ lib = "mp_ped_interaction", anim = "kisses_guy_a" })
	elseif id == 9 then    
		PlayEmote("amb@world_human_muscle_flex@arms_in_front@base", "base", 32, 1, 0, 0)
	elseif id == 10 then    
		animsActionScenario({ anim = "world_human_cheering" })
	elseif id == 11 then    
		PlayEmote("amb@world_human_push_ups@male@enter", "enter", 32, 1, 0, 0)
		PlayEmote("amb@world_human_push_ups@male@base", "base", 1, 1, 0, 1)
		PlayEmote("amb@world_human_push_ups@male@exit", "exit", 32, 1, 0, 0)
	elseif id == 12 then    
		PlayEmote("missbigscore1", "idle_base", 153, 1, 0, 0)
	elseif id == 13 then    
		animsAction({ lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter" })
	elseif id == 14 then    
		PlayEmote("amb@world_human_stand_mobile@male@text@enter", "enter", 32, 1, 0, 0)
		PlayEmote("amb@world_human_stand_mobile@male@text@base", "base", 1, 1, 0, 1)
		PlayEmote("amb@world_human_stand_mobile@male@text@exit", "exit", 32, 1, 0, 0)
	elseif id == 15 then
		PlayEmote("cellphone@", "cellphone_call_in", 32, 1, 0, 0)    
		PlayEmote("cellphone@", "cellphone_call_listen_base", 153, 1, 0, 0)
	elseif id == 16 then
		PlayEmote("amb@world_human_sunbathe@male@back@enter", "enter", 0, 1, 0, 0)
		PlayEmote("amb@world_human_sunbathe@male@back@base", "base", 1, 1, 0, 1)
		PlayEmote("amb@world_human_sunbathe@male@back@exit", "exit", 0, 1, 0, 0)
	elseif id == 17 then
		PlayEmote("misscarsteal2peeing", "peeing_intro", 0, 1, 0, 0)
		PlayEmote("misscarsteal2peeing", "peeing_loop", 1, 1, 0, 1)
		PlayEmote("misscarsteal2peeing", "peeing_outro", 0, 1, 0, 0)
	elseif id == 18 then
		PlayEmote("taxi_hail", "fp_hail_taxi", 0, 1, 0, 0)
	elseif id == 19 then
		PlayEmote("amb@world_human_yoga@male@base", "base_a", 0, 1, 0, 0)
	elseif id == 20 then
		animsAction({ lib = "mp_player_int_upperwank", anim = "mp_player_int_wank_01" })
	elseif id == 21 then
		animsActionScenario({ anim = "world_human_tourist_mobile" }) -- selfie
	elseif id == 22 then
		PlayEmote("rcmnigel1bnmt_1b", "dance_intro_tyler", 32, 1 ,0, 0)	
		PlayEmote("rcmnigel1bnmt_1b", "dance_loop_tyler", 32, 1 ,0 , 1)	
	elseif id == 23 then
		animsActionScenario({ anim = "world_human_musician" })
	elseif id == 24 then
		animsAction({ lib = "mp_ped_interaction", anim = "highfive_guy_a" })
	elseif id == 25 then
		animsAction({ lib = "gestures@m@standing@casual", anim = "gesture_easy_now"})
	elseif id == 26 then
		animsActionScenario({ anim = "WORLD_HUMAN_CLIPBOARD" })
	elseif id == 27 then
		animsActionScenario({ anim = "world_human_stand_fishing" })
	elseif id == 28 then
		animsAction({ lib = "mp_suicide", anim = "pistol" })
	elseif id == 29 then
		animsAction({ lib = "anim@heists@prison_heistunfinished_biztarget_idle", anim = "target_idle" })
	elseif id == 30 then
		animsActionScenario({ anim = "WORLD_HUMAN_PICNIC"})
	elseif id == 31 then
		animsAction({ lib = "mini@prostitutes@sexlow_veh", anim = "low_car_bj_to_prop_female" })
	elseif id == 32 then
		animsAction({ lib = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch" })
	elseif id == 33 then
		animsAction({ lib = "mp_arresting", anim = "a_arrest_on_floor"})
	end
end

function animsAction(animObj)
    RequestAnimDict( animObj.lib )
    while not HasAnimDictLoaded( animObj.lib ) do
        Citizen.Wait(0)
    end
    if HasAnimDictLoaded( animObj.lib ) then
        TaskPlayAnim( GetPlayerPed(-1), animObj.lib , animObj.anim ,8.0, -8.0, -1, 0, 0, false, false, false )
    end
end

function animsActionScenario(animObj)
    local ped = GetPlayerPed(-1);

    if ped then
        local pos = GetEntityCoords(ped);
        local head = GetEntityHeading(ped);
        --TaskStartScenarioAtPosition(ped, animObj.anim, pos['x'], pos['y'], pos['z'] - 1, head, -1, false, false);
        TaskStartScenarioInPlace(ped, animObj.anim, 0, false)
        if IsControlJustPressed(1,188) then
        end

    end
end

function animsWithModelsSpawn(object)

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

    RequestModel(object.object)
    while not HasModelLoaded(object.object) do
        Wait(1)
    end

    local object = CreateObject(object.object, x, y+2, z, true, true, true)
    -- local vX, vY, vZ = table.unpack(GetEntityCoords(object,  true))

    -- AttachEntityToEntity(object, PlayerId(), GetPedBoneIndex(PlayerId()), vX,  vY,  vZ, -90.0, 0, -90.0, true, true, true, false, 0, true)
    PlaceObjectOnGroundProperly(object)

end

function PlayEmote(dict, name, flags, duration ,stop, loop) -- duration entre 0 et 1, c'est le multipliyer de l'action (0.5 tres rapide et 0.95 quasiment l'annimation normale)
													  -- Stop 0 pour jouer une annimation et 1 pour arreter (donc 0 dans notre cas)

	if stop ~= 1 then
		ClearPedSecondaryTask(GetPlayerPed(-1))
    	ClearPedTasks(GetPlayerPed(-1))

        local i = 0
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) and i < 500 do -- max time, 10 seconds
        	Citizen.Wait(10)
            RequestAnimDict(dict)
            i = i+1
        end

		if HasAnimDictLoaded(dict) then
			TaskPlayAnim(GetPlayerPed(-1),dict,name,8.0001,1,-1,flags,0,0,0,0)
		end

		Wait(0)

		if loop ~= 1 then
			while GetEntityAnimCurrentTime(GetPlayerPed(-1), dict, name) <= duration and IsEntityPlayingAnim(GetPlayerPed(-1),dict,name,3) do
				Citizen.Wait(0)
			end
			ClearPedTasksImmediately(GetPlayerPed(-1))
		else
			while GetEntityAnimCurrentTime(GetPlayerPed(-1), dict, name) <= duration and IsEntityPlayingAnim(GetPlayerPed(-1),dict,name,3) do
				Citizen.Wait(0)
				if IsControlJustPressed(1, Keys['E']) then
					ClearPedTasksImmediately(GetPlayerPed(-1))
					break
				end
			end
		end
	else
    	ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end

function AddContact()
	local editing1 = true
   	local editing2 = true
   	local quit1 = false
   	local quit2 = false

	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "[PRENOM] [NOM]", "", "", "", 120)
	while editing1 do
		Wait(0)
		if UpdateOnscreenKeyboard() == 2 then
			editing1 = false
			quit1 = true
			ShowNotification("Annulé!")
		end
		if UpdateOnscreenKeyboard() == 1 then
			editing1 = false
			resultat1 = GetOnscreenKeyboardResult()
			ShowNotification("Entre maintenant le numero")
		end
	end

	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "[NUMERO]", "", "", "", 120)
	while editing2 do
		Wait(0)
		if UpdateOnscreenKeyboard() == 2 then
			editing2 = false
			quit2 = true
			ShowNotification("Annulé!")
		end
		if UpdateOnscreenKeyboard() == 1 then
			editing2 = false
			resultat2 = GetOnscreenKeyboardResult()
			ShowNotification("Contact ajouté !")
		end
	end

	if not(quit1) and not(quit2) then
		result = {}
		for token in string.gmatch(resultat1, "[^%s]+") do
  			table.insert(result, token)
		end
   		table.insert(vehshop.menu["Repertoire"].buttons, {
   			name = tostring(result[1]).. " " .. tostring(result[2]),
			description = tostring(resultat2)
		})
   			-----------------------
   		table.insert(PhoneData.contacts, {
   			first_name = tostring(result[1]),
			last_name = tostring(result[2]),
			number = tostring(resultat2)
		})


--PhoneData = {
	--phone_number = "numberHERE",
	--contacts = {
	--{first_name = "contact1", last_name = "contact1", number = "numberHERE"},
	--{etc...},
	--},
	--sms = {
	--{first_name = "test", last_name = "test", text = test},
	--{ etc ...}
	--},
	--name = {
	--{first_name = "Romain", last_name = "Billot"}
	--}
--}


   		TriggerServerEvent("Iphone:addcontact", result[1], result[2], resultat2)

   	end
end

function SendSMS()

end

function Repertoire()

end

function BoiteReception()

end

RegisterNetEvent('services:cbcopconnected')
AddEventHandler('services:cbcopconnected', function(cb)
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
end)

RegisterNetEvent('services:cbmedconnected')
AddEventHandler('services:cbmedconnected', function(cb)
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
end)

RegisterNetEvent('services:cbdepconnected')
AddEventHandler('services:cbdepconnected', function(cb)
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
end)

RegisterNetEvent('services:cbtaxconnected')
AddEventHandler('services:cbtaxconnected', function(cb)
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
end)

function Services(nom_service)
	if nom_service == "Police " then
		TriggerServerEvent('police:enService')
    elseif nom_service == "Médecin" then
    	TriggerServerEvent('service:connectedbyid', 3)
    elseif nom_service == "Taxi" then
    	TriggerServerEvent('service:connectedbyid', 9)
    elseif nom_service == "Dépanneur" then
    	TriggerServerEvent('service:connectedbyid', 4)
	end
end

function IdCard()
	TriggerServerEvent("Iphone:checkid", GetPlayerServerId(PlayerId()), 0)
end

function GiveCash()
	local target, distance = GetClosestPlayer()
    if target ~= nil and distance < 1 then
        DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0)
            Wait(0)
        end
        if (GetOnscreenKeyboardResult()) then
            TriggerServerEvent("bank:givecash", GetPlayerServerId(target), GetOnscreenKeyboardResult())
        end
    end
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
			ShowNotification("Amende annulée")
		end
		if UpdateOnscreenKeyboard() == 1 then
			editing = false
			resultat = GetOnscreenKeyboardResult()
			ShowNotification("Amende envoyé")
		end
	end
	resultat_n = tonumber(resultat)
	Fines(resultat_n)
	-- TriggerServerEvent("Iphone:amande", resultat_n, target_player,distance)
	CloseCreator()
end

function IdControl() -- IL FAUT METTRE LA TARGET DANS TARGET : Utiliser GetClosestPlayer
	local target, distance = GetClosestPlayer()
	TriggerServerEvent("Iphone:checkid", GetPlayerServerId(target), 1)
end

function PlateControl()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

	local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicleHandle = GetRaycastResult(rayHandle)
	if(DoesEntityExist(vehicleHandle)) then
		TriggerServerEvent("Iphone:checkplate", GetVehicleNumberPlateText(vehicleHandle))
	else
		TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Aucun vehicule a proximite !")
	end
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
AddEventHandler("Iphone:rgetidui", function(firstname, lastename, matricule, phone_number, gender)
	
	----------PARTIE UI -----------
	guiEnabled = not guiEnabled
	
	if guiEnabled then
		SendNUIMessage({
			type = "enableui",
			tlastname = lastename,
			tfirstname = firstname,
			tid = matricule,
			tphone = phone_number,
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
	Citizen.CreateThread(function()
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
					ShowNotification('L\'appel a été pris')
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
	end)
end)

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
AddEventHandler('service:csendnotifservicesencer', function(service_id)
	if service_id == 2 then servicetxt = "policer"
		elseif service_id == 3 then servicetxt = "médecin"
			elseif service_id == 9 then servicetxt = "taxi"
				elseif service_id == 4 then servicetxt = "dépanneur"
	end
	ShowNotification("<b> Un </b>".. servicetxt .." est en train de venir")
end)

function StartService(x, y, z, sourceplayersender, service_id)
	Blipvariable = AddBlipForCoord(x, y, z)
	N_0x80ead8e2e1d5d52e(Blipvariable)
	SetBlipRoute(Blipvariable, 1)
	ShowNotification('L\'appelant vous à transmis ses données GPS')
	Citizen.CreateThread(function()
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


RegisterNetEvent('Iphone:loaded')
AddEventHandler('Iphone:loaded', function(lphoneNumber, lcontacts, lsms, lname)

	PhoneData.contacts = lcontacts

	PhoneData.sms = lsms

	PhoneData.name.first_name = lname.first_name
	PhoneData.name.last_name = lname.last_name

	PhoneData.phone_number = lphoneNumber

	if contact ~= {} then
		for i=1, #PhoneData.contacts do
			table.insert(vehshop.menu["Repertoire"].buttons, {
							name = PhoneData.contacts[i].first_name.. " " .. PhoneData.contacts[i].last_name,
							description = PhoneData.contacts[i].number
			})
		end

	end

	if sms ~= {} then
		for i=1, #PhoneData.sms do
			table.insert(vehshop.menu["Boite de reception"].buttons, {
							name = PhoneData.sms[i].first_name.. " " .. PhoneData.sms[i].last_name .. " : " .. PhoneData.sms[i].jour .. "/" .. PhoneData.sms[i].mois .. " à " .. PhoneData.sms[i].heure .."h"..PhoneData.sms[i].minute,
							description = PhoneData.sms[i].text
			})
		end
	end

	reloadphone = true

end)

RegisterNetEvent("Iphone:notif")
AddEventHandler("Iphone:notif", function(text)
	ShowNotification(txt)
end)
