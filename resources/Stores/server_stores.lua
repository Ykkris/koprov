require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

local wc = 100

RegisterServerEvent('food:menu')
AddEventHandler('food:menu', function(fooditem, vdkinventory)
	if (vdkinventory == false) then
		TriggerEvent('es:getPlayerFromId', source, function(user)
			for k,v in ipairs(fooditems) do
				if (v.name == fooditem) then
					if (user.money >= v.price) then 
						user:removeMoney(v.price)
						if (v.type == 1) then
							TriggerClientEvent("food:vdrink", source, v.value)
						elseif (v.type == 2) then
							TriggerClientEvent("food:veat", source, v.value)
						end
					else
						TriggerClientEvent("pNotify:SetQueueMax", -1, "errorpay", 1)

						for i = 0 , 5 do
							TriggerClientEvent("pNotify:SendNotification", -1, {
								text = "Paiement refusé",
								type = "error",
								queue = "errorpay",
								timeout = 10000,
								layout = "topright"
							})
						end
					end
				end
			end
		end)
	else
		TriggerEvent('es:getPlayerFromId', source, function(user)
			local player = getPlayerID(source)
   			local executed_query = MySQL:executeQuery("SELECT SUM(quantity) as total FROM user_inventory WHERE user_id = '@username'", { ['@username'] = player })
    			local result = MySQL:getResults(executed_query, { 'total' })
			local total = result[1].total
			if (total + fooditem[2] <= 64) then
				if (user.money >= fooditem[3]) then
					user:removeMoney(fooditem[3])
					TriggerClientEvent("player:receiveItem", source, fooditem[1], fooditem[2])
				else
					TriggerClientEvent("pNotify:SetQueueMax", -1, "errorpay", 1)

					for i = 0 , 5 do
						TriggerClientEvent("pNotify:SendNotification", -1, {
							text = "Paiement refusé",
							type = "error",
							queue = "errorpay",
							timeout = 10000,
							layout = "topright"
						})
					end
				end
			else
				TriggerClientEvent("pNotify:SendNotification", -1, "errorpay", 1)

				for i = 0 , 5 do
					TriggerClientEvent("pNotify:SendNotification", -1, {
						text = "Paiement refusé",
						type = "error",
						queue = "errorpay",
						timeout = 10000,
						layout = "topright"
					})
				end
			end
		end)
	end
end)

function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

-- gets the actual player id unique to the player,
-- independent of whether the player changes their screen name
function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end
