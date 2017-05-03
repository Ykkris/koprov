local HasLoadedModel = false;
local Skin           = nil

AddEventHandler('playerSpawned', function(spawn)
	TriggerEvent('skinchanger:LoadDefaultModel', true)
end)

AddEventHandler('skinchanger:modelLoaded', function()
	if not HasLoadedModel then
		TriggerServerEvent('esx_skin:requestPlayerSkinInfos')
		HasLoadedModel = true
	end
end)

AddEventHandler('skinchanger:change', function(skin)
	Skin = skin
end)

RegisterNetEvent('esx_skin:responsePlayerSkinInfos')
AddEventHandler('esx_skin:responsePlayerSkinInfos', function(skin, jobSkin)

	Skin = skin

	if(skin == nil) then
		TriggerEvent('skinchanger:openMenu')
	else
		TriggerEvent('skinchanger:loadSkin', skin)
	end
end)

AddEventHandler('skinchanger:onSubmit', function(skin)
	Skin = skin
	TriggerServerEvent('esx_skin:savePlayerSkinInfos', skin)
	TriggerEvent('skinchanger:closeMenu')
end)

RegisterNetEvent('esx_skin:openSkinMenu')
AddEventHandler('esx_skin:openSkinMenu', function()
	TriggerEvent('skinchanger:openMenuWithArgs', Skin)
end)

RegisterNetEvent('esx_skin:saveSkinRequest')
AddEventHandler('esx_skin:saveSkinRequest', function()
	TriggerServerEvent('esx_skin:saveSkinResponse', Skin)
end)

RegisterNetEvent('esx_skin:loadSkin')
AddEventHandler('esx_skin:loadSkin', function(skin)
	Skin = skin
	TriggerEvent('skinchanger:loadSkin', skin)
end)


RegisterNetEvent('esx_skin:loadJobSkin')
AddEventHandler('esx_skin:loadJobSkin', function(playerSkin, jobSkin)
	
	Skin = {
		sex          = playerSkin['sex'],
		face         = playerSkin['face'],
		skin         = playerSkin['skin'],
		beard_1      = playerSkin['beard_1'],
		beard_2      = playerSkin['beard_2'],
		beard_3      = playerSkin['beard_3'],
		beard_4      = playerSkin['beard_4'],
		hair_1       = playerSkin['hair_1'],
		hair_2       = playerSkin['hair_2'],
		hair_color_1 = playerSkin['hair_color_1'],
		hair_color_2 = playerSkin['hair_color_2'],
		tshirt_1     = jobSkin['tshirt_1'],
		tshirt_2     = jobSkin['tshirt_2'],
		torso_1      = jobSkin['torso_1'],
		torso_2      = jobSkin['torso_2'],
		decals_1     = jobSkin['arms'],
		decals_2     = jobSkin['decals_1'],
		arms         = jobSkin['decals_2'],
		pants_1      = jobSkin['pants_1'],
		pants_2      = jobSkin['pants_2'],
		shoes        = jobSkin['shoes'],
		helmet_1     = jobSkin['helmet_1'],
		helmet_2     = jobSkin['helmet_2'],
		glasses_1    = jobSkin['glasses_1'],
		glasses_2    = jobSkin['glasses_2']
	}

	TriggerEvent('skinchanger:loadClothes', playerSkin, jobSkin)
end)


Citizen.CreateThread(function()
	while true do
		
		Citizen.Wait(0)
		
		if IsEntityDead(GetPlayerPed(-1)) then
			HasLoadedModel = false
		end

	end
end)