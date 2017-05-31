ITEMS = {}
-- flag to keep track of whether player died to prevent
-- multiple runs of player dead code
local playerdead = false
local maxCapacity = 60
local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Inventaire",
    menu_subtitle = "Categories",
    color_r = 30,
    color_g = 144,
    color_b = 255,
}

-- register events, only needs to be done once
RegisterNetEvent("item:reset")
RegisterNetEvent("item:getItems")
RegisterNetEvent("item:updateQuantity")
RegisterNetEvent("item:setItem")
RegisterNetEvent("item:sell")
RegisterNetEvent("gui:getItems")
RegisterNetEvent("player:looseItem")
RegisterNetEvent("player:receiveItem")
RegisterNetEvent("player:sellItem")

usableItems = {20,21} -- lister ici les id des items usable, c'est un exemple pour le 1,2,3, plus tard on pourra les récup direct dans le BDD

-- handles when a player spawns either from joining or after death
AddEventHandler("playerSpawned", function()
    TriggerServerEvent("item:getItems")
    -- reset player dead flag
    playerdead = false
end)

AddEventHandler("gui:getItems", function(THEITEMS)
    ITEMS = {}
    ITEMS = THEITEMS
end)

AddEventHandler("player:receiveItem", function(item, quantity)
    item = tonumber(item)
    if (ITEMS[item] == nil) then
        new(item, quantity)
    else
        add({ item, quantity })
    end
end)

AddEventHandler("player:looseItem", function(item, quantity)
    item = tonumber(item)
    if (ITEMS[item].quantity >= quantity) then
        delete({ item, quantity })
    end
end)

AddEventHandler("player:sellItem", function(item, price)
    item = tonumber(item)
    if (ITEMS[item].quantity > 0) then
        sell({ item, price })
    end
end)

RegisterNetEvent("inventory:getItems")
AddEventHandler("inventory:getItems", function(callback, source)
    TriggerServerEvent(callback, ITEMS, source)
end)

function sell(arg)
    local itemId = tonumber(arg[1])
    local price = arg[2]
    local item = ITEMS[itemId]
    item.quantity = item.quantity - 1
    TriggerServerEvent("item:sell", itemId, item.quantity, price)
    Citizen.Trace("item ID : "..tostring(itemId) .. " Item quantitié: " .. tostring(item.quantity) .. " Item price : " .. tostring(item.price))
    InventoryMenu()
end

function delete(arg)
    local itemId = tonumber(arg[1])
    local qty = arg[2]
    local item = ITEMS[itemId]
    item.quantity = item.quantity - qty
    TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
    InventoryMenu()
end

function use(item)
    if (ITEMS[item].quantity - 1 >= 0) then
        TriggerEvent("player:looseItem", item, 1)

        if ITEMS[item].type == 2 then
            TriggerEvent("food:eat", ITEMS[item])
        elseif ITEMS[item].type == 1 then
            TriggerEvent("food:drink", ITEMS[item])
        else
        end
    end
end

function add(arg)
    local itemId = tonumber(arg[1])
    local qty = arg[2]
    local item = ITEMS[itemId]
    item.quantity = item.quantity + qty
    TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
    InventoryMenu()
end

function new(item, quantity)
    TriggerServerEvent("item:setItem", item, quantity)
    TriggerServerEvent("item:getItems")
end

function getQuantity(itemId)
	if(not ITEMS[tonumber(itemId)]) then
		return 0
	else
		return ITEMS[tonumber(itemId)].quantity
	end
end

function notFull()
    local pods = 0
    for _, v in pairs(ITEMS) do
        pods = pods + v.quantity
    end
    if (pods < maxCapacity) then return true end
end

function InventoryMenu()
    ped = GetPlayerPed(-1);
    MenuTitle = "Items:"
    ClearMenu()
    for ind, value in pairs(ITEMS) do
        if (value.quantity > 0) then
            Menu.addButton(tostring(value.libelle) .. " : " .. tostring(value.quantity), "ItemMenu", ind)
        end
    end
end

function ItemMenu(itemId)
    -- found = false
    ClearMenu()
    MenuTitle = "Details:"
    -- for i in usableItems do
	-- if i == itemId then
            Menu.addButton("Utiliser", "use", itemId)
	    -- found = true
	-- end
 --        if found then
	--     break
	-- end
 --    end
    Menu.addButton("Supprimer 1", "delete", { itemId, 1 })
    Menu.addButton("Donner", "give", itemId)
end

function give(item)
    local player = getNearPlayer()
    if (player ~= nil) then
        DisplayOnscreenKeyboard(1, "Quantité :", "", "", "", "", "", 2)
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0);
            Wait(0);
        end
        if (GetOnscreenKeyboardResult()) then
            local res = tonumber(GetOnscreenKeyboardResult())
            if ((ITEMS[item].quantity - res >= 0) and (res>0) ) then
                TriggerServerEvent("player:giveItem", item, ITEMS[item].libelle, res, GetPlayerServerId(player))
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 311) then
            InventoryMenu() -- Menu to draw
            Menu.hidden = not Menu.hidden -- Hide/Show the menu
        end
        Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
        if IsEntityDead(PlayerPedId()) then
            PlayerIsDead()
            -- prevent the death check from overloading the server
            playerdead = true
        end
    end
end)

function PlayerIsDead()
    -- do not run if already ran
    if playerdead then
        return
    end
    TriggerServerEvent("item:reset")
end

function getNearPlayer()
    local players = getPlayers()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local pos2
    local distance
    local minDistance = 3
    local playerNear
    for _, player in pairs(players) do
        pos2 = GetEntityCoords(GetPlayerPed(player))
        distance = GetDistanceBetweenCoords(pos["x"], pos["y"], pos["z"], pos2["x"], pos2["y"], pos2["z"], true)
        if (pos ~= pos2 and distance < minDistance) then
            playerNear = player
            minDistance = distance
        end
    end
    if (minDistance < 3) then
        return playerNear
    end
end

function getPlayers()
    local playerList = {}
    for i = 0, 32 do
        local player = GetPlayerFromServerId(i)
        if NetworkIsPlayerActive(player) then
            table.insert(playerList, player)
        end
    end
    return playerList
end
