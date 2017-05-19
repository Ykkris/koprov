require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent("mymairie:identity")
AddEventHandler("mymairie:identity",function(prenom, nom, age)
	TriggerEvent('es:getPlayerFromId', source, function(user)
	RconPrint(tostring(prenom))
	RconPrint(tostring(nom))
	RconPrint(tostring(age))

	local executed_query = MySQL:executeQuery("UPDATE users (`first_name`, `last_name`, `age`) VALUES ('@prenom', '@nom', '@age') WHERE identifier='@identifier'",
												{['@prenom'] = prenom, ['@nom'] = nom, ['@age'] = age, ['@identifier'] = user.identifier})
	end
			end)
