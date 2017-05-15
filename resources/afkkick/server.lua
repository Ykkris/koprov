-- White-list AFKKICK
whitelist = {"example1-steamid",
	"example2-steamid",
	"example3-steamid"
	}

RegisterServerEvent("kickForBeingAnAFKDouchebag")
AddEventHandler("kickForBeingAnAFKDouchebag", function()
	afk = true
	TriggerEvent('es:getPlayerFromId', source, function(user)
	for i=1, #whitelist do
		if whitelist[i] == user.identifier then
			afk = false
		end
	end
				
	if afk then
		DropPlayer(source, "Vous êtiez AFK.")
	end
					
	end)
end)
