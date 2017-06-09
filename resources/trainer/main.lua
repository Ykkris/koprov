local showtrainer = false --Just Don't Edit!
local draw = false --Just Don't Edit!
local draw2 = false --Just Don't Edit!
local admin = false --Just Don't Edit!
local OnlyForAdmins = true --Set This To "false" To Grant Everyone Access

RegisterNetEvent("admin") --Just Don't Edit!
AddEventHandler("admin", function() --Just Don't Edit!
	admin = true
end)

AddEventHandler("playerSpawned", function(spawn) --Triggers An Event To Checks Your Identifier
	if OnlyForAdmins == true then
		TriggerServerEvent("ID")
	end
end)

Citizen.CreateThread(function() --Disables Controlls Used In The Trainer, When Trainer Is Active
	while true do
		Wait(1)
		if showtrainer == true then
			DisableControlAction(1, 20, true)
			DisableControlAction(1, 21, true)
			DisableControlAction(1, 45, true)
			DisableControlAction(1, 73, true)
			DisableControlAction(1, 74, true)
			DisableControlAction(1, 76, true)
			DisableControlAction(1, 80, true)
			DisableControlAction(1, 85, true)
			DisableControlAction(1, 114, true)
			DisableControlAction(1, 140, true)
		end
	end
end)

AddEventHandler("playerSpawned", function(spawn) --Enables Opening Button Draw After Spawn
	draw = true
end)

Citizen.CreateThread(function() --Draws Instructions Messages When Trainer Is On
	while true do
		Wait(1)
		if OnlyForAdmins == true then
			if admin == true then
				if draw == true then
					DisplayHelpMessage("~INPUT_REPLAY_START_STOP_RECORDING_SECONDARY~ + ~INPUT_REPLAY_START_STOP_RECORDING~ - Open Menu")
				end
				if showtrainer == true then
					if draw == true then
						draw = false
					end
					DisplayHelpMessage("~INPUTGROUP_FRONTEND_DPAD_ALL~ Browse ~INPUT_FRONTEND_ACCEPT~ Select ~INPUT_CELLPHONE_CANCEL~ Back")
					draw2 = true
				end
			end
		else
			if draw == true then
				DisplayHelpMessage("~INPUT_REPLAY_START_STOP_RECORDING_SECONDARY~ + ~INPUT_REPLAY_START_STOP_RECORDING~ - Open Menu")
			end
			if showtrainer == true then
				if draw == true then
					draw = false
				end
				DisplayHelpMessage("~INPUTGROUP_FRONTEND_DPAD_ALL~ Browse ~INPUT_FRONTEND_ACCEPT~ Select ~INPUT_CELLPHONE_CANCEL~ Back")
				draw2 = true
			end
		end
	end
end)

Citizen.CreateThread(function() --Disables Instructions Draw After 30 Seconds
	while true do
		Wait(1)
		if draw == true then
			Citizen.Wait(30000)
			draw = false
		end
	end
end)

Citizen.CreateThread(function() --Disables Instructions Draw After 30 Seconds
	while true do
		Wait(1)
		if draw2 == true then
			Citizen.Wait(30000)
			draw2 = false
		end
	end
end)

--[[Citizen.CreateThread(function() --Just Don't Edit!
	while true do
		Wait(1)
		if showtrainer == false then
			controls3("RB + X or F6 - Open Menu")
		elseif showtrainer == true then
			controls1("DPAD or Arrow Keys - Scroll")
			controls2("A or Enter - Select")
			controls3("B or Backspace - Back")
		end
	end
end)]]

Citizen.CreateThread(function() --Disables Trainer When In Pausemenu
	while true do
		Wait(1)
		local CF = Citizen.InvokeNative(0x2309595AD6145265)
		if (CF == -1171018317) then
			if (showtrainer == true) then
				showtrainer = false
				SendNUIMessage({
					hidetrainer = true
				})
			end
		end
	end
end)

Citizen.CreateThread(function() --Trainer Controls
	while true do
		Wait(1)
		if OnlyForAdmins == true then
			if admin == true then
				local CF = Citizen.InvokeNative(0x2309595AD6145265)
				if not (CF == -1171018317) then
					if IsControlPressed(1, 289) and not blockinput then --F2/ X
						if IsControlJustReleased(1, 288) then --F1/ A
							if not showtrainer then
								Citizen.Wait(125)
								showtrainer = true
								SendNUIMessage({
									showtrainer = true
								})
							else
								showtrainer = false
								SendNUIMessage({
									hidetrainer = true
								})
							end
						end
					end

					if showtrainer and not blockinput then
						if IsDisabledControlJustReleased(1, 176) then -- enter
							SendNUIMessage({
								trainerenter = true
							})
						elseif IsDisabledControlJustReleased(1, 177) then -- back / right click
							SendNUIMessage({
								trainerback = true
							})
						end

						if IsDisabledControlJustReleased(1, 172) then -- up
							SendNUIMessage({
								trainerup = true
							})
						elseif IsDisabledControlJustReleased(1, 173) then -- down
							SendNUIMessage({
								trainerdown = true
							})
						end

						if IsDisabledControlJustReleased(1, 174) then -- left
							SendNUIMessage({
								trainerleft = true
							})
						elseif IsDisabledControlJustReleased(1, 175) then -- right
							SendNUIMessage({
								trainerright = true
							})
						end
					end
				end
			end
		else
			local CF = Citizen.InvokeNative(0x2309595AD6145265)
			if not (CF == -1171018317) then
				if IsControlPressed(1, 289) and not blockinput then --F2/ X
					if IsControlJustReleased(1, 288) then --F1/ A
						if not showtrainer then
							Citizen.Wait(125)
							showtrainer = true
							SendNUIMessage({
								showtrainer = true
							})
						else
							showtrainer = false
							SendNUIMessage({
								hidetrainer = true
							})
						end
					end
				end

				if showtrainer and not blockinput then
					if IsDisabledControlJustReleased(1, 176) then -- enter
						SendNUIMessage({
							trainerenter = true
						})
					elseif IsDisabledControlJustReleased(1, 177) then -- back / right click
						SendNUIMessage({
							trainerback = true
						})
					end

					if IsDisabledControlJustReleased(1, 172) then -- up
						SendNUIMessage({
							trainerup = true
						})
					elseif IsDisabledControlJustReleased(1, 173) then -- down
						SendNUIMessage({
							trainerdown = true
						})
					end

					if IsDisabledControlJustReleased(1, 174) then -- left
						SendNUIMessage({
							trainerleft = true
						})
					elseif IsDisabledControlJustReleased(1, 175) then -- right
						SendNUIMessage({
							trainerright = true
						})
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function() --Get Steam Identifier
	while true do
		Citizen.Wait(1)

		if IsControlPressed(1, 68) then
			if IsControlPressed(1, 44) then
				if IsControlJustReleased(1, 21) then
					TriggerServerEvent("GetID")
					SetNotificationTextEntry("STRING")
					AddTextComponentString("~g~Check your RCON Log!")
					DrawNotification(false, false)
				end
			end
		end			
	end
end)

RegisterNUICallback("playsound", function(data, cb) --Just Don't Edit!
	PlaySoundFrontend(-1, data.name, "HUD_FRONTEND_DEFAULT_SOUNDSET",  true)

	cb("ok")
end)

RegisterNUICallback("trainerclose", function(data, cb) --Just Don't Edit!
	showtrainer = false

	cb("ok")
end)

function drawNotification(text) --Just Don't Edit!
	if OnlyForAdmins == true then
		if admin == true then
			SetNotificationTextEntry("STRING")
			AddTextComponentString(text)
			DrawNotification(false, false)
		end
	else
		SetNotificationTextEntry("STRING")
		AddTextComponentString(text)
		DrawNotification(false, false)
	end
end

function DisplayHelpMessage(text) --Just Don't Edit!
	if OnlyForAdmins == true then
		if admin == true then
			SetTextComponentFormat("STRING")
			AddTextComponentString(text)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
		end
	else
		SetTextComponentFormat("STRING")
		AddTextComponentString(text)
		DisplayHelpTextFromStringLabel(0, 0, 1, -1)
	end
end

--[[function controls1(text) --Just Don't Edit!
	SetTextColour(255, 0, 0, 127)
	SetTextFont(0)
	SetTextScale(0.35, 0.35)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(true)
	SetTextDropshadow(0, 0, 0, 0, 0)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.5, 0.930)
end

function controls2(text)
	SetTextColour(255, 0, 0, 127)
	SetTextFont(0)
	SetTextScale(0.35, 0.35)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(true)
	SetTextDropshadow(0, 0, 0, 0, 0)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.5, 0.950)
end

function controls3(text)
	SetTextColour(255, 0, 0, 127)
	SetTextFont(0)
	SetTextScale(0.35, 0.35)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(true)
	SetTextDropshadow(0, 0, 0, 0, 0)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.5, 0.970)
end]]

function stringsplit(inputstr, sep) --Just Don't Edit!
    if sep == nil then
            sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            t[i] = str
            i = i + 1
    end
    return t
end