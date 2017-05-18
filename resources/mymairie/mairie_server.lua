require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent("mymairie:identity")
AddEventHandler("mymairie:identity",function(prenom, nom, age)
	RconPrint(tostring(prenom))
	RconPrint(tostring(nom))
	RconPrint(tostring(age))

	local prenom = prenom,
	local nom = nom,
	local age = age,
	local executed_query = MySQL:executeQuery("INSERT INTO users (`prenom`, `nom`, `age`) VALUES ('@prenom', '@nom', '@age')",
												{['@prenom'] = prenom, ['@nom'] = nom, ['age'] = age})

end)