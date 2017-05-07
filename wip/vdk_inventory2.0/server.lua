require "resources/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)

RegisterServerEvent("item:getItems")
RegisterServerEvent("item:updateQuantity")
RegisterServerEvent("item:setItem")
RegisterServerEvent("item:reset")
RegisterServerEvent("item:sell")

AddEventHandler("item:getItems", function()
    print("item:getItems")
    items = {}
    local player = getPlayerID(source)
    local executed_query = MySQL:executeQuery("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` WHERE user_id = '@username'", { ['@username'] = player })
    local result = MySQL:getResults(executed_query, { 'quantity', 'libelle', 'item_id' }, "item_id")

    if (result) then
        for _, v in ipairs(result) do
            table.insert(items, { name = v.libelle, quantity = v.quantity, id = v.item_id })
        end
    end

    TriggerClientEvent("item:displayInventory", source, items)
end)

--------------J'ai rien touché là dedans---------------
AddEventHandler("item:setItem", function(item, quantity)
    local player = getPlayerID(source)
    MySQL:executeQuery("INSERT INTO user_inventory (`user_id`, `item_id`, `quantity`) VALUES ('@player', @item, @qty)",
        { ['@player'] = player, ['@item'] = item, ['@qty'] = quantity })
end)

AddEventHandler("item:updateQuantity", function(qty, id)
    local player = getPlayerID(source)
    MySQL:executeQuery("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = '@username' AND `item_id` = @id", { ['@username'] = player, ['@qty'] = tonumber(qty), ['@id'] = tonumber(id) })
end)

AddEventHandler("item:reset", function()
    local player = getPlayerID(source)
    MySQL:executeQuery("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = '@username'", { ['@username'] = player, ['@qty'] = 0 })
end)

AddEventHandler("item:sell", function(id, qty, price)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        MySQL:executeQuery("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = '@username' AND `item_id` = @id", { ['@username'] = player, ['@qty'] = tonumber(qty), ['@id'] = tonumber(id) })
        user:addMoney(tonumber(price))
    end)
end)
--------------------------------------------------------

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