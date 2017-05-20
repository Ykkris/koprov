
------
-- Blanchissement by KoproV.fr
-- Version: v0.0.1
-- Path: client/main.lua
------

RegisterNetEvent("blanchissement:notification")
RegisterNetEvent("blanchissement:receiveblanchissement")
RegisterNetEvent("blanchissement:mission")

-------------------------- HARDCORDIN BE PREPARED ----------------------------
Keys = {
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
--------------------------------------------------------------------------------

zoneBlanchissement = {x = 3597.546, y = 3678.030  , z = 39.808}
zoneRecuperation = {
	{x = 10.0, y = 20.0, z = 30.0},
	{x = 10.0, y = 20.0, z = 30.0},
	{x = 10.0, y = 20.0, z = 30.0}
}
radius = 100.0
isPed = false
sommeMini = 50
alreadySend = false

soulMessage = {"Laisse moi fumer ma beuh man...", "J'suis trop hype, j'peux plus rien pour toi là", "Tu vas me foutre la paix ?.. J'espère qu'elle est grosse la paix", "Dégage de ma vue",
"Tu vas pas me souler toute la journée quand meme ?!", "Un jour, ya un type qui m'a dit que Romain fumait beaucoup trop, j'sais pas perso, on a pas la même visions des choses peut-être",
"On m'a dit que je mettai des H au mot Wait... Foutaise !", "Je rigole bien quand je vois ta sale tronche quand même"}

Citizen.CreateThread(function()

	Citizen.Wait(1000) -- Pour éviter de faire surcharger les données

	local isPlayerNear = IsNear(GetPlayerPed(-1), zoneBlanchissement, radius)

	if isPlayerNear then -- Donc s'il est bien à côté alors :
		isPed = IsSpecificPedHashNearPed(GetPlayerPed(-1), GetHashKey( "a_f_y_hippie_01" ), radius)
		if not(isPed) then

				
			blanchisseuse = CreatePedWithHashAtCoordsAndReturn("a_f_y_hippie_01", zoneBlanchissement.x, zoneBlanchissement.y, zoneBlanchissement.z)

		    SetEntityAsMissionEntity(blanchisseuse, true, true)
		    SetEntityInvincible(blanchisseuse, true)
		    SetEntityProofs(blanchisseuse, 1, 1, 1, 1, 1, 1, 1, 1)

		        -- GetClosestPed(x, y, z, radius, p4, p5, outPed, p7, p8, pedType)
    	end

    	if isNearArea(zoneBlanchissement.x, zoneBlanchissement.y, zoneBlanchissement.z, 15.0) then
    		DrawMissionText("Vous entendez : 'Wouah ! Comment elle est bonne cette beuh !'", 1)
	    	if IsControlJustPressed(1, Keys['E']) then
	    		DrawMissionText("TESTESTSETSETALALALALALALALALALALALALALAALALALLALALALALALALALLALALALAL", 5000)

	    		TriggerServerEvent("blanchissement:sendblanchissement")

	    		while not(received) do
	    			Wait(1000)
	    		end

	    		AddEventHandler("blanchissement:receiveblanchissement", function(argent)
	    			received = true
	    			if argent >= sommeMini then
		    			DrawMissionText("Envois ton numéro gringos, le chef te tiens au courant. Ne rate pas le rendez vous sinon on garde tout.", 5000)
		    			Citizen.Wait(5000)
		    			DrawMissionText("Allez, tires toi maintenant, j'ai d'autres choses à faire.", 4000)
		    			alreadySend = true
		    		else
		    			DrawMissionText("Tu veux que je fasse quoi avec ça ? *rifougne*", 4000)
		    		end

	    		end)

	    	elseif IsControlJustPressed(1, Keys['E']) and isNearArea(zoneBlanchissement.x, zoneBlanchissement.y, zoneBlanchissement.z, 3.0) and alreadySend then
	    		local message = math.random(1, #soulMessage)
	    		DrawMissionText(soulMessage[message], 5000)
	    		Citizen.Wait(5000)
	    	end

	    end
	end

end)

function IsNear(player, point, radius) -- on créer une fonction auxilliaire qu'on pourra ré-utiliser

	local playerCoords =  GetEntityCoords(player, true) -- true pour alive, sinon false qui renvois un Vecteur3 : c'est un array
	local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, point.x, point.y, point.z , true) -- onrécupère la distance entre le joueur et le point de blanchissement

	if distance < radius then -- Si la distance est plus petite que le rayon alors true ou false
		return true
	else
		return false
	end
end 

function IsSpecificPedHashNearPed(player, modelhash, radius)
	Citizen.Trace(tostring(modelhash))
	local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
 	local Count , entity1 = GetClosestPed(playerCoords.x, playerCoords.y, playerCoords.z, 99.99,1,1,-1)
	Citizen.Trace("COUNT :  "..tostring(Count)) -- false
	Citizen.Trace("ENTITY1:  "..tostring(entity1)) -- 0

	if ped == nil then
		return false
	end

	local isSpecificPed = IsPedModel(ped, modelhash)

	Citizen.Trace("ISSPECIFICPED :  "..tostring(isSpecificPed))

	if isSpecificPed then
		return true
	else
		return false
	end

end

function CreatePedWithHashAtCoordsAndReturn(model, x, y, z)
    RequestModel( model)
    hash = GetHashKey( model)
    local i = 0
    while not HasModelLoaded(hash) and i <= 5 do -- On attend qu'il finisse de charger le modèle
        Wait(200)
        i = i+1
    end

    if i == 5 then
        return "Error : Hash not loaded"
    else
        local Ped = CreatePed(5, hash, x, y, z, 0.0 ,true)
    end
    Citizen.Trace("PED :  "..tostring(Ped)) -- nil
    return Ped
end

function DrawMissionText(m_text, showtime)
          ClearPrints()
          SetTextEntry_2("STRING")
          AddTextComponentString(m_text)
          DrawSubtitleTimed(showtime, 1)
end


AddEventHandler("blanchissement:notification", function(text)
	DrawMissionText(text, 4000)

end)

AddEventHandler("blanchissement:mission", function()  -- le joueur à été séléctionné par le serveur
		local time = os.clock()
		DrawMissionText("~HUD_COLOUR_VIDEO_EDITOR_SCORE~ Dépêche toi de venir, je t'envois les données GPS. Dans 15 minutes j'me casse avec le sac.", 20000)
		local random = maths.random(1 , 3)
		local zoneRecupRandom = zoneRecuperation[random]

		Blipvariable = AddBlipForCoord(zoneRecupRandom.x , zoneRecupRandom.y , zoneRecupRandom.z)
		N_0x80ead8e2e1d5d52e(Blipvariable)
		SetBlipRoute(Blipvariable, 1)
		SetBlipRouteColour(Blipvariable, 59)

		Citizen.CreateThread(function()


			if isNearArea(zoneRecupRandom.x , zoneRecupRandom.y , zoneRecupRandom.z) then
				sac = CreateObject(modelHash, zoneRecupRandom.x, zoneRecupRandom.y, zoneRecupRandom.z, true, 1, 1)
				PlaceObjectOnGroundProperly(sac)

				RequestModel(GetHashKey("prop_money_bag_01"))
				while HasModelLoaded(GetHashKey("prop_money_bag_01")) do
					Wait(10)
				end

				sac = CreateAmbientPickup(GetHashKey("PICKUP_MONEY_MED_BAG"), zoneRecupRandom.x, zoneRecupRandom.y, zoneRecupRandom.z, 0, 0, GetHashKey("prop_money_bag_01"), 0, 1)
				
				--CreatePickup(GetHashKey('prop_money_bag_01'), location.x, location.y, location.z)
				while not(HasPickupBeenCollected(sac)) or ((os.clock() - time) > 900) do
					Wait(10)
				end

				if ((os.clock() - time) > 900) then
					DrawMissionText("~HUD_COLOUR_VIDEO_EDITOR_SCORE~ Trop tard, j'me tire avec le sac.", 10000)
				else
					TriggerServerEvent("mission:sendmoney")
				end

				if Blipvariable ~= nil and DoesBlipExist(Blipvariable) then
					Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(Blipvariable))
					Blipvariable = nil
				end
			end
		end)
end)


function isNearArea(x,y,z,radius) -- Je ne vais pas utiliser le z finalement, à voir
	local coords_player = GetEntityCoords(GetPlayerPed(-1), true)
	local x2 = coords_player.x
	local y2 = coords_player.y
	local z2 = coords_player.z
	local dist = GetDistanceBetweenCoords(x, y, z, x2, y2, z2, false)
	

	if dist > radius then
		return false
	else
		return true
	end
end

