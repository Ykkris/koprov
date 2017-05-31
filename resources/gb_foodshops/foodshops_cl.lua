local options = {
    x = 0.9,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Superette",
    menu_subtitle = "Articles",
    color_r = 231,
    color_g = 76,
    color_b = 60,
}

local twentyfourseven_shops = {
	{ ['x'] = 1961.1140136719, ['y'] = 3741.4494628906, ['z'] = 32.34375 },
	{ ['x'] = 1392.4129638672, ['y'] = 3604.47265625, ['z'] = 34.980926513672 },
	{ ['x'] = 546.98962402344, ['y'] = 2670.3176269531, ['z'] = 42.156539916992 },
	{ ['x'] = 2556.2534179688, ['y'] = 382.876953125, ['z'] = 108.62294769287 },
	{ ['x'] = -1821.9542236328, ['y'] = 792.40191650391, ['z'] = 138.13920593262 },
	{ ['x'] = 128.1410369873, ['y'] = -1286.1120605469, ['z'] = 29.281036376953 },
	{ ['x'] = -1223.6690673828, ['y'] = -906.67517089844, ['z'] = 12.326356887817 },
	{ ['x'] = -708.19256591797, ['y'] = -914.65264892578, ['z'] = 19.215591430664 },
	{ ['x'] = 26.419162750244, ['y'] = -1347.5804443359, ['z'] = 29.497024536133 },
	{ ['x'] = 373.75271606445, ['y'] = 325.693359375, ['z'] = 103.56635284424 },
	{ ['x'] = -1487.2233886719, ['y'] = -378.98229980469, ['z'] = 40.163433074951 },
	{ ['x'] = 1136.0178222656, ['y'] = -982.22698974609, ['z'] = 46.415855407715 },
	{ ['x'] = 1698.9295654297, ['y'] = 4924.3291015625, ['z'] = 42.063678741455 },
	{ ['x'] = 1729.1203613281, ['y'] = 6414.4052734375, ['z'] = 35.037216186523 },
	{ ['x'] = -2967.9011230469, ['y'] = 390.85437011719, ['z'] = 15.043316841125 },
	{ ['x'] = -47.859222412109, ['y'] = -1757.0224609375, ['z'] = 29.420993804932 },
	{ ['x'] = 2678.6459960938, ['y'] = 3280.6188964844, ['z'] = 55.241119384766 },
	{ ['x'] = 1163.2351074219, ['y'] = -323.1403503418, ['z'] = 69.205139160156 },
}

Citizen.CreateThread(function()
	for k,v in ipairs(twentyfourseven_shops)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, 52)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("FOOD")
		EndTextCommandSetBlipName(blip)
	end
end)

function Main()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
	Notify("~g~Press F2 to open/close")
    options.menu_subtitle = "Categories"
    ClearMenu()
	Menu.addButton("Accessories", "Accessories", nil)
    Menu.addButton("Male models", "MaleMenu", nil)
    Menu.addButton("Female Models", "FemaleMenu", nil)
    Menu.addButton("EMS Models","EMSMenu",nil)
    Menu.addButton("Animals", "AnimalMenu", nil)
    Menu.addButton("Others", "OtherMenu", nil)
end

local showfoodmenu = true
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in ipairs(twentyfourseven_shops) do
			if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 20.0)then
				DrawMarker(1, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 0, 25, 165, 165, 0,0, 0,0)
				if(Vdist(v.x, v.y, v.z, pos.x, pos.y, pos.z) < 1.0)then
					DisplayHelpText("Appuyer sur ~INPUT_CONTEXT~ pour acheter un ~y~menu~w~.")
					if(IsControlJustReleased(1, 51))then
						if showfoodmenu then
							ShopMenu()
							Menu.hidden = false
							showfoodmenu = false
						else
							Menu.hidden = true
							showfoodmenu = true
						end
					end
					Menu.renderGUI(options)
				end
			end
		end
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end