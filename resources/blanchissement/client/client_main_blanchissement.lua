
------
-- Blanchissement by KoproV.fr
-- Version: v0.0.1
-- Path: client/main.lua
------
zoneBlanchissement = {x = 3597.546, y = 3678.030  , z = 39.808}
radius = 100.0
isPed = false



Citizen.CreateThread(function()
	Citizen.Wait(1000) -- Pour éviter de faire surcharger les données

	local isPlayerNear = IsNear(GetPlayerPed(-1))
	if isPlayerNear then -- Donc s'il est bien à côté alors :
		isPed = IsSpecificPedHashNearPed(GetPlayerPed(-1), GetHashKey( "a_f_y_hippie_01" ))
		if not(isPed) then
				RequestModel( GetHashKey( "a_f_y_hippie_01" ) )
				hash = GetHashKey( "a_f_y_hippie_01" )

				while not HasModelLoaded(hash) do -- On attend qu'il finisse de charger le modèle
			    	Wait(1000)
			    	Citizen.Trace("PAS CHARGE")
				end

				Blanchisseur = CreatePed(5, hash, zoneBlanchissement.x, zoneBlanchissement.y, zoneBlanchissement.y, 0.0 ,true)
		        SetEntityAsMissionEntity(Blanchisseur, true, true)
		        SetEntityInvincible(Blanchisseur, true)
		        SetEntityProofs(Blanchisseur, 1, 1, 1, 1, 1, 1, 1, 1)

		        -- GetClosestPed(x, y, z, radius, p4, p5, outPed, p7, p8, pedType)
	    	end
    	end


end)

function IsNear(player) -- on créer une fonction auxilliaire qu'on pourra ré-utiliser

	local playerCoords =  GetEntityCoords(player, true) -- true pour alive, sinon false qui renvois un Vecteur3 : c'est un array
	local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, zoneBlanchissement.x, zoneBlanchissement.y, zoneBlanchissement.z , true) -- onrécupère la distance entre le joueur et le point de blanchissement

	if distance < radius then -- Si la distance est plus petite que le rayon alors true ou false
		return true
	else
		return false
	end
end 

function IsSpecificPedHashNearPed(player, modelhash)
	local playerCoords = GetEntityCoords(player, true)
	local ped = GetClosestPed(playerCoords.x, playerCoords.y, playerCoords.z, radius, 1, 0, 0, 0, -1)

	if ped == nil then
		return false
	end

	local isSpecificPed = IsPedModel(ped, modelhash)

	if isSpecificPed then
		return true
	else
		return false
	end

end
