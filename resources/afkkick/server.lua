-- White-list AFKKICK
whitelist = {
	"steam:110000101f91cd2",
	"steam:110000104bd6595",
	"steam:110000102f38cb7",
	"steam:110000101889e5e",
	"steam:110000107102B2C",
	"steam:11000010599af76"
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
