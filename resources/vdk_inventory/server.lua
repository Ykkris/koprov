require "resources/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)

RegisterServerEvent("item:getItems")
RegisterServerEvent("item:updateQuantity")
RegisterServerEvent("item:setItem")
RegisterServerEvent("item:reset")
RegisterServerEvent("item:sell")
RegisterServerEvent("player:giveItem")
RegisterServerEvent("item:resetoncoma")

local items = {}

AddEventHandler("onResourceStart", function(vdk_inventory)
      Players = {}
      Players = GetPlayers()
      for k in ipairs(Players) do
            
      TriggerEvent("update:getItems", k)
      
      end
        
end)

AddEventHandler("item:getItems", function()
    items = {}
    local player = getPlayerID(source)
    local executed_query = MySQL:executeQuery("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` WHERE user_id = '@username'", { ['@username'] = player })
    local result = MySQL:getResults(executed_query, { 'quantity', 'libelle', 'item_id' }, "item_id")
    if (result) then
        for _, v in ipairs(result) do
            t = { ["quantity"] = v.quantity, ["libelle"] = v.libelle }
            table.insert(items, tonumber(v.item_id), t)
        end
    end
    TriggerClientEvent("gui:getItems", source, items)
end)
    
AddEventHandler("update:getItems", function(player)  -- Ajout pour le OnResourceStart
    items = {}
    local playert = getPlayerID(player)
    local executed_query = MySQL:executeQuery("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` WHERE user_id = '@username'", { ['@username'] = playert })
    local result = MySQL:getResults(executed_query, { 'quantity', 'libelle', 'item_id' }, "item_id")
    if (result) then
        for _, v in ipairs(result) do
            t = { ["quantity"] = v.quantity, ["libelle"] = v.libelle }
            table.insert(items, tonumber(v.item_id), t)
        end
    end
    TriggerClientEvent("gui:getItems", player, items)
end)


AddEventHandler("item:sell", function(id, qty, price)
    TriggerEvent('es:getPlayerFromId', source, function(user)


        ill = isIllegal(id)

        local player = user.identifier
        MySQL:executeQuery("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = '@username' AND `item_id` = @id", { ['@username'] = player, ['@qty'] = tonumber(qty), ['@id'] = tonumber(id) })
        if not(ill) then
            user:addMoney(tonumber(price))
        else
            user:addDirtyMoney(tonumber(price))
        end
    end)
end)

function isIllegal(id)
      
   local executed_query = MySQL:executeQuery("SELECT * FROM items WHERE illegal = '@illegal'' " , { ['@illegal'] = 1 })
        local result = MySQL:getResults(executed_query, {'id'}, "illegal")
      local ill = false
        for i=1, #result, 1 do
            if id == result[i].id then
                ill = true
            end
        end
        return ill 
      
end

AddEventHandler("item:updateQuantity", function(qty, id)
    local player = getPlayerID(source)
    MySQL:executeQuery("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = '@username' AND `item_id` = @id", { ['@username'] = player, ['@qty'] = tonumber(qty), ['@id'] = tonumber(id) })
end)

AddEventHandler("item:reset", function()
    local player = getPlayerID(source)
    MySQL:executeQuery("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = '@username'", { ['@username'] = player, ['@qty'] = 0 })
end)

AddEventHandler("item:resetoncoma", function(playerserverid)
   local player = getPlayerID(playerserverid)
    MySQL:executeQuery("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = '@username'", { ['@username'] = player, ['@qty'] = 0 })         
            
end)

AddEventHandler("item:sell", function(id, qty, price)
    ill = isIllegal(id)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        MySQL:executeQuery("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = '@username' AND `item_id` = @id", { ['@username'] = player, ['@qty'] = tonumber(qty), ['@id'] = tonumber(id) })
                              -- on register les items illégaux (ON PEUT FAIRE BIEN PLUS PROPRE mais je veux faire ça rapide)
        if not(ill) then
        user:addMoney(tonumber(price))
        else user:setDirtyMoney(tonumber(price))
    end)
end)

AddEventHandler("player:giveItem", function(item, name, qty, target)
    local player = getPlayerID(source)
    local executed_query = MySQL:executeQuery("SELECT SUM(quantity) as total FROM user_inventory WHERE user_id = '@username'", { ['@username'] = player })
    local result = MySQL:getResults(executed_query, { 'total' })
    local total = result[1].total
    if (total + qty <= 64) then
        TriggerClientEvent("player:looseItem", source, item, qty)
        TriggerClientEvent("player:receiveItem", target, item, qty)
        TriggerClientEvent("es_freeroam:notify", target, "CHAR_MP_STRIPCLUB_PR", 1, "Mairie", false, "Vous venez de recevoir " .. qty .. " " .. name)
    end
end)

-- get's the player id without having to use bugged essentials
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
