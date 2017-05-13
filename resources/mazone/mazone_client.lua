-- Libre de partager, de modifier. Faites de même :)
-- Free to share, to edit, do the same :)  (For GTA:N users :rofl:)
-- Credits to Maths, Physic and Programming

utilise = false


RegisterNetEvent('mazone:demarrage')
RegisterNetEvent('mazone:pointage')
RegisterNetEvent('mazone:sauvegarder')
RegisterNetEvent('mazone:notification')
RegisterNetEvent('mazone:arret')

--Citizen.CreateThread( function()
--Citizen.Trace("test")
--Citizen.Wait(5000)
--)
AddEventHandler('mazone:demarrage', function(args)
	utilise = true
end)

AddEventHandler('mazone:pointage', function()
	Citizen.Trace("TEST")
	point = GetEntityCoords(GetPlayerPed(-1))
	Citizen.Trace(tostring(point.x) .." " .. tostring(point.y))
	TriggerServerEvent("mazone:pointclient", point)
	CancelEvent()
end)

AddEventHandler('mazone:sauvegarder', function()
	utilise = false
	TriggerServerEvent("mazone:sauvegardebdd")
	VoirNotification("Vous venez d'enregistrer les points, ") -- Valeur a afficher	
end)

AddEventHandler('mazone:notification', function(text) 
	VoirNotification(text)
end)

AddEventHandler('mazone:arret', function(args) 
	VoirNotification("Tu as effacé tous les points /mazone commencer pour recommencer")
end)

function VoirNotification(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(false, false)
end

function Init()
VoirNotification("Créateur initié, fais '/mazone point' pour créer un point.")
end


--let rec List.filtre (l : list 'a) (x : 'a) : list 'a =        EASTER EGG HERE !
--	match x with
--	| [] -> []
--	| a::q -> if x = a then a::List.filtre q
--				else List.filtre q
