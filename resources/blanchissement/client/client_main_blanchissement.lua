
------
-- Blanchissement by KoproV.fr
-- Version: v0.0.1
-- Path: client/main.lua
------
zoneBlanchissement = {x = 3597.546, y = 3678.030  , z = 40.808}
radius = 100.0


Citizen.CreateThread(function()
	Citizen.Wait(1000) -- Pour éviter de faire surcharger les données

	local isPlayerNear = isNear(GetPlayerPed(-1))
	if isPlayerNear then -- Donc s'il est bien à côté alors :
		RequestModel( GetHashKey( "Trevor" ) )
		hash = GetHashKey( "Trevor" )

		while not HasModelLoaded( GetHashKey( "Trevor" ) ) ) do -- On attend qu'il finisse de charger le modèle
	    	Wait(0)
		end

		Blanchisseur = CreatePed(28, hash, zoneBlanchissement, 0.0 ,true)
        SetEntityAsMissionEntity(Blanchisseur, true, true)
        SetEntityInvincible(Blanchisseur, true)

	end

end)

function isNear(player) -- on créer une fonction auxilliaire qu'on pourra ré-utiliser

	local playerCoords =  GetEntityCoords(player, true) -- true pour alive, sinon false qui renvois un Vecteur3 : c'est un array
	local distance = GetDistanceBetweenCoords(playerCoords, zoneBlanchissement, true) -- onrécupère la distance entre le joueur et le point de blanchissement

	if distance < radius then -- Si la distance est plus petite que le rayon alors true ou false
		return true
	else
		return false
	end
end 