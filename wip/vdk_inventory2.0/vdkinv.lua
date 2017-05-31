ITEMS = {}
-- flag to keep track of whether player died to prevent
-- multiple runs of player dead code
local playerdead = false
local maxCapacity = 64

-- register events, only needs to be done once
RegisterNetEvent("item:reset")
RegisterNetEvent("item:getItems")
RegisterNetEvent("item:updateQuantity")
RegisterNetEvent("item:setItem")
RegisterNetEvent("item:sell")
RegisterNetEvent("item:displayInventory")
RegisterNetEvent("gui:getItems")

---- Kalilz: We dont do that, why would we load the inventory when it's not needed ?
-- handles when a player spawns either from joining or after death
-- AddEventHandler("playerSpawned", function()
--     TriggerServerEvent("item:getItems")
--     -- reset player dead flag
--     playerdead = false
-- end)

-- AddEventHandler("gui:getItems", function(THEITEMS)
--     ITEMS = {}
--     ITEMS = THEITEMS
-- end)

--------------J'ai rien touché là dedans---------------
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
------------------------------------------------------

-------------------Là dedans non plus-----------------
function sell(arg)
    local itemId = tonumber(arg[1])
    local price = arg[2]
    local item = ITEMS[itemId]
    item.quantity = item.quantity - 1
    TriggerServerEvent("item:sell", itemId, item.quantity, price)
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

function add(arg)
    local itemId = tonumber(arg[1])
    local qty = arg[2]
    local item = ITEMS[itemId]
    item.quantity = item.quantity + qty
    TriggerServerEvent("item:updateQuantity", item.quantity, itemId)
    InventoryMenu()
end
------------------------------------------------------

local function LocalPed()
    return GetPlayerPed(-1)
end

local inventory = {
    opened = false,
    title = "inventaire",
    currentmenu = "main",
    lastmenu = nil,
    currentpos = nil,
    selectedbutton = 0,
    marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
    menu = {
        x = 0.9,
        y = 0.2,
        width = 0.2,
        height = 0.04,
        buttons = 10,
        from = 1,
        to = 10,
        scale = 0.4,
        font = 0,
        ["main"] = {
            title = "Objets",
            name = "main",
            buttons = {
            }
        },
    }
}

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

function OpenCreator()
    TriggerServerEvent('item:getItems', source)
end

function Back()
    if backlock then
        return
    end
    backlock = true
    if inventory.currentmenu == "main" then
        CloseCreator()
    end
end

function CloseCreator()
    Citizen.CreateThread(function()
        inventory.opened = false
        inventory.menu.from = 1
        inventory.menu.to = 10
    end)
end

function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function drawMenuButton(button,x,y,selected)
    local menu = inventory.menu
    SetTextFont(menu.font)
    SetTextProportional(0)
    SetTextScale(menu.scale, menu.scale)
    if selected then
        SetTextColour(0, 0, 0, 255)
    else
        SetTextColour(255, 255, 255, 255)
    end
    SetTextCentre(0)
    SetTextEntry("STRING")
    AddTextComponentString(button.name.." : "..button.quantity)
    if selected then
        DrawRect(x,y,menu.width,menu.height,255,255,255,255)
    else
    DrawRect(x,y,menu.width,menu.height,0,0,0,150)
        end
    DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
    local menu = inventory.menu
    SetTextFont(menu.font)
    SetTextProportional(0)
    SetTextScale(0.45, 0.45)
    SetTextColour(255, 255, 255, 255)
    SetTextCentre(0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
    DrawText(0.365, 0.934)
end

function drawMenuRight(txt,x,y,selected)
    local menu = inventory.menu
    SetTextFont(menu.font)
    SetTextProportional(0)
    SetTextScale(menu.scale, menu.scale)
    SetTextRightJustify(1)
    if selected then
        SetTextColour(0, 0, 0, 255)
    else
        SetTextColour(255, 255, 255, 255)
    end
    SetTextCentre(0)
    SetTextEntry("STRING")
    AddTextComponentString(txt)
    DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end

function drawMenuTitle(txt,x,y)
    local menu = inventory.menu
    SetTextFont(2)
    SetTextProportional(0)
    SetTextScale(0.5, 0.5)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    AddTextComponentString(txt)
    DrawRect(x,y,menu.width,menu.height,0,0,0,150)
    DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do 
        count = count + 1 
    end
    return count
end

---- Je garde pour la science
-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         if IsControlJustPressed(1, 311) then
--             InventoryMenu() -- Menu to draw
--             Menu.hidden = not Menu.hidden -- Hide/Show the menu
--         end
--         Menu.renderGUI() -- Draw menu on each tick if Menu.hidden = false
--         if IsEntityDead(PlayerPedId()) then
--             PlayerIsDead()
--             -- prevent the death check from overloading the server
--             playerdead = true
--         end
--     end
-- end)

function PlayerIsDead()
    -- do not run if already ran
    if playerdead then
        return
    end
    TriggerServerEvent("item:reset")
end


AddEventHandler("item:displayInventory", function(buttons)
    inventory.menu["main"].buttons = buttons
    if buttons[1] == nil then
        drawNotification("Votre inventaire est vide")
    else        
        inventory.currentmenu = "main"
        inventory.opened = true
        inventory.selectedbutton = 0
    end

end)


local backlock = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityDead(PlayerPedId()) then
            PlayerIsDead()
            -- prevent the death check from overloading the server
            playerdead = true
        end
        if IsControlJustPressed(1,311) then
            if inventory.opened then
                CloseCreator()
            else
                OpenCreator()
            end
        end   
        if inventory.opened then
            local ped = LocalPed()
            local menu = inventory.menu[inventory.currentmenu]
            drawTxt(inventory.title,1,1,inventory.menu.x,inventory.menu.y,1.0, 255,255,255,255)
            drawMenuTitle(menu.title, inventory.menu.x,inventory.menu.y + 0.08)
            drawTxt(inventory.selectedbutton.."/"..tablelength(menu.buttons),0,0,inventory.menu.x + inventory.menu.width/2 - 0.0385,inventory.menu.y + 0.067,0.4, 255,255,255,255)
            local y = inventory.menu.y + 0.12
            buttoncount = tablelength(menu.buttons)
            local selected = false
            for i,button in pairs(menu.buttons) do
                if i >= inventory.menu.from and i <= inventory.menu.to then
                    if i == inventory.selectedbutton then
                        selected = true
                    else
                        selected = false
                    end

                    drawMenuButton(button,inventory.menu.x,y,selected)
                    y = y + 0.04
                    -- Sélection d'un bouton, désactivé pour l'instant, plus tard ça ammènera à
                    -- des actions sur chacun des objets (Utiliser, Jeter, Donner...)
                    -- if selected and IsControlJustPressed(1,201) then
                    --     ButtonSelected(button)
                    -- end
                end
            end
        end
        if inventory.opened then
            if IsControlJustPressed(1,202) then
                Back()
            end
            if IsControlJustReleased(1,202) then
                backlock = false
            end
            if IsControlJustPressed(1,27) then
                if inventory.selectedbutton > 1 then
                    inventory.selectedbutton = inventory.selectedbutton -1
                    if buttoncount > 10 and inventory.selectedbutton < inventory.menu.from then
                        inventory.menu.from = inventory.menu.from -1
                        inventory.menu.to = inventory.menu.to - 1
                    end
                end
            end
            if IsControlJustPressed(1,173)then
                if inventory.selectedbutton < buttoncount then
                    inventory.selectedbutton = inventory.selectedbutton +1
                    if buttoncount > 10 and inventory.selectedbutton > inventory.menu.to then
                        inventory.menu.to = inventory.menu.to + 1
                        inventory.menu.from = inventory.menu.from + 1
                    end
                end
            end
        end
    end
end)