--[[
################################################################
- Creator: Ykkris inspired by Jyben & indilo53
- Date: 16/05/2017
- Url: https://koprov.fr
################################################################
--]]

local displayClothingBlips = true
local enableClothingGui = true

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


local clothing = {
	{name="Clothing", id=73, x=74.291, y=-1396.929, z=29.200},
    {name="Clothing", id=73, x=-709.985, y=-153.059, z=36.996},
    {name="Clothing", id=73, x=-163.204, y=-303.837, z=38.724},
    {name="Clothing", id=73, x=426.646, y=-803.452, z=29.338},
    {name="Clothing", id=73, x=-824.193, y=-1074.333, z=11.022},
    {name="Clothing", id=73, x=-1192.098, y=-767.020, z=17.163},
    {name="Clothing", id=73, x=-1450.63, y=-237.126, z=49.185},
    {name="Clothing", id=73, x=-7.777, y=6514.491, z=31.533},
    {name="Clothing", id=73, x=1694.586, y=4825.133, z=42.046},
    {name="Clothing", id=73, x=125.335, y=-225.199, z=54.505},
    {name="Clothing", id=73, x=1196.169, y=2710.895, z=37.866},
    {name="Clothing", id=73, x=-3170.172, y=1043.927, z=20.674},
    {name="Clothing", id=73, x=-1103.373, y=2708.356, z=19.422},
}


Citizen.CreateThread(function()
  if (displayClothingBlips == true) then
    for _, item in pairs(clothing) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
  end
end)

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

local atClothing = false

if enableClothingGui then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if((IsNearClothing()) and (IsPedInAnyVehicle(GetPlayerPed(-1), true) == false)) then
				if(atClothing == false) then
					--TriggerEvent('chatMessage', "", {0, 255, 0}, "^0Press 'Context Action Key' (Default: E) to activate");
				end
				drawTxt("Appuyez sur ~g~E~s~ pour acceder au marchand",0,1,0.5,0.8,0.6,255,255,255,255)
				atClothing = true
				if IsControlJustPressed(1, 38) then
					TriggerEvent('skinchanger:openMenu')
				end
			else
				atClothing = false
			end
		end
	end)
end

function IsNearClothing()
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	for _, item in pairs(clothing) do
		local distance = GetDistanceBetweenCoords(item.x, item.y, item.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
		if(distance <= 9) then
			return true
		end
	end
end