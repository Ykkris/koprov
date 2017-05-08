-- Libre de partager, de modifier. Faites de même :)
-- Free to share, to edit, do the same :)  (For GTA:N users :rofl:)
-- Credits to Maths, Physic and Programming
require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent('mazone:pointclient')
RegisterServerEvent('mazone:sauvegardebdd')

utilise = false
px = {}
py = {}
pz = {}

-- UNE SEULE PERSONNE PEUT UTILISER LA COMMANDE A LA FOIS : pour changer cela, on pourrait ajouter une data dans Player = {...,...,...,...}
TriggerEvent('es:addCommand', 'mazone', function(source, args, user)
	-- L'utilisateur est un administrateur.
	if args[1] == 'commencer' then
		utilise = true
		TriggerClientEvent('mazone:demarrage', source, args)
		TriggerClientEvent('mazone:notification', source, "Demarrage effectué, /mazone point ou /mazone sauvegarder maintenant")
		
	else if (args[1] == 'point' and utilise) then
		TriggerClientEvent('mazone:pointage', source, args)
		else TriggerClientEvent('mazone:notification', source, "Tu n'as même pas initié le pointage !")
		end
	end
	
	if (args[1] == 'sauvegarder' and utilise) then
		if args[2] ~= nil then
			TriggerClientEvent('mazone:sauvegarder', source, args)
			utilise = false
			name = args[2]
			Wait(300)
			px = {}
			py = {}
			pz = {}
		else
			TriggerClientEvent('mazone:notification', source, "Tu n'as pas rentré le nom de ta zone ou ce n'est pas un string : /mazone sauvegarder nom [STRING]")
		end
	else
		TriggerClientEvent('mazone:notification', source, "Tu n'as même pas initié le pointage !")
	end
	
	if (args[1] == 'arret' and utilise) then
		TrigerClientEvent('mazone:arret', source, args)
		utilise = false
		px = {}
		py = {}
		pz = {}
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
	Points[ #Points + 1] = x.point
	Points[ #Points + 1] = y.point
	Points[ #Points + 1] = z.point
	RconPrint("test :"tostring(Points[1]))
	TriggerClientEvent('mazone:notification', source, "Point ajouté ! (/mazone sauvegarder) (/mazone arret)")
end

--function AjouterBDD(Points)

	--local c = #px
	--for i =1 , c do
	
	
		--MySQL:executeQuery("INSERT INTO zones (`nom`, `x`, `y`, `z`) VALUES ('@name', @x, @y, @z)", { ['@nom'] = name, ['@x'] = px[ i ], ['@y'] = py[ i + 1 ], [@z] = pz[ i + 2 ] })
	--end


--end

function AjouterBDD(Points)

    local c = #Points
    for i =1, c ,3 do
        MySQL:executeQuery("INSERT INTO zones (`nom`, `x`, `y`, `z`) VALUES ('@name', @x, @y, @z)",
                  { 
				  ['@nom'] = name,
				  ['@x'] = Points[i], 
				  ['@y'] = Points[i+1], 
				  ['@z'] = Points[i+2] 
				  }
						  )
    end


end
