
------
-- Blanchissement by KoproV.fr
-- Version: v0.0.1
-- Path: client/main.lua
------
zoneBlanchissement = {x = 3597.546, y = 3678.030  , z = 39.808}
radius = 100.0
isTrevor = false



Citizen.CreateThread(function()
	Citizen.Wait(1000) -- Pour éviter de faire surcharger les données

	local isPlayerNear = isNear(GetPlayerPed(-1))
	Citizen.Trace(isPlayerNear)
	if isPlayerNear then -- Donc s'il est bien à côté alors :
		Citizen.Trace(isTrevor)
		if not(isTrevor) then
			RequestModel( GetHashKey( "Trevor" ) )
			hash = GetHashKey( "Trevor" )

			while not HasModelLoaded( GetHashKey( "Trevor" ) ) do -- On attend qu'il finisse de charger le modèle
		    	Wait(1000)
		    	Citizen.Trace("PAS CHARGE")
			end

			Blanchisseur = CreatePed(28, hash, zoneBlanchissement.x, zoneBlanchissement.y, zoneBlanchissement.y, 0.0 ,true)
			Citizen.Trace("BLANCHISSEUR : ID : "..tostring(Blanchisseur))
	        SetEntityAsMissionEntity(Blanchisseur, true, true)
	        SetEntityInvincible(Blanchisseur, true)
    	end

	end

end)

function isNear(player) -- on créer une fonction auxilliaire qu'on pourra ré-utiliser

	local playerCoords =  GetEntityCoords(player, true) -- true pour alive, sinon false qui renvois un Vecteur3 : c'est un array
	local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, zoneBlanchissement.x, zoneBlanchissement.y, zoneBlanchissement.z , true) -- onrécupère la distance entre le joueur et le point de blanchissement

	if distance < radius then -- Si la distance est plus petite que le rayon alors true ou false
		return true
	else
		return false
	end
end 
