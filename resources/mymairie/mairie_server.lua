require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent("mymairie:identity")
AddEventHandler("mymairie:identity",function(prenom, nom, age)
	TriggerEvent('es:getPlayerFromId', source, function(user)
	
	user:removeMoney(100)

	MySQL:executeQuery("UPDATE users SET last_name = '@last_name', first_name = '@first_name', age = '@age' WHERE identifier = '@identifier' ",
					{['@last_name'] = nom , ['@first_name'] = prenom , ['@age'] = age, ['@identifier'] = user.identifier})
				
	end)
		

end)
