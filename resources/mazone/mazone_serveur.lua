-- Libre de partager, de modifier. Faites de même :)
-- Free to share, to edit, do the same :)  (For GTA:N users :rofl:)
-- Credits to Maths, Physic and Programming
require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('mazone:pointclient')
RegisterServerEvent('bugevent')

utilise = {0, 0}
px = {}
py = {}

-- UNE SEULE PERSONNE PEUT UTILISER LA COMMANDE A LA FOIS : pour changer cela, on pourrait ajouter une data dans Player = {...,...,...,...}
TriggerEvent('es:addCommand', 'mazone', function(source, args, user)
	-- L'utilisateur est un administrateur.
	if args[2] == 'commencer' then
		utilise = {1, 0}
		TriggerClientEvent('mazone:demarrage', source, args)
		TriggerClientEvent('mazone:notification', source, "Demarrage effectué, /mazone point ou /mazone sauvegarder maintenant")
		
	else 
		if (args[2] == 'point' and utilise[1] == 1) then
			TriggerClientEvent('mazone:pointage', source)
		else 
			TriggerClientEvent('mazone:notification', source, "Tu n'as même pas initié le pointage !")
		end
	end
	
	if (args[2] == 'sauvegarder' and utilise[1] == 1) then
		if args[3] ~= nil then
			TriggerClientEvent('mazone:sauvegarder', source)
			utilise = {0, 0}
			name = args[3]
			Wait(1000)
			px = {}
			py = {}
		else
			TriggerClientEvent('mazone:notification', source, "Tu n'as pas rentré le nom de ta zone ou ce n'est pas un string : /mazone sauvegarder nom [STRING]")
		end
	else
		--TriggerClientEvent('mazone:notification', source, "Tu n'as même pas initié le pointage !")
	end
	
	if (args[2] == 'arret' and utilise[1] == 1) then
		TriggerClientEvent('mazone:arret', source, args)
		utilise = {0, 0}
		px = {}
		py = {}
	end
	
end, function(source, args, user) 
     -- L'utilisateur n'a pas la permission.
end)

--function AjoutPoint(point)
	--RconPrint("AJOUT POINT OKOK OK OK OK OK KO KOK OKO KOK OK OK OK KO KO KOK OK")
	--Points[ #Points + 1] = point.x
	--Points[ #Points + 1] = point.y
	--RconPrint("test :"tostring(Points[1]))
	--TriggerClientEvent('mazone:notification', source, "Point ajouté ! (/mazone sauvegarder) (/mazone arret)")
--end

AddEventHandler("mazone:sauvegardebdd", function()
	AjouterBDD(Points)
end)

AddEventHandler('bugevent', function(point)
  RconPrint("ON EST BIEN DANS L EVENT SERVER POINT CLIENT")
	Points[ #Points + 1] = point.x
	Points[ #Points + 1] = point.y
	RconPrint("test :"tostring(Points[1]))
	TriggerClientEvent('mazone:notification', source, "Point ajouté ! (/mazone sauvegarder) (/mazone arret)")
  CancelEvent()
end)


function AjouterBDD(Points)

    local c = #Points
    for i =1, c ,2 do
        MySQL:executeQuery("INSERT INTO zones (`nom`, `x`, `y`) VALUES ('@name', @x, @y)",
                  { 
				  ['@nom'] = name,
				  ['@x'] = Points[i], 
				  ['@y'] = Points[i+1]
				  }
						  )
    end


end
