ITEMS = {}
NewItems = {}
-- flag to keep track of whether player died to prevent
-- multiple runs of player dead code
local playerdead = false
local maxCapacity = 64
local refreshTime = 60000

-- register events, only needs to be done once
RegisterNetEvent("item:reset")
RegisterNetEvent("item:getItems")
RegisterNetEvent("item:updateQuantity")
RegisterNetEvent("item:setItem")
RegisterNetEvent("item:sell")
RegisterNetEvent("gui:getItems")
RegisterNetEvent("player:receiveItem")
RegisterNetEvent("player:looseItem")
RegisterNetEvent("player:sellItem")


------------------------- EVENTS -------------------------

-- handles when a player spawns either from joining or after death
AddEventHandler("playerSpawned", function()
    TriggerServerEvent("item:getItems")
    -- reset player dead flag
    playerdead = false
end)

AddEventHandler("playerDropped", function()
    updateQuantities()
end)

AddEventHandler("gui:getItems", function(THEITEMS)
    ITEMS = {}
    ITEMS = THEITEMS
end)

AddEventHandler("player:receiveItem", function(item, quantity)
    if (getPods() + quantity <= maxCapacity) then
        item = tonumber(item)
        if (ITEMS[item] == nil) then
            new(item, quantity)
        else
            add({ item, quantity })
        end
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

------------------------- METHODS -------------------------

function sell(arg)
    local itemId = tonumber(arg[1])
    local price = arg[2]
    local item = ITEMS[itemId]
    item.quantity = item.quantity - 1
    NewItems[itemId] = item.quantity
    TriggerServerEvent("item:sell", itemId, item.quantity, price)
    InventoryMenu()
end

function delete(arg)
    local itemId = tonumber(arg[1])
    local qty = arg[2]
    local item = ITEMS[itemId]
    item.quantity = item.quantity - qty
    NewItems[itemId] = item.quantity
    -- TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
    InventoryMenu()
end

function add(arg)
    local itemId = tonumber(arg[1])
    local qty = arg[2]
    local item = ITEMS[itemId]
    item.quantity = item.quantity + qty
    NewItems[itemId] = item.quantity
    -- TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
    InventoryMenu()
end

function new(item, quantity)
    TriggerServerEvent("item:setItem", item, quantity)
    updateQuantities()
    TriggerServerEvent("item:getItems")
end

function give(item)
    local target, distance = GetClosestPlayer()
    if (target ~= nil and distance < 2) then
        DisplayOnscreenKeyboard(true, "FMMC_MPM_NA", "", "", "", "", "", 30)
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0)
            Wait(0);
        end
        if (GetOnscreenKeyboardResult()) then
            local res = tonumber(GetOnscreenKeyboardResult())
            if res ~= nil then
                if (ITEMS[item].quantity - res >= 0) then
                    TriggerServerEvent("player:giveItem", item, ITEMS[item].libelle, res, GetPlayerServerId(player))
                end
            end
        end
    end
end

function updateQuantities()
    for item, quantity in pairs(NewItems) do
        TriggerServerEvent("item:updateQuantity", quantity, item)
    end
end

function PlayerIsDead()
    -- do not run if already ran
    if playerdead then
        return
    end
    TriggerServerEvent("item:reset")
end

function use(item)
    -- local itemId = val[1]
    -- local canUse = val[2]
    -- if canUse ~= 0 then
    --     if canUse == 1 then
    --         drink(itemId)
    --     elseif canUse == 2 then
    --         eat(itemId)
    --     end
    --     TriggerEvent('player:looseItem', itemId, 1)
    -- else
    --     Chat("Cet objet ne fait rien")
    -- end
    if (ITEMS[item].quantity - 1 >= 0) then
        -- Nice var swap for nothing
        TriggerEvent("player:looseItem", item, 1)
        TriggerServerEvent("item:updateQuantity", 1, item)
        -- Calling the Hunger/Thirst
        if ITEMS[item].type == 2 then
            TriggerEvent("food:eat", ITEMS[item])
        elseif ITEMS[item].type == 1 then
            TriggerEvent("food:drink", ITEMS[item])
        else
            -- Any other type? Drugs??????
            Toxicated()
            Citizen.Wait(7000)
            ClearPedTasks(GetPlayerPed(-1))
            Reality()
        end
    end
end

function Toxicated()
    Citizen.Wait(5000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    DoScreenFadeIn(1000)
end

function Reality()
  Citizen.Wait(50000)
  DoScreenFadeOut(1000)
  Citizen.Wait(1000)
  DoScreenFadeIn(1000)
  ClearTimecycleModifier()
  ResetScenarioTypesEnabled()
  ResetPedMovementClipset(GetPlayerPed(-1), 0)
  SetPedIsDrunk(GetPlayerPed(-1), false)
  SetPedMotionBlur(GetPlayerPed(-1), false)
end


function giveMoney()
    local playerNear = getNearPlayer()
    if playerNear then
        DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
        while (UpdateOnscreenKeyboard() == 0) do
            DisableAllControlActions(0);
            Wait(0);
        end
        if (GetOnscreenKeyboardResult()) then
            local res = tonumber(GetOnscreenKeyboardResult())
            if res > 0 then
                TriggerServerEvent("player:swapMoney", res, GetPlayerServerId(playerNear))
            end
        end
    end
end

------------------------- USE SUBMETHODS --------------------------

function eat(item)
    local pid = PlayerPedId()
    RequestAnimDict("mp_player_inteat@burger")
    while (not HasAnimDictLoaded("mp_player_inteat@burger")) do Citizen.Wait(0) end
    TaskPlayAnim(pid, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 1.0, -1.0, 2000, 0, 1, true, true, true)
    TriggerEvent("player:consumeItem", "feed", 20)
end

function drink(item)
    local pid = PlayerPedId()
    RequestAnimDict("amb@world_human_drinking@coffee@male@idle_a")
    while (not HasAnimDictLoaded("amb@world_human_drinking@coffee@male@idle_a")) do Citizen.Wait(0) end
    TaskPlayAnim(pid, 'amb@world_human_drinking@coffee@male@idle_a', 'idle_a', 1.0, -1.0, 2000, 0, 1, true, true, true)
    TriggerEvent("player:consumeItem", "drink", 10)
end

------------------------- EXPORTS METHODS -------------------------

function getQuantity(itemId)
	if(not ITEMS[tonumber(itemId)]) then
		return 0
	else
    	return ITEMS[tonumber(itemId)].quantity
    end
end

function getPods()
    local pods = 0
    for _, v in pairs(ITEMS) do
        pods = pods + v.quantity
    end
    return pods
end

function notFull()
    if (getPods() < maxCapacity) then return true end
end

------------------------- MENU -------------------------

function PersonnalMenu()
    ped = GetPlayerPed(-1);
    MenuTitle="Sac :"
    ClearMenu()
    Menu.addButton("Inventaire", "InventoryMenu", nil)
    -- Menu.addButton("Animations", "animsMenu", nil)
    -- Menu.addButton("Donner argent", "giveMoney", nil)
end

function InventoryMenu()
    ped = GetPlayerPed(-1);
    MenuTitle="Items: " .. (getPods() or 0) .. "/" .. maxCapacity
    ClearMenu()
    for ind, value in pairs(ITEMS) do
        if (value.quantity > 0) then
            Menu.addButton(tostring(value.libelle) .. " : " .. tostring(value.quantity), "ItemMenu", {ind,value.canUse})
        end
    end
end

function ItemMenu(val)
    local itemId = val[1]
    local canUse = val[2]
    ClearMenu()
    MenuTitle="Details :"
    Menu.addButton("Donner", "give", itemId)
    Menu.addButton("Utiliser", "use", itemId)
    Menu.addButton("Supprimer", "delete", { itemId, 1 })
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 167) then
            TriggerServerEvent("item:getItems")
        end
        if IsControlJustPressed(1, 311) then
            PersonnalMenu() -- Menu to draw
            Menu.hidden = not Menu.hidden -- Hide/Show the menu
        end
        Menu.renderGUI() -- Draw menu on each tick if Menu.hidden = false
        if IsEntityDead(PlayerPedId()) then
            PlayerIsDead()
            -- prevent the death check from overloading the server
            playerdead = true
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(refreshTime)
        if NewItems then
            updateQuantities()
        end
        NewItems = {}
    end
end)

------------------------- GENERAL METHODS -------------------------

function GetPlayers()
    local players = {}
    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)
    
    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

function Chat(debugg)
    TriggerEvent("chatMessage", '', { 0, 0x99, 255 }, tostring(debugg))
end
