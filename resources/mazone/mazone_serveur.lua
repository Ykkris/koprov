-- Libre de partager, de modifier. Faites de même :)
-- Free to share, to edit, do the same :)  (For GTA:N users :rofl:)
-- Credits to Maths, Physic and Programming
require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('mazone:pointclient')
RegisterServerEvent('mazone:sauvegardebdd')

utilise = {0, 0}
px = {}
py = {}

-- UNE SEULE PERSONNE PEUT UTILISER LA COMMANDE A LA FOIS : pour changer cela, on pourrait ajouter une data dans Player = {...,...,...,...}
TriggerEvent('es:addCommand', 'mazone', function(source, args, user)
	-- L'utilisateur est un administrateur.
	RconPrint(tostring(args[1].. "   "..tostring(args[2])))
	if args[2] == 'commencer' then
		utilise = {1, 0}
		TriggerClientEvent('mazone:demarrage', source, args)
		TriggerClientEvent('mazone:notification', source, "Demarrage effectué, /mazone point ou /mazone sauvegarder maintenant")
		
	else 
		RconPrint("utilise : "..tostring(utilise[1]).. " Arg2 : "..tostring(args[2]).. "Et arg1 :".. tostring(args[1]))
		if (args[2] == 'point' and utilise[1] == 1) then
			RconPrint("On est bien dans point et utilisé")
			TriggerClientEvent('mazone:pointage', source)
			RconPrint("On a bien Trigger l'event")
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
		TrigerClientEvent('mazone:arret', source, args)
		utilise = {0, 0}
		px = {}
		py = {}
	end
	
end, function(source, args, user) 
     -- L'utilisateur n'a pas la permission.
end)

AddEventHandler("mazone:sauvegardebdd", function()
	AjouterBDD(Points)
end)

AddEventHandler('mazone:pointclient', function(point)
  AjoutPoint(point)
end)

function AjoutPoint(point)
	Points[ #Points + 1] = point.x
	Points[ #Points + 1] = point.y
	RconPrint("test :"tostring(Points[1]))
	TriggerClientEvent('mazone:notification', source, "Point ajouté ! (/mazone sauvegarder) (/mazone arret)")
end

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
