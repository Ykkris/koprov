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

local vehshop = {
	opened = false,
	title = "Douane",
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
			title = "Registre",
			name = "main",
			buttons = { 
				{name = "Enregistrez vous", description = ""}
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
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

function OpenCreator()
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end

function ClosedCreator()
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
		DrawRect(x, y, menu.width, menu.height,255,255,255,255)
	else
		DrawRect(x, y, menu.width, menu.height,0,0,0,150)
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
	AddTextComponentString(txt)
	DrawRect(0.675, 0.95, 0.65, 0.050, 0, 0, 0, 150)
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
	DrawText(x + menu.width/2 , y - menu.height/2)
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
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local backlock = false
Citizen.CreateThread(function()
	local x = -1041.089
	local y = -2735.911
	local z = 20.169

	while true do
		Citizen.Wait(1)

		local playerPos = GetEntityCoords(GetPlayerPed(-1), true)

		if (Vdist(playerPos.x, playerPos.y, playerPos.z, x, y, z) < 100.0) then

			DrawMarker(1, x, y, z - 1, 0, 0, 0, 0, 0, 0, 3.0001, 3.0001, 1.5001, 255, 0, 0,200, 0, 0, 0,0)

			if (Vdist(playerPos.x, playerPos.y, playerPos.z, x, y, z) < 2.0) then
				DisplayHelpText("Appuyez sur ~g~E~s~ pour vous enregistrer.")

				if (IsControlJustReleased(1, 38)) then
					if vehshop.opened then
						ClosedCreator()
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
							drawMenuButton(button,vehshop.menu.x,y,selected)

							y = y + 0.04

							if selected and IsControlJustPressed(1, 201) then
								ButtonSelected(button)
							end
						end
					end
				end
				if vehshop.opened then
					if IsControlJustPressed(1,202) then
						Back()
					end
				end
				if IsControlJustReleased(1,202) then
					backlock = false
				end
				if IsControlJustPressed(1,27) then
					if vehshop.selectedbutton > 1 then
						vehshop.selectedbutton = vehshop.selectedbutton -1
						if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
							vehshop.menu.from = vehshop.menu.from -1
							vehshop.menu.to = vehshop.menu.to - 1
						end
					end
				end
				if IsControlJustPressed(1,173)then
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
	end
end)

function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name

	if
		btn == "Enregistrez vous" then EnregistreMoi(btn)
	end
end

function OpenMenu(menu)
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "Enregistrez vous" then
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
		ClosedCreator()
	elseif vehshop.currentmenu ~= "main" then
		OpenMenu(vehshop.lastmenu)
	else
		OpenMenu(vehshop.lastmenu)
	end
end

function EnregistreMoi()

	local editing1 = true
	local editing2 = true
	local quit1 = false
	local quit2 = false

	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "Prénom et Nom : [ESC] pour quitter.", "", "", "", 120)
	while editing1 do
		Wait(0)
		if UpdateOnscreenKeyboard() == 2 then
			editing1 = false
			quit1 = true
		end

		if UpdateOnscreenKeyboard() == 1 then 
			editing1 = false
			resultat1 = GetOnscreenKeyboardResult()
			DisplayHelpText("Entrez maintenant l'âge")
		end
	end

	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "Age : [ESC] pour quitter.", 0, 0, 0, 120)
	while editing2 do
		Wait(0)
		if UpdateOnscreenKeyboard() == 2 then
			editing2 = false
			quit2 = true
		end
		if UpdateOnscreenKeyboard() == 1 then
			editing2 = false
			resultat2 = GetOnscreenKeyboardResult()
			DisplayHelpText("Identité enregistréee.")
		end
	end
	
		if not(quit1) and not(quit2) then
			result = {}
		
			for token in string.gmatch(resultat1, "[^%s]+") do
  				table.insert(result, token)
			end
				
			prenom = result[1]
			nom = result[2]	
			age = resultat2
			--split(resultat1, "")
			--tablenomprenom = split(resultat1, "")
			--prenom = tablenomprenom[1]
			--nom = tablenomprenom[2]
			--age = tostring(resultat2)

			TriggerServerEvent("mymairie:identity", prenom, nom, age)
		end
end

