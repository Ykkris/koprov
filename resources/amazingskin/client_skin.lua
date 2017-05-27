local options = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Model Menu",
    menu_subtitle = "Categories",
    color_r = 231,
    color_g = 76,
    color_b = 60,
}
local c_options = {
    armour = 0,   
    armour_txt = 0,
    hair = 0,
    hcolour = 0,
    shirt = 0,
    shirt_txt = 0,
    pants = 0,
    pants_txt = 0,
    undershirt = 0,
    undershirt_txt = 0,
    shoes = 0,
    shoes_txt = 0,
    hand = 0,
    mask = 0,
    mask_txt = 0,
    head = 0,
    helmet = 0,
    helmet_txt = 0,
    glasses = 0,
    glasses_txt = 0,
    piercing = 0,
    piercing_txt = 0
}
mp_check = false
shirt_help = false
model_info = false
texture_help = false
secondsRemaining = 0
secondsRemaining2 = 0

AddEventHandler('playerSpawned', function(spawn)
    TriggerServerEvent("mm:spawn")
end)

RegisterNetEvent("mm:changemodel")
AddEventHandler("mm:changemodel",function(model)
    changemodel(model,nil)
    Notify("~r~Model loaded")   
end)

RegisterNetEvent("mm:changempmodel")
AddEventHandler("mm:changempmodel",function(model)
    changempmodel(model,nil)
    TriggerServerEvent("mm:spawn2")
    Notify("~r~MP Model loaded")
end)

RegisterNetEvent("mm:changemodelspawn")
AddEventHandler("mm:changemodelspawn",function(model)
    changemodel(model,nil)
    Notify("~r~Model loaded")
end)

RegisterNetEvent("mm:changempmodelspawn")
AddEventHandler("mm:changempmodelspawn",function(model)
    changempmodel(model,nil)
    Notify("~r~MP Model loaded")
    TriggerServerEvent("mm:spawn2")
end)

RegisterNetEvent("mm:firstspawn")
AddEventHandler("mm:firstspawn",function()
    TriggerEvent("pNotify:SendNotification", {text = "<b syle='color:red'>Vous pouvez modifier votre personnage à côté de la mairie !</b>", type = "warning", timeout = 10000, layout = "bottomCenter",})
end)

RegisterNetEvent("mm:changeeverything_spawn") --Sets mask and texture when spawned
AddEventHandler("mm:changeeverything_spawn",function(user)
    c_options.armour = user.armour
    c_options.armour_txt = user.armour_txt
    c_options.hair = user.hair
    c_options.hcolour = user.hcolour
    c_options.shirt = user.shirt
    c_options.shirt_txt = user.shirt_txt
    c_options.pants = user.pants
    c_options.pants_txt = user.pants_txt
    c_options.undershirt = user.undershirt
    c_options.undershirt_txt = user.undershirt_txt
    c_options.shoes = user.shoe
    c_options.shoes_txt = user.shoe_txt
    c_options.hand = user.hand
    c_options.mask = user.mask
    c_options.mask_txt = user.mask
    c_options.head = user.head
    c_options.helmet = user.helmet
    c_options.helmet_txt = user.helmet_txt
    c_options.glasses = user.glasses
    c_options.glasses_txt = user.glasses_txt
    c_options.piercing = user.piercing
    c_options.piercing_txt = user.piercing_txt

    --SetPedComponentVariation(GetPlayerPed(-1), 0, tonumber(user.head), 0, 0) 
    --The laziest way possible of doing this ^_^
    SetPedHeadBlendData(GetPlayerPed(-1), tonumber(c_options.head), tonumber(c_options.head), 0, tonumber(c_options.head), tonumber(c_options.head), 0, 0.5, 0.5, 0.0, false)
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(user.mask), tonumber(user.mask_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(user.hair), tonumber(user.hcolour), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, tonumber(user.shoe), tonumber(user.shoe_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(user.shirt), tonumber(user.shirt_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, tonumber(user.hand), 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, tonumber(user.pants), tonumber(user.pants_txt), 0)    
    SetPedComponentVariation(GetPlayerPed(-1), 8, tonumber(user.undershirt), tonumber(user.undershirt_txt), 0)    
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(user.armour), tonumber(user.armour_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 0, tonumber(user.helmet), tonumber(user.helmet_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 1, tonumber(user.glasses), tonumber(user.glasses_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 2, tonumber(user.piercing), 0, 0)
end)
RegisterNetEvent("mm:changeeverything") --Sets mask and texture when spawned
AddEventHandler("mm:changeeverything",function(user)
	--SetPedComponentVariation(GetPlayerPed(-1), 0, tonumber(user.head), 0, 0)
    --The laziest way possible of doing this ^_^
    SetPedHeadBlendData(GetPlayerPed(-1), tonumber(c_options.head), tonumber(c_options.head), 0, tonumber(c_options.head), tonumber(c_options.head), 0, 0.5, 0.5, 0.0, false) 
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(user.mask), tonumber(user.mask_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(user.hair), tonumber(user.hcolour), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, tonumber(user.shoe), tonumber(user.shoe_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(user.shirt), tonumber(user.shirt_txt), 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, tonumber(user.hand), 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, tonumber(user.pants), tonumber(user.pants_txt), 0)    
    SetPedComponentVariation(GetPlayerPed(-1), 8, tonumber(user.undershirt), tonumber(user.undershirt_txt), 0)    
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(user.armour), tonumber(user.armour_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 0, tonumber(user.helmet), tonumber(user.helmet_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 1, tonumber(user.glasses), tonumber(user.glasses_txt), 0)
    SetPedPropIndex(GetPlayerPed(-1), 2, tonumber(user.piercing), 0, 0)
    --SetPedHeadBlendData(Ped ped, int shapeFirstID, int shapeSecondID, int shapeThirdID, int skinFirstID, int skinSecondID, int skinThirdID, float shapeMix, float skinMix, float thirdMix, BOOL isParent)
   --[[ if(user.head == 2)then
        SetPedHeadBlendData(GetPlayerPed(-1), 23, 3, 0, 23, 3, 0, 0.5, 0.5, 0.0, false)
    end
    if(user.head == 3)then
        SetPedHeadBlendData(GetPlayerPed(-1), 35, 15, 0, 35, 15, 0, 0.5, 0.5, 0.0, false)
    end
    if(user.head == 14)then
        SetPedHeadBlendData(GetPlayerPed(-1), 35, 24, 0, 35, 24, 0, 0.5, 0.5, 0.0, false)
    end
    elseif(user.head == 4)then
        SetPedHeadBlendData(GetPlayerPed(-1), 25, 5, 0, 25, 5, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 5)then
        SetPedHeadBlendData(GetPlayerPed(-1), 29, 11, 0, 29, 11, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 6)then
        SetPedHeadBlendData(GetPlayerPed(-1), 27, 18, 0, 27, 18, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 7)then
        SetPedHeadBlendData(GetPlayerPed(-1), 39, 17, 0, 39, 17, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 8)then
        SetPedHeadBlendData(GetPlayerPed(-1), 30, 19, 0, 30, 19, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 9)then
        SetPedHeadBlendData(GetPlayerPed(-1), 29, 19, 0, 29, 19, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 10)then
        SetPedHeadBlendData(GetPlayerPed(-1), 25, 5, 0, 25, 5, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 11)then
        SetPedHeadBlendData(GetPlayerPed(-1), 26, 19, 0, 26, 19, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 14)then
        SetPedHeadBlendData(GetPlayerPed(-1), 35, 24, 0, 35, 24, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 15)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 16)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 17)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 18)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 19)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 20)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 23)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 24)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 25)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 26)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 27)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 28)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 29)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 30)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 31)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 32)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 35)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 36)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 37)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 38)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false)
    elseif(user.head == 39)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false) 
    elseif(user.head == 40)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false) 
    elseif(user.head == 41)then
        SetPedHeadBlendData(GetPlayerPed(-1), FemaleFace, MaleFace, 0, FemaleFace, MaleFace, 0, 0.5, 0.5, 0.0, false) --34
    else
    end--]]
end)

function changemodel(model)
    
    local modelhashed = GetHashKey(model)

    RequestModel(modelhashed)
    while not HasModelLoaded(modelhashed) do 
        RequestModel(modelhashed)
        Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), modelhashed)
    SetPedRandomComponentVariation(GetPlayerPed(-1), true)
    local a = "" -- nil doesnt work
    SetModelAsNoLongerNeeded(modelhashed)
    mp_check = false
end

function changempmodel(model)
    
    local modelhashed = GetHashKey(model)

    RequestModel(modelhashed)
    while not HasModelLoaded(modelhashed) do 
        RequestModel(modelhashed)
        Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), modelhashed)
    local a = "" -- nil doesnt work
    SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 0)
    if model == 'mp_f_freemode_01' then
        SetPedComponentVariation(GetPlayerPed(-1), 0, 34, 0, 0)
    end
    SetModelAsNoLongerNeeded(modelhashed)
    mp_check = true
end

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function savemodel(model)
    TriggerServerEvent("mm:savemodel", model)
end

function savempmodel(model)
    TriggerServerEvent("mm:savempmodel", model)
end

function checkCustomisation()
    TriggerServerEvent("mm:checkCustomisation")
end

RegisterNetEvent("mm:Customisationisagogogo")
AddEventHandler("mm:Customisationisagogogo",function()
    GCustomisation()
    mp_check = true
end)

RegisterNetEvent("mm:Customisationisanonono")
AddEventHandler("mm:Customisationisanonono",function()
    mp_check = false
    model_info = true
    secondsRemaining = 10
    TriggerServerEvent("mm:timer")
end)

RegisterNetEvent("mm:timerend")
AddEventHandler("mm:timerend",function()
    model_info = false
end)

RegisterNetEvent("mm:timerend2")
AddEventHandler("mm:timerend2",function()
    mp_check_message = false
end)

function Main()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    Notify("Press ~r~E ~w~to ~g~open~w~/~r~close~w~!")
    Notify("~w~Press ~g~F ~w~to ~g~save~w~!")
    options.menu_title = "Model Menu"
    options.menu_subtitle = "Categories"
    ClearMenu()
    Menu.addButton("Skins", "MPMenu", nil)
    Menu.addButton("Personnalisation", "checkCustomisation", nil)
end

function GCustomisation()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_title = "Gender?"
    options.menu_subtitle = "Categories"
    ClearMenu()
    Menu.addButton("Male", "Customisation", nil)
    Menu.addButton("Female", "FCustomisation", nil)
    Menu.addButton("Return", "Main", nil)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Others Menu        Page 1/2
--Multiplayer Models
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MPMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "MP Models               Page 1 of 2"
    ClearMenu()
    Menu.addButton(mp_models[Menu.buttonCount+1], "savempmodel", mp_models[Menu.buttonCount+1])
    Menu.addButton(mp_models[Menu.buttonCount+1], "savempmodel", mp_models[Menu.buttonCount+1])
    Menu.addButton("Return","Main",nil)
end
--[[
     _                                    _           
    / \   ___ ___ ___  ___ ___  ___  _ __(_) ___  ___ 
   / _ \ / __/ __/ _ \/ __/ __|/ _ \| '__| |/ _ \/ __|
  / ___ \ (_| (_|  __/\__ \__ \ (_) | |  | |  __/\__ \
 /_/   \_\___\___\___||___/___/\___/|_|  |_|\___||___/
                                                      
]]

function Accessories()
    texture_help = false
    options.menu_subtitle = "Male Accessories"
    ClearMenu()
    Menu.addButton("Helmet/Hats", "HelmetMenu")
    Menu.addButton("Glasses", "GlassesMenu")
    Menu.addButton("Earrings", "PiercingMenu")
    Menu.addButton("Masks", "MaskMenu")
    Menu.addButton("Remove Accessories", "RemoveAccessories")
    Menu.addButton("Return","Customisation",nil)
end

function FAccessories()
    texture_help = false
    options.menu_subtitle = "Female Accessories"
    ClearMenu()
    Menu.addButton("Helmet/Hats", "FemaleHelmetMenu")
    Menu.addButton("Glasses", "FemaleGlassesMenu")
    Menu.addButton("Earrings", "FemalePiercingMenu")
    Menu.addButton("Masks", "FMaskMenu")
    Menu.addButton("Remove Accessories", "FRemoveAccessories")
    Menu.addButton("Return","FCustomisation",nil)
end

function RemoveAccessories()
    options.menu_subtitle = "Accessories"
    ClearMenu()
    Menu.addButton("Remove hat", "riphat",nil)
    Menu.addButton("Remove glasses", "ripglasses",nil)
    Menu.addButton("Remove earrings", "ripearrings",nil)
    Menu.addButton("Remove mask", "ripmask",nil)
    Menu.addButton("Return","Accessories",nil)
end

function FRemoveAccessories()
    options.menu_subtitle = "Accessories"
    ClearMenu()
    Menu.addButton("Remove hat", "riphat",nil)
    Menu.addButton("Remove glasses", "ripglasses",nil)
    Menu.addButton("Remove earrings", "ripearrings",nil)
    Menu.addButton("Remove mask", "ripmask",nil)
    Menu.addButton("Return","FAccessories",nil)
end

function riphat()
    c_options.helmet = 240
    ClearPedProp(GetPlayerPed(-1),0)
end
function ripglasses()
    c_options.glasses = 240
    ClearPedProp(GetPlayerPed(-1),1)
end
function ripearrings()
    ClearPedProp(GetPlayerPed(-1),2)
end
function ripmask()
    c_options.mask = 0
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(c_options.mask), 0, 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 1/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function MaskMenu()
    texture_help = true
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 1 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "savemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu2",nil)
    Menu.addButton("Previous Page","MaskMenu9",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 2/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu2()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 2 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "savemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu3",nil)
    Menu.addButton("Previous Page","MaskMenu",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 3/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu3()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 3 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "savemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu4",nil)
    Menu.addButton("Previous Page","MaskMenu2",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 4/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu4()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 4 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "savemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu5",nil)
    Menu.addButton("Previous Page","MaskMenu3",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 5/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu5()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 5 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "savemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu6",nil)
    Menu.addButton("Previous Page","MaskMenu4",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 6/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu6()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 6 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "savemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu7",nil)
    Menu.addButton("Previous Page","MaskMenu5",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 7/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu7()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 7 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "savemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu8",nil)
    Menu.addButton("Previous Page","MaskMenu6",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 8/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu8()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 8 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "savemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu9",nil)
    Menu.addButton("Previous Page","MaskMenu7",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 9/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaskMenu9()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 9 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "savemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu",nil)
    Menu.addButton("Previous Page","MaskMenu8",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 1/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function maskTextures()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 1 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","maskTextures2",nil)
    Menu.addButton("Previous Page","maskTextures4",nil)
    Menu.addButton("Return","MaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 2/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function maskTextures2()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 2 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","maskTextures3",nil)
    Menu.addButton("Previous Page","maskTextures",nil)
    Menu.addButton("Return","MaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 3/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function maskTextures3()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 3 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","maskTextures4",nil)
    Menu.addButton("Previous Page","maskTextures2",nil)
    Menu.addButton("Return","MaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu                     Page 4/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function maskTextures4()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 4 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg4[Menu.buttonCount+1], "savetxt", ass.txt_pg4[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg4[Menu.buttonCount+1], "savetxt", ass.txt_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","maskTextures",nil)
    Menu.addButton("Previous Page","maskTextures3",nil)
    Menu.addButton("Return","MaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 1/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function FMaskMenu()
    texture_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 1 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "fsavemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "fsavemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "fsavemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "fsavemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "fsavemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "fsavemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "fsavemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg1[Menu.buttonCount+1], "fsavemask", ass.masks_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","FMaskMenu2",nil)
    Menu.addButton("Previous Page","FMaskMenu9",nil)
    Menu.addButton("Return","FAccessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 2/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FMaskMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 2 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "fsavemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "fsavemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "fsavemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "fsavemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "fsavemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "fsavemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "fsavemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg2[Menu.buttonCount+1], "fsavemask", ass.masks_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FMaskMenu3",nil)
    Menu.addButton("Previous Page","FMaskMenu",nil)
    Menu.addButton("Return","FAccessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 3/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FMaskMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 3 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "fsavemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "fsavemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "fsavemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "fsavemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "fsavemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "fsavemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "fsavemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg3[Menu.buttonCount+1], "fsavemask", ass.masks_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaskMenu4",nil)
    Menu.addButton("Previous Page","MaskMenu2",nil)
    Menu.addButton("Return","Accessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 4/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FMaskMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 4 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "fsavemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "fsavemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "fsavemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "fsavemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "fsavemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "fsavemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "fsavemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg4[Menu.buttonCount+1], "fsavemask", ass.masks_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","FMaskMenu5",nil)
    Menu.addButton("Previous Page","FMaskMenu3",nil)
    Menu.addButton("Return","FAccessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 5/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FMaskMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 5 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "fsavemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "fsavemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "fsavemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "fsavemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "fsavemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "fsavemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "fsavemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg5[Menu.buttonCount+1], "fsavemask", ass.masks_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","FMaskMenu6",nil)
    Menu.addButton("Previous Page","FMaskMenu4",nil)
    Menu.addButton("Return","FAccessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 6/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FMaskMenu6()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 6 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "fsavemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "fsavemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "fsavemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "fsavemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "fsavemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "fsavemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "fsavemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg6[Menu.buttonCount+1], "fsavemask", ass.masks_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","FMaskMenu7",nil)
    Menu.addButton("Previous Page","FMaskMenu5",nil)
    Menu.addButton("Return","FAccessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 7/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FMaskMenu7()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 7 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "fsavemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "fsavemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "fsavemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "fsavemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "fsavemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "fsavemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "fsavemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg7[Menu.buttonCount+1], "fsavemask", ass.masks_pg7[Menu.buttonCount+1])
    Menu.addButton("Next Page","FMaskMenu8",nil)
    Menu.addButton("Previous Page","FMaskMenu6",nil)
    Menu.addButton("Return","FAccessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 8/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FMaskMenu8()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 8 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "fsavemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "fsavemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "fsavemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "fsavemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "fsavemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "fsavemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "fsavemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg8[Menu.buttonCount+1], "fsavemask", ass.masks_pg8[Menu.buttonCount+1])
    Menu.addButton("Next Page","FMaskMenu9",nil)
    Menu.addButton("Previous Page","FMaskMenu7",nil)
    Menu.addButton("Return","FAccessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 9/9
--Masks
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FMaskMenu9()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Masks                   Page 9 of 9"
    ClearMenu()
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "fsavemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "fsavemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "fsavemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "fsavemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "fsavemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "fsavemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "fsavemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton(acc.masks_pg9[Menu.buttonCount+1], "fsavemask", ass.masks_pg9[Menu.buttonCount+1])
    Menu.addButton("Next Page","FMaskMenu",nil)
    Menu.addButton("Previous Page","FMaskMenu8",nil)
    Menu.addButton("Return","FAccessories",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 1/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fmaskTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 1 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg1[Menu.buttonCount+1], "savetxt", ass.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","fmaskTextures2",nil)
    Menu.addButton("Previous Page","fmaskTextures4",nil)
    Menu.addButton("Return","FMaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 2/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fmaskTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 2 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg2[Menu.buttonCount+1], "savetxt", ass.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","fmaskTextures3",nil)
    Menu.addButton("Previous Page","fmaskTextures",nil)
    Menu.addButton("Return","FMaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 3/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fmaskTextures3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 3 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg3[Menu.buttonCount+1], "savetxt", ass.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","fmaskTextures4",nil)
    Menu.addButton("Previous Page","fmaskTextures2",nil)
    Menu.addButton("Return","FMaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu Female                     Page 4/4
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fmaskTextures4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 4 of 4"
    ClearMenu()
    Menu.addButton(ass.txt_pg4[Menu.buttonCount+1], "savetxt", ass.txt_pg4[Menu.buttonCount+1])
    Menu.addButton(ass.txt_pg4[Menu.buttonCount+1], "savetxt", ass.txt_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","fmaskTextures",nil)
    Menu.addButton("Previous Page","fmaskTextures3",nil)
    Menu.addButton("Return","FMaskMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Mask Menu             --Credit to izio38 for helping me with one of my annoying errors :)
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savemask(mask) --Sets Players mask in database
    c_options.mask = mask
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(c_options.mask), 0, 0)
    maskTextures()
end

function fsavemask(mask) --Sets Players mask in database
    c_options.mask = mask
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(c_options.mask), 0, 0)
    fmaskTextures()
end

function savetxt(mask_txt) --Sets mask texture in database
    c_options.mask_txt = mask_txt
    SetPedComponentVariation(GetPlayerPed(-1), 1, tonumber(c_options.mask), tonumber(c_options.mask_txt), 0)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/5
--Helmet Menu
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HelmetMenu()
    texture_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmets                 Page 1 of 5"
    ClearMenu()
    Menu.addButton(hat.name[Menu.buttonCount+1], "sethelmet", hat.drawable[Menu.buttonCount+1])
    Menu.addButton(hat.name[Menu.buttonCount+1], "sethelmet", hat.drawable[Menu.buttonCount+1])
    Menu.addButton(hat.name[Menu.buttonCount+1], "sethelmet", hat.drawable[Menu.buttonCount+1])
    Menu.addButton(hat.name[Menu.buttonCount+1], "sethelmet", hat.drawable[Menu.buttonCount+1])
    Menu.addButton(hat.name[Menu.buttonCount+1], "sethelmet", hat.drawable[Menu.buttonCount+1])
    Menu.addButton(hat.name[Menu.buttonCount+1], "sethelmet", hat.drawable[Menu.buttonCount+1])
    Menu.addButton(hat.name[Menu.buttonCount+1], "sethelmet", hat.drawable[Menu.buttonCount+1])
    Menu.addButton(hat.name[Menu.buttonCount+1], "sethelmet", hat.drawable[Menu.buttonCount+1])
    Menu.addButton("Next Page","HelmetMenu2",nil)
    Menu.addButton("Previous Page","HelmetMenu5",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 2/5
--Helmet Menu
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HelmetMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmets                 Page 2 of 5"
    ClearMenu()
    Menu.addButton(hat.name2[Menu.buttonCount+1], "sethelmet", hat.drawable2[Menu.buttonCount+1])
    Menu.addButton(hat.name2[Menu.buttonCount+1], "sethelmet", hat.drawable2[Menu.buttonCount+1])
    Menu.addButton(hat.name2[Menu.buttonCount+1], "sethelmet", hat.drawable2[Menu.buttonCount+1])
    Menu.addButton(hat.name2[Menu.buttonCount+1], "sethelmet", hat.drawable2[Menu.buttonCount+1])
    Menu.addButton(hat.name2[Menu.buttonCount+1], "sethelmet", hat.drawable2[Menu.buttonCount+1])
    Menu.addButton(hat.name2[Menu.buttonCount+1], "sethelmet", hat.drawable2[Menu.buttonCount+1])
    Menu.addButton("Next Page","HelmetMenu3",nil)
    Menu.addButton("Previous Page","HelmetMenu",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 3/5
--Helmet Menu
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HelmetMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmets                 Page 3 of 5"
    ClearMenu()
    Menu.addButton(hat.name3[Menu.buttonCount+1], "sethelmet", hat.drawable3[Menu.buttonCount+1])
    Menu.addButton(hat.name3[Menu.buttonCount+1], "sethelmet", hat.drawable3[Menu.buttonCount+1])
    Menu.addButton(hat.name3[Menu.buttonCount+1], "sethelmet", hat.drawable3[Menu.buttonCount+1])
    Menu.addButton(hat.name3[Menu.buttonCount+1], "sethelmet", hat.drawable3[Menu.buttonCount+1])
    Menu.addButton(hat.name3[Menu.buttonCount+1], "sethelmet", hat.drawable3[Menu.buttonCount+1])
    Menu.addButton(hat.name3[Menu.buttonCount+1], "sethelmet", hat.drawable3[Menu.buttonCount+1])
    Menu.addButton(hat.name3[Menu.buttonCount+1], "sethelmet", hat.drawable3[Menu.buttonCount+1])
    Menu.addButton(hat.name3[Menu.buttonCount+1], "sethelmet", hat.drawable3[Menu.buttonCount+1])
    Menu.addButton("Next Page","HelmetMenu4",nil)
    Menu.addButton("Previous Page","HelmetMenu2",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 4/5
--Helmet Menu
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HelmetMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmets                 Page 4 of 5"
    ClearMenu()
    Menu.addButton(hat.name4[Menu.buttonCount+1], "sethelmet", hat.drawable4[Menu.buttonCount+1])
    Menu.addButton(hat.name4[Menu.buttonCount+1], "sethelmet", hat.drawable4[Menu.buttonCount+1])
    Menu.addButton(hat.name4[Menu.buttonCount+1], "sethelmet", hat.drawable4[Menu.buttonCount+1])
    Menu.addButton(hat.name4[Menu.buttonCount+1], "sethelmet", hat.drawable4[Menu.buttonCount+1])
    Menu.addButton(hat.name4[Menu.buttonCount+1], "sethelmet", hat.drawable4[Menu.buttonCount+1])
    Menu.addButton(hat.name4[Menu.buttonCount+1], "sethelmet", hat.drawable4[Menu.buttonCount+1])
    Menu.addButton(hat.name4[Menu.buttonCount+1], "sethelmet", hat.drawable4[Menu.buttonCount+1])
    Menu.addButton(hat.name4[Menu.buttonCount+1], "sethelmet", hat.drawable4[Menu.buttonCount+1])
    Menu.addButton("Next Page","HelmetMenu5",nil)
    Menu.addButton("Previous Page","HelmetMenu3",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 5/5
--Helmet Menu
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HelmetMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmets                 Page 5 of 5"
    ClearMenu()
    Menu.addButton(hat.name5[Menu.buttonCount+1], "sethelmet", hat.drawable5[Menu.buttonCount+1])
    Menu.addButton(hat.name5[Menu.buttonCount+1], "sethelmet", hat.drawable5[Menu.buttonCount+1])
    Menu.addButton("Next Page","HelmetMenu",nil)
    Menu.addButton("Previous Page","HelmetMenu4",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/5
--Helmets Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHelmetMenu()
    texture_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmets                 Page 1 of 5"
    ClearMenu()
    Menu.addButton(hat.fname[Menu.buttonCount+1], "fsethelmet", hat.fdrawable[Menu.buttonCount+1])
    Menu.addButton(hat.fname[Menu.buttonCount+1], "fsethelmet", hat.fdrawable[Menu.buttonCount+1])
    Menu.addButton(hat.fname[Menu.buttonCount+1], "fsethelmet", hat.fdrawable[Menu.buttonCount+1])
    Menu.addButton(hat.fname[Menu.buttonCount+1], "fsethelmet", hat.fdrawable[Menu.buttonCount+1])
    Menu.addButton(hat.fname[Menu.buttonCount+1], "fsethelmet", hat.fdrawable[Menu.buttonCount+1])
    Menu.addButton(hat.fname[Menu.buttonCount+1], "fsethelmet", hat.fdrawable[Menu.buttonCount+1])
    Menu.addButton(hat.fname[Menu.buttonCount+1], "fsethelmet", hat.fdrawable[Menu.buttonCount+1])
    Menu.addButton(hat.fname[Menu.buttonCount+1], "fsethelmet", hat.fdrawable[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHelmetMenu2",nil)
    Menu.addButton("Previous Page","FemaleHelmetMenu5",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 2/5
--Helmets Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHelmetMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmets                 Page 2 of 5"
    ClearMenu()
    Menu.addButton(hat.fname2[Menu.buttonCount+1], "fsethelmet", hat.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(hat.fname2[Menu.buttonCount+1], "fsethelmet", hat.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(hat.fname2[Menu.buttonCount+1], "fsethelmet", hat.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(hat.fname2[Menu.buttonCount+1], "fsethelmet", hat.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(hat.fname2[Menu.buttonCount+1], "fsethelmet", hat.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(hat.fname2[Menu.buttonCount+1], "fsethelmet", hat.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(hat.fname2[Menu.buttonCount+1], "fsethelmet", hat.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(hat.fname2[Menu.buttonCount+1], "fsethelmet", hat.fdrawable2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHelmetMenu3",nil)
    Menu.addButton("Previous Page","FemaleHelmetMenu",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 3/5
--Helmets Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHelmetMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmets                 Page 3 of 5"
    ClearMenu()
    Menu.addButton(hat.fname3[Menu.buttonCount+1], "fsethelmet", hat.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(hat.fname3[Menu.buttonCount+1], "fsethelmet", hat.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(hat.fname3[Menu.buttonCount+1], "fsethelmet", hat.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(hat.fname3[Menu.buttonCount+1], "fsethelmet", hat.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(hat.fname3[Menu.buttonCount+1], "fsethelmet", hat.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(hat.fname3[Menu.buttonCount+1], "fsethelmet", hat.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(hat.fname3[Menu.buttonCount+1], "fsethelmet", hat.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(hat.fname3[Menu.buttonCount+1], "fsethelmet", hat.fdrawable3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHelmetMenu4",nil)
    Menu.addButton("Previous Page","FemaleHelmetMenu2",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 4/5
--Helmets Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHelmetMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmets                 Page 4 of 5"
    ClearMenu()
    Menu.addButton(hat.fname4[Menu.buttonCount+1], "fsethelmet", hat.fdrawable4[Menu.buttonCount+1])
    Menu.addButton(hat.fname4[Menu.buttonCount+1], "fsethelmet", hat.fdrawable4[Menu.buttonCount+1])
    Menu.addButton(hat.fname4[Menu.buttonCount+1], "fsethelmet", hat.fdrawable4[Menu.buttonCount+1])
    Menu.addButton(hat.fname4[Menu.buttonCount+1], "fsethelmet", hat.fdrawable4[Menu.buttonCount+1])
    Menu.addButton(hat.fname4[Menu.buttonCount+1], "fsethelmet", hat.fdrawable4[Menu.buttonCount+1])
    Menu.addButton(hat.fname4[Menu.buttonCount+1], "fsethelmet", hat.fdrawable4[Menu.buttonCount+1])
    Menu.addButton(hat.fname4[Menu.buttonCount+1], "fsethelmet", hat.fdrawable4[Menu.buttonCount+1])
    Menu.addButton(hat.fname4[Menu.buttonCount+1], "fsethelmet", hat.fdrawable4[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHelmetMenu5",nil)
    Menu.addButton("Previous Page","FemaleHelmetMenu3",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 5/5
--Helmets Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHelmetMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmets                 Page 5 of 5"
    ClearMenu()
    Menu.addButton(hat.fname5[Menu.buttonCount+1], "fsethelmet", hat.fdrawable5[Menu.buttonCount+1])
    Menu.addButton(hat.fname5[Menu.buttonCount+1], "fsethelmet", hat.fdrawable5[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHelmetMenu",nil)
    Menu.addButton("Previous Page","FemaleHelmetMenu4",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/2
--Helmet Menu
--Textures
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function helmetTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmet Textures         Page 1 of 2"
    ClearMenu()
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton("Next Page","helmetTextures2",nil)
    Menu.addButton("Previous Page","helmetTextures",nil)
    Menu.addButton("Return to male section","HelmetMenu",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 2/2
--Helmet Menu
--Textures
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function helmetTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmet textures         Page 2 of 2"
    ClearMenu()
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton("Next Page","helmetTextures",nil)
    Menu.addButton("Previous Page","helmetTextures",nil)
    Menu.addButton("Return to male section","HelmetMenu",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/2
--Helmet Menu
--Textures
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fhelmetTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmet Textures         Page 1 of 2"
    ClearMenu()
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton(hat.texture[Menu.buttonCount+1], "sethelmet_txt", hat.texture[Menu.buttonCount+1])
    Menu.addButton("Next Page","fhelmetTextures2",nil)
    Menu.addButton("Previous Page","fhelmetTextures",nil)
    Menu.addButton("Return","FemaleHelmetMenu",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 2/2
--Helmet Menu
--Textures
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fhelmetTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Helmet textures         Page 2 of 2"
    ClearMenu()
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton(hat.texture2[Menu.buttonCount+1], "sethelmet_txt", hat.texture2[Menu.buttonCount+1])
    Menu.addButton("Next Page","fhelmetTextures",nil)
    Menu.addButton("Previous Page","fhelmetTextures",nil)
    Menu.addButton("Return","FemaleHelmetMenu",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Hat/Helmet Functions
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function sethelmet(helmet)
    c_options.helmet = helmet
    --c_options.helmet_txt = helmet_txt
    SetPedPropIndex(GetPlayerPed(-1), 0, tonumber(c_options.helmet), 0, 0)
    helmetTextures()
end

function fsethelmet(helmet)
    c_options.helmet = helmet
    --c_options.helmet_txt = helmet_txt
    SetPedPropIndex(GetPlayerPed(-1), 0, tonumber(c_options.helmet), 0, 0)
    fhelmetTextures()
end

function sethelmet_txt(helmet_txt)
    c_options.helmet_txt = helmet_txt
    SetPedPropIndex(GetPlayerPed(-1), 0, tonumber(c_options.helmet), tonumber(c_options.helmet_txt), 0)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/3
--Glasses Menu
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function GlassesMenu()
    texture_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Glasses                 Page 1 of 3"
    ClearMenu()
    Menu.addButton(glasses.name[Menu.buttonCount+1], "setglasses", glasses.drawable[Menu.buttonCount+1])
    Menu.addButton(glasses.name[Menu.buttonCount+1], "setglasses", glasses.drawable[Menu.buttonCount+1])
    Menu.addButton(glasses.name[Menu.buttonCount+1], "setglasses", glasses.drawable[Menu.buttonCount+1])
    Menu.addButton(glasses.name[Menu.buttonCount+1], "setglasses", glasses.drawable[Menu.buttonCount+1])
    Menu.addButton(glasses.name[Menu.buttonCount+1], "setglasses", glasses.drawable[Menu.buttonCount+1])
    Menu.addButton(glasses.name[Menu.buttonCount+1], "setglasses", glasses.drawable[Menu.buttonCount+1])
    Menu.addButton("Next Page","GlassesMenu2",nil)
    Menu.addButton("Previous Page","GlassesMenu3",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 2/3
--Glasses Menu
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function GlassesMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Glasses                 Page 2 of 3"
    ClearMenu()
    Menu.addButton(glasses.name2[Menu.buttonCount+1], "setglasses", glasses.drawable2[Menu.buttonCount+1])
    Menu.addButton(glasses.name2[Menu.buttonCount+1], "setglasses", glasses.drawable2[Menu.buttonCount+1])
    Menu.addButton(glasses.name2[Menu.buttonCount+1], "setglasses", glasses.drawable2[Menu.buttonCount+1])
    Menu.addButton(glasses.name2[Menu.buttonCount+1], "setglasses", glasses.drawable2[Menu.buttonCount+1])
    Menu.addButton(glasses.name2[Menu.buttonCount+1], "setglasses", glasses.drawable2[Menu.buttonCount+1])
    Menu.addButton(glasses.name2[Menu.buttonCount+1], "setglasses", glasses.drawable2[Menu.buttonCount+1])
    Menu.addButton("Next Page","GlassesMenu3",nil)
    Menu.addButton("Previous Page","GlassesMenu",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 3/3
--Glasses Menu
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function GlassesMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Glasses                 Page 3 of 3"
    ClearMenu()
    Menu.addButton(glasses.name3[Menu.buttonCount+1], "setglasses", glasses.drawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.name3[Menu.buttonCount+1], "setglasses", glasses.drawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.name3[Menu.buttonCount+1], "setglasses", glasses.drawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.name3[Menu.buttonCount+1], "setglasses", glasses.drawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.name3[Menu.buttonCount+1], "setglasses", glasses.drawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.name3[Menu.buttonCount+1], "setglasses", glasses.drawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.name3[Menu.buttonCount+1], "setglasses", glasses.drawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.name3[Menu.buttonCount+1], "setglasses", glasses.drawable3[Menu.buttonCount+1])
    Menu.addButton("Next Page","GlassesMenu",nil)
    Menu.addButton("Previous Page","GlassesMenu2",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/4
--Glasses Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleGlassesMenu()
    texture_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Glasses                 Page 1 of 4"
    ClearMenu()
    Menu.addButton(glasses.fname[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable[Menu.buttonCount+1])
    Menu.addButton(glasses.fname[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable[Menu.buttonCount+1])
    Menu.addButton(glasses.fname[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable[Menu.buttonCount+1])
    Menu.addButton(glasses.fname[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable[Menu.buttonCount+1])
    Menu.addButton(glasses.fname[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable[Menu.buttonCount+1])
    Menu.addButton(glasses.fname[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleGlassesMenu2",nil)
    Menu.addButton("Previous Page","FemaleGlassesMenu4",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 2/4
--Glasses Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleGlassesMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Glasses                 Page 2 of 4"
    ClearMenu()
    Menu.addButton(glasses.fname2[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(glasses.fname2[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(glasses.fname2[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(glasses.fname2[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(glasses.fname2[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleGlassesMenu3",nil)
    Menu.addButton("Previous Page","FemaleGlassesMenu",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 3/4
--Glasses Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleGlassesMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Glasses                 Page 3 of 4"
    ClearMenu()
    Menu.addButton(glasses.fname3[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.fname3[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.fname3[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.fname3[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.fname3[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.fname3[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.fname3[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(glasses.fname3[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleGlassesMenu4",nil)
    Menu.addButton("Previous Page","FemaleGlassesMenu2",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 4/4
--Glasses Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleGlassesMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Glasses                 Page 4 of 4"
    ClearMenu()
    Menu.addButton(glasses.fname4[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable4[Menu.buttonCount+1])
    Menu.addButton(glasses.fname4[Menu.buttonCount+1], "fsetglasses", glasses.fdrawable4[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleGlassesMenu",nil)
    Menu.addButton("Previous Page","FemaleGlassesMenu3",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/2
--Glasses Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fglassesTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Glasses textures        Page 2 of 2"
    ClearMenu()
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton("Next Page","fglassesTextures2",nil)
    Menu.addButton("Previous Page","fglassesTextures2",nil)
    Menu.addButton("Return","FemaleGlassesMenu",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 2/2
--Glasses Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fglassesTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Glasses textures        Page 2 of 2"
    ClearMenu()
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton("Next Page","fglassesTextures",nil)
    Menu.addButton("Previous Page","fglassesTextures",nil)
    Menu.addButton("Return","FemaleGlassesMenu",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/2
--Glasses Menu
--male
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function glassesTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Glasses textures        Page 2 of 2"
    ClearMenu()
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton(glasses.texture[Menu.buttonCount+1], "setglasses_txt", glasses.texture[Menu.buttonCount+1])
    Menu.addButton("Next Page","glassesTextures2",nil)
    Menu.addButton("Previous Page","glassesTextures2",nil)
    Menu.addButton("Return","GlassesMenu",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 2/2
--Glasses Menu
--male
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function glassesTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Glasses textures        Page 2 of 2"
    ClearMenu()
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton(glasses.texture2[Menu.buttonCount+1], "setglasses_txt", glasses.texture2[Menu.buttonCount+1])
    Menu.addButton("Next Page","glassesTextures",nil)
    Menu.addButton("Previous Page","glassesTextures",nil)
    Menu.addButton("Return","GlassesMenu",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories  
--Glasses Functions
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function setglasses(glasses)
    c_options.glasses = glasses
    SetPedPropIndex(GetPlayerPed(-1), 1, tonumber(c_options.glasses), 0, 0)
    glassesTextures()
end

function fsetglasses(glasses)
    c_options.glasses = glasses
    SetPedPropIndex(GetPlayerPed(-1), 1, tonumber(c_options.glasses), 0, 0)
    glassesTextures()
end

function setglasses_txt(glasses_txt)
    c_options.glasses_txt = glasses_txt
   SetPedPropIndex(GetPlayerPed(-1), 1, tonumber(c_options.glasses), tonumber(c_options.glasses_txt), 0)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/5
--Piercing Menu
--Male
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function PiercingMenu()
    texture_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Piercing                Page 1 of 5"
    ClearMenu()
    Menu.addButton(ears.name[Menu.buttonCount+1], "setpiercing", ears.drawable[Menu.buttonCount+1])
    Menu.addButton(ears.name[Menu.buttonCount+1], "setpiercing", ears.drawable[Menu.buttonCount+1])
    Menu.addButton(ears.name[Menu.buttonCount+1], "setpiercing", ears.drawable[Menu.buttonCount+1])
    Menu.addButton(ears.name[Menu.buttonCount+1], "setpiercing", ears.drawable[Menu.buttonCount+1])
    Menu.addButton(ears.name[Menu.buttonCount+1], "setpiercing", ears.drawable[Menu.buttonCount+1])
    Menu.addButton(ears.name[Menu.buttonCount+1], "setpiercing", ears.drawable[Menu.buttonCount+1])
    Menu.addButton(ears.name[Menu.buttonCount+1], "setpiercing", ears.drawable[Menu.buttonCount+1])
    Menu.addButton(ears.name[Menu.buttonCount+1], "setpiercing", ears.drawable[Menu.buttonCount+1])
    Menu.addButton("Next Page","PiercingMenu2",nil)
    Menu.addButton("Previous Page","PiercingMenu5",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 2/5
--Piercing Menu
--Male
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function PiercingMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Piercing                Page 2 of 5"
    ClearMenu()
    Menu.addButton(ears.name2[Menu.buttonCount+1], "setpiercing", ears.drawable2[Menu.buttonCount+1])
    Menu.addButton(ears.name2[Menu.buttonCount+1], "setpiercing", ears.drawable2[Menu.buttonCount+1])
    Menu.addButton(ears.name2[Menu.buttonCount+1], "setpiercing", ears.drawable2[Menu.buttonCount+1])
    Menu.addButton(ears.name2[Menu.buttonCount+1], "setpiercing", ears.drawable2[Menu.buttonCount+1])
    Menu.addButton(ears.name2[Menu.buttonCount+1], "setpiercing", ears.drawable2[Menu.buttonCount+1])
    Menu.addButton(ears.name2[Menu.buttonCount+1], "setpiercing", ears.drawable2[Menu.buttonCount+1])
    Menu.addButton(ears.name2[Menu.buttonCount+1], "setpiercing", ears.drawable2[Menu.buttonCount+1])
    Menu.addButton(ears.name2[Menu.buttonCount+1], "setpiercing", ears.drawable2[Menu.buttonCount+1])
    Menu.addButton("Next Page","PiercingMenu3",nil)
    Menu.addButton("Previous Page","PiercingMenu",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 3/5
--Piercing Menu
--Male
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function PiercingMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Piercing                Page 3 of 5"
    ClearMenu()
    Menu.addButton(ears.name3[Menu.buttonCount+1], "setpiercing", ears.drawable3[Menu.buttonCount+1])
    Menu.addButton(ears.name3[Menu.buttonCount+1], "setpiercing", ears.drawable3[Menu.buttonCount+1])
    Menu.addButton(ears.name3[Menu.buttonCount+1], "setpiercing", ears.drawable3[Menu.buttonCount+1])
    Menu.addButton(ears.name3[Menu.buttonCount+1], "setpiercing", ears.drawable3[Menu.buttonCount+1])
    Menu.addButton(ears.name3[Menu.buttonCount+1], "setpiercing", ears.drawable3[Menu.buttonCount+1])
    Menu.addButton(ears.name3[Menu.buttonCount+1], "setpiercing", ears.drawable3[Menu.buttonCount+1])
    Menu.addButton(ears.name3[Menu.buttonCount+1], "setpiercing", ears.drawable3[Menu.buttonCount+1])
    Menu.addButton(ears.name3[Menu.buttonCount+1], "setpiercing", ears.drawable3[Menu.buttonCount+1])
    Menu.addButton("Next Page","PiercingMenu4",nil)
    Menu.addButton("Previous Page","PiercingMenu2",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 4/5
--Piercing Menu
--Male
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function PiercingMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Piercing                Page 4 of 5"
    ClearMenu()
    Menu.addButton(ears.name4[Menu.buttonCount+1], "setpiercing", ears.drawable4[Menu.buttonCount+1])
    Menu.addButton(ears.name4[Menu.buttonCount+1], "setpiercing", ears.drawable4[Menu.buttonCount+1])
    Menu.addButton(ears.name4[Menu.buttonCount+1], "setpiercing", ears.drawable4[Menu.buttonCount+1])
    Menu.addButton(ears.name4[Menu.buttonCount+1], "setpiercing", ears.drawable4[Menu.buttonCount+1])
    Menu.addButton(ears.name4[Menu.buttonCount+1], "setpiercing", ears.drawable4[Menu.buttonCount+1])
    Menu.addButton(ears.name4[Menu.buttonCount+1], "setpiercing", ears.drawable4[Menu.buttonCount+1])
    Menu.addButton(ears.name4[Menu.buttonCount+1], "setpiercing", ears.drawable4[Menu.buttonCount+1])
    Menu.addButton(ears.name4[Menu.buttonCount+1], "setpiercing", ears.drawable4[Menu.buttonCount+1])
    Menu.addButton("Next Page","PiercingMenu5",nil)
    Menu.addButton("Previous Page","PiercingMenu3",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 5/5
--Piercing Menu
--Male
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function PiercingMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Piercing                Page 5 of 5"
    ClearMenu()
    Menu.addButton(ears.name5[Menu.buttonCount+1], "setpiercing", ears.drawable5[Menu.buttonCount+1])
    Menu.addButton(ears.name5[Menu.buttonCount+1], "setpiercing", ears.drawable5[Menu.buttonCount+1])
    Menu.addButton(ears.name5[Menu.buttonCount+1], "setpiercing", ears.drawable5[Menu.buttonCount+1])
    Menu.addButton(ears.name5[Menu.buttonCount+1], "setpiercing", ears.drawable5[Menu.buttonCount+1])
    Menu.addButton("Next Page","PiercingMenu",nil)
    Menu.addButton("Previous Page","PiercingMenu4",nil)
    Menu.addButton("Return","Accessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 1/3
--Piercing Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemalePiercingMenu()
    texture_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Piercing                Page 1 of 3"
    ClearMenu()
    Menu.addButton(ears.fname[Menu.buttonCount+1], "setpiercing", ears.fdrawable[Menu.buttonCount+1])
    Menu.addButton(ears.fname[Menu.buttonCount+1], "setpiercing", ears.fdrawable[Menu.buttonCount+1])
    Menu.addButton(ears.fname[Menu.buttonCount+1], "setpiercing", ears.fdrawable[Menu.buttonCount+1])
    Menu.addButton(ears.fname[Menu.buttonCount+1], "setpiercing", ears.fdrawable[Menu.buttonCount+1])
    Menu.addButton(ears.fname[Menu.buttonCount+1], "setpiercing", ears.fdrawable[Menu.buttonCount+1])
    Menu.addButton(ears.fname[Menu.buttonCount+1], "setpiercing", ears.fdrawable[Menu.buttonCount+1])
    Menu.addButton(ears.fname[Menu.buttonCount+1], "setpiercing", ears.fdrawable[Menu.buttonCount+1])
    Menu.addButton(ears.fname[Menu.buttonCount+1], "setpiercing", ears.fdrawable[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemalePiercingMenu2",nil)
    Menu.addButton("Previous Page","FemalePiercingMenu3",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 2/3
--Piercing Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemalePiercingMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Piercing                Page 2 of 3"
    ClearMenu()
    Menu.addButton(ears.fname2[Menu.buttonCount+1], "setpiercing", ears.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(ears.fname2[Menu.buttonCount+1], "setpiercing", ears.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(ears.fname2[Menu.buttonCount+1], "setpiercing", ears.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(ears.fname2[Menu.buttonCount+1], "setpiercing", ears.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(ears.fname2[Menu.buttonCount+1], "setpiercing", ears.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(ears.fname2[Menu.buttonCount+1], "setpiercing", ears.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(ears.fname2[Menu.buttonCount+1], "setpiercing", ears.fdrawable2[Menu.buttonCount+1])
    Menu.addButton(ears.fname2[Menu.buttonCount+1], "setpiercing", ears.fdrawable2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemalePiercingMenu3",nil)
    Menu.addButton("Previous Page","FemalePiercingMenu",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories          Page 3/3
--Piercing Menu
--Female
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemalePiercingMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Piercing                Page 3 of 3"
    ClearMenu()
    Menu.addButton(ears.fname3[Menu.buttonCount+1], "setpiercing", ears.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(ears.fname3[Menu.buttonCount+1], "setpiercing", ears.fdrawable3[Menu.buttonCount+1])
    Menu.addButton(ears.fname3[Menu.buttonCount+1], "setpiercing", ears.fdrawable3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemalePiercingMenu",nil)
    Menu.addButton("Previous Page","FemalePiercingMenu2",nil)
    Menu.addButton("Return","FAccessories",nil)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Accessories  
--Piercing Functions
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function setpiercing(piercing)
    c_options.piercing = piercing
    SetPedPropIndex(GetPlayerPed(-1), 2, tonumber(c_options.piercing), 0, 0)
end

function setpiercing_txt(piercing_txt)
    c_options.piercing_txt = piercing_txt
    SetPedPropIndex(GetPlayerPed(-1), 2, tonumber(c_options.piercing), tonumber(c_options.piercing_txt), 0)
end
--[[
  ______                           _                 _               
 / _____)          _              (_)           _   (_)              
| /     _   _  ___| |_  ___  ____  _  ___  ____| |_  _  ___  ____    
| |    | | | |/___)  _)/ _ \|    \| |/___)/ _  |  _)| |/ _ \|  _ \   
| \____| |_| |___ | |_| |_| | | | | |___ ( ( | | |__| | |_| | | | |  
 \______)____(___/ \___)___/|_|_|_|_(___/ \_||_|\___)_|\___/|_| |_|                                                                 
]]
function Customisation()
    shirt_help = false
    texture_help = false
    options.menu_title = "Customisation"
    options.menu_subtitle = "Customise your character"
    ClearMenu()
    Menu.addButton("Accessories", "Accessories")
    Menu.addButton("Head", "HeadMenu")
    Menu.addButton("Hair", "MaleHairMenu")
    Menu.addButton("Shirt", "ShirtMenu")
    Menu.addButton("Undershirt", "MaleUndershirtMenu")
    Menu.addButton("Armour", "MaleArmourMenu")
    Menu.addButton("Hands", "HandsMenu")
    Menu.addButton("Pants", "MalePantsMenu")
    Menu.addButton("Shoes", "MaleShoeMenu")
    Menu.addButton("Return","GCustomisation",nil)
end

function FCustomisation()
    shirt_help = false
    texture_help = false
    options.menu_title = "Customisation"
    options.menu_subtitle = "Customise your character"
    ClearMenu()
    Menu.addButton("Accessories", "FAccessories")
    Menu.addButton("Head", "FemaleHeadMenu")
    Menu.addButton("Hair", "FemaleHairMenu")
    Menu.addButton("Shirt", "FemaleShirtMenu")
    Menu.addButton("Undershirt", "FemaleUndershirtMenu")
    Menu.addButton("Armour", "FemaleArmourMenu")
    Menu.addButton("Hands", "FHandsMenu")
    Menu.addButton("Pants", "FemalePantsMenu")
    Menu.addButton("Shoes", "FemaleShoeMenu")
    Menu.addButton("Return","GCustomisation",nil)
end
--Females 34,45,33,21
--Males 1,12,13,22,42,43,44
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 1 of 4
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Heads                   Page 1 of 4"
    ClearMenu()
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg1[Menu.buttonCount+1], "savehead", heads.drawable_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","HeadMenu2",nil)
    Menu.addButton("Previous Page","HeadMenu4",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 2 of 4
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu2()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Heads                   Page 2 of 4"
    ClearMenu()
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg2[Menu.buttonCount+1], "savehead", heads.drawable_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","HeadMenu3",nil)
    Menu.addButton("Previous Page","HeadMenu",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 3 of 4
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu3()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Heads                   Page 3 of 4"
    ClearMenu()
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.name_pg3[Menu.buttonCount+1], "savehead", heads.drawable_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","HeadMenu4",nil)
    Menu.addButton("Previous Page","HeadMenu2",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 4 of 4
--Head
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HeadMenu4()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Heads                   Page 4 of 4"
    ClearMenu()
    Menu.addButton(heads.name_pg4[Menu.buttonCount+1], "savehead", heads.drawable_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","HeadMenu",nil)
    Menu.addButton("Previous Page","HeadMenu3",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 1 of 3
--Head
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHeadMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Heads                   Page 1 of 3"
    ClearMenu()
    Menu.addButton(heads.fname_pg1[Menu.buttonCount+1], "savehead", heads.fdrawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg1[Menu.buttonCount+1], "savehead", heads.fdrawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg1[Menu.buttonCount+1], "savehead", heads.fdrawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg1[Menu.buttonCount+1], "savehead", heads.fdrawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg1[Menu.buttonCount+1], "savehead", heads.fdrawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg1[Menu.buttonCount+1], "savehead", heads.fdrawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg1[Menu.buttonCount+1], "savehead", heads.fdrawable_pg1[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg1[Menu.buttonCount+1], "savehead", heads.fdrawable_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHeadMenu2",nil)
    Menu.addButton("Previous Page","FemaleHeadMenu3",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 2 of 3
--Head
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHeadMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Heads                   Page 2 of 3"
    ClearMenu()
    Menu.addButton(heads.fname_pg2[Menu.buttonCount+1], "savehead", heads.fdrawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg2[Menu.buttonCount+1], "savehead", heads.fdrawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg2[Menu.buttonCount+1], "savehead", heads.fdrawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg2[Menu.buttonCount+1], "savehead", heads.fdrawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg2[Menu.buttonCount+1], "savehead", heads.fdrawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg2[Menu.buttonCount+1], "savehead", heads.fdrawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg2[Menu.buttonCount+1], "savehead", heads.fdrawable_pg2[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg2[Menu.buttonCount+1], "savehead", heads.fdrawable_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHeadMenu3",nil)
    Menu.addButton("Previous Page","FemaleHeadMenu",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 3 of 3
--Head
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHeadMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Heads                   Page 3 of 3"
    ClearMenu()
    Menu.addButton(heads.fname_pg3[Menu.buttonCount+1], "savehead", heads.fdrawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg3[Menu.buttonCount+1], "savehead", heads.fdrawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg3[Menu.buttonCount+1], "savehead", heads.fdrawable_pg3[Menu.buttonCount+1])
    Menu.addButton(heads.fname_pg3[Menu.buttonCount+1], "savehead", heads.fdrawable_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHeadMenu",nil)
    Menu.addButton("Previous Page","FemaleHeadMenu2",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
--[[
	Head Functions
--]]
function savehead(head) --Sets Players head in database
    c_options.head = head
    --The laziest way possible of doing this ^_^
    SetPedHeadBlendData(GetPlayerPed(-1), tonumber(c_options.head), tonumber(c_options.head), 0, tonumber(c_options.head), tonumber(c_options.head), 0, 0.5, 0.5, 0.0, false)
    --SetPedComponentVariation(GetPlayerPed(-1), 0, tonumber(c_options.head), 0, 2)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 1 of 6
--Hair
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleHairMenu()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hair                      Page 1 of 4"
    ClearMenu()
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg1[Menu.buttonCount+1], "savehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleHairMenu2",nil)
    Menu.addButton("Previous Page","MaleHairMenu4",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 2 of 4
--Hair
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleHairMenu2()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hair                      Page 2 of 4"
    ClearMenu()
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg2[Menu.buttonCount+1], "savehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleHairMenu3",nil)
    Menu.addButton("Previous Page","MaleHairMenu",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 3 of 4
--Hair
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleHairMenu3()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hair                      Page 3 of 4"
    ClearMenu()
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg3[Menu.buttonCount+1], "savehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleHairMenu4",nil)
    Menu.addButton("Previous Page","MaleHairMenu2",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 4 of 4
--Hair
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleHairMenu4()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hair                      Page 4 of 4"
    ClearMenu()
    Menu.addButton(hair.m_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.m_name_pg4[Menu.buttonCount+1], "savehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleHairMenu",nil)
    Menu.addButton("Previous Page","MaleHairMenu3",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 1 of 4
--Hair
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHairMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hair                      Page 1 of 4"
    ClearMenu()
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "fsavehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "fsavehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "fsavehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "fsavehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "fsavehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "fsavehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "fsavehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg1[Menu.buttonCount+1], "fsavehair", hair.hair_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHairMenu2",nil)
    Menu.addButton("Previous Page","FemaleHairMenu4",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 2 of 4
--Hair
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHairMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hair                      Page 2 of 4"
    ClearMenu()
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "fsavehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "fsavehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "fsavehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "fsavehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "fsavehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "fsavehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "fsavehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg2[Menu.buttonCount+1], "fsavehair", hair.hair_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHairMenu3",nil)
    Menu.addButton("Previous Page","FemaleHairMenu",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 3 of 4
--Hair
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHairMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hair                      Page 3 of 4"
    ClearMenu()
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "fsavehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "fsavehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "fsavehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "fsavehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "fsavehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "fsavehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "fsavehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg3[Menu.buttonCount+1], "fsavehair", hair.hair_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHairMenu4",nil)
    Menu.addButton("Previous Page","FemaleHairMenu2",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       Page 4 of 4
--Hair
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleHairMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hair                      Page 4 of 4"
    ClearMenu()
    Menu.addButton(hair.f_name_pg4[Menu.buttonCount+1], "fsavehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg4[Menu.buttonCount+1], "fsavehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg4[Menu.buttonCount+1], "fsavehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg4[Menu.buttonCount+1], "fsavehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton(hair.f_name_pg4[Menu.buttonCount+1], "fsavehair", hair.hair_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleHairMenu",nil)
    Menu.addButton("Previous Page","FemaleHairMenu3",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair
--Colour
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fHairColour()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hair Colour"
    ClearMenu()
    Menu.addButton(hair.hcolour_fname[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_fname[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_fname[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_fname[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_fname[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_fname[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton("Return","FemaleHairMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair
--Colour
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HairColour()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hair Colour"
    ClearMenu()
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton(hair.hcolour_name[Menu.buttonCount+1], "savecolour", hair.hcolour[Menu.buttonCount+1])
    Menu.addButton("Return","MaleHairMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savehair(hair) --Sets Players head in database
    c_options.hair = hair
    SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(c_options.hair), 0, 0)
    HairColour()
end
function fsavehair(hair) --Sets Players head in database
    c_options.hair = hair
    SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(c_options.hair), 0, 0)
    fHairColour()
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hair Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savecolour(hcolour) --Sets mask texture in database
    c_options.hcolour = hcolour
    SetPedComponentVariation(GetPlayerPed(-1), 2, tonumber(c_options.hair), tonumber(c_options.hcolour), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 1/12
--Male Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 1 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg1[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu2",nil)
    Menu.addButton("Previous Page","ShirtMenu12",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 2/12
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 2 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg2[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu3",nil)
    Menu.addButton("Previous Page","ShirtMenu",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 3/12
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 3 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg3[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu4",nil)
    Menu.addButton("Previous Page","ShirtMenu2",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 4/12
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 4 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg4[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu5",nil)
    Menu.addButton("Previous Page","ShirtMenu3",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 5/12
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 5 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg5[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu6",nil)
    Menu.addButton("Previous Page","ShirtMenu4",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 6/12
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu6()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 6 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg6[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu7",nil)
    Menu.addButton("Previous Page","ShirtMenu5",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 7/12
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu7()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 7 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg7[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu8",nil)
    Menu.addButton("Previous Page","ShirtMenu6",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 8/12
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu8()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 8 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg8[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu9",nil)
    Menu.addButton("Previous Page","ShirtMenu7",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 9/12
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu9()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 9 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg9[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu10",nil)
    Menu.addButton("Previous Page","ShirtMenu8",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 10/12
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu10()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                Page 10 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg10[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu11",nil)
    Menu.addButton("Previous Page","ShirtMenu9",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 11/12
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu11()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                Page 11 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg11[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg11[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg11[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg11[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg11[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg11[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg11[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg11[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu12",nil)
    Menu.addButton("Previous Page","ShirtMenu10",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 12/12
--Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ShirtMenu12()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                Page 12 of 12"
    ClearMenu()
    Menu.addButton(shirts.names_pg12[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg12[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg12[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg12[Menu.buttonCount+1])
    Menu.addButton(shirts.names_pg12[Menu.buttonCount+1], "saveshirt", shirts.shirts_pg12[Menu.buttonCount+1])
    Menu.addButton("Next Page","ShirtMenu",nil)
    Menu.addButton("Previous Page","ShirtMenu11",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 1/11
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 1 of 11"
    ClearMenu()
    Menu.addButton(fshirts.name_pg1[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg1[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg1[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg1[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg1[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg1[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg1[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShirtMenu2",nil)
    Menu.addButton("Previous Page","FemaleShirtMenu11",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 2/11
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu2()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 2 of 11"
    ClearMenu()
    Menu.addButton(fshirts.name_pg2[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg2[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg2[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg2[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg2[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg2[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg2[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShirtMenu3",nil)
    Menu.addButton("Previous Page","FemaleShirtMenu",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 3/11
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu3()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 3 of 11"
    ClearMenu()
    Menu.addButton(fshirts.name_pg3[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg3[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg3[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg3[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg3[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg3[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg3[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShirtMenu4",nil)
    Menu.addButton("Previous Page","FemaleShirtMenu2",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 4/11
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu4()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 4 of 11"
    ClearMenu()
    Menu.addButton(fshirts.name_pg4[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg4[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg4[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg4[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg4[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg4[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg4[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShirtMenu5",nil)
    Menu.addButton("Previous Page","FemaleShirtMenu3",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 5/11
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu5()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 5 of 11"
    ClearMenu()
    Menu.addButton(fshirts.name_pg5[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg5[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg5[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg5[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg5[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg5[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg5[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShirtMenu6",nil)
    Menu.addButton("Previous Page","FemaleShirtMenu4",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 6/11
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu6()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 6 of 11"
    ClearMenu()
    Menu.addButton(fshirts.name_pg6[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg6[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg6[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg6[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg6[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg6[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg6[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShirtMenu7",nil)
    Menu.addButton("Previous Page","FemaleShirtMenu5",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 7/11
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu7()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 7 of 11"
    ClearMenu()
    Menu.addButton(fshirts.name_pg7[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg7[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg7[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg7[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg7[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg7[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg7[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg7[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShirtMenu8",nil)
    Menu.addButton("Previous Page","FemaleShirtMenu6",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 8/11
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu8()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 8 of 11"
    ClearMenu()
    Menu.addButton(fshirts.name_pg8[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg8[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg8[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg8[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg8[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg8[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg8[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg8[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShirtMenu9",nil)
    Menu.addButton("Previous Page","FemaleShirtMenu7",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 9/11
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu9()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                 Page 9 of 11"
    ClearMenu()
    Menu.addButton(fshirts.name_pg9[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg9[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg9[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg9[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg9[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg9[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg9[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg9[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShirtMenu10",nil)
    Menu.addButton("Previous Page","FemaleShirtMenu8",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 10/11
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu10()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                Page 10 of 11"
    ClearMenu()
    Menu.addButton(fshirts.name_pg10[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg10[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg10[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg10[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg10[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg10[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg10[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg10[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShirtMenu11",nil)
    Menu.addButton("Previous Page","FemaleShirtMenu9",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 11/11
--Female Shirts
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShirtMenu11()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shirts                Page 11 of 11"
    ClearMenu()
    Menu.addButton(fshirts.name_pg11[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton(fshirts.name_pg11[Menu.buttonCount+1], "fsaveshirt", fshirts.shirts_pg11[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShirtMenu",nil)
    Menu.addButton("Previous Page","FemaleShirtMenu10",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts
--Textures                      Page 1/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fshirtTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 1 of 3"
    ClearMenu()
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","fshirtTextures2",nil)
    Menu.addButton("Previous Page","fshirtTextures3",nil)
    Menu.addButton("Return","FemaleShirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts
--Textures                      Page 2/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fshirtTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 2 of 3"
    ClearMenu()
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","fshirtTextures3",nil)
    Menu.addButton("Previous Page","fshirtTextures",nil)
    Menu.addButton("Return","FemaleShirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts
--Textures                      Page 3/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fshirtTextures3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 3 of 3"
    ClearMenu()
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","fshirtTextures",nil)
    Menu.addButton("Previous Page","fshirtTextures2",nil)
    Menu.addButton("Return","FemaleShirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts
--Textures						Page 1/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shirtTextures()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 1 of 3"
    ClearMenu()
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg1[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","shirtTextures2",nil)
    Menu.addButton("Previous Page","shirtTextures3",nil)
    Menu.addButton("Return","ShirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts
--Textures						Page 2/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shirtTextures2()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 2 of 3"
    ClearMenu()
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg2[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","shirtTextures3",nil)
    Menu.addButton("Previous Page","shirtTextures",nil)
    Menu.addButton("Return","ShirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts
--Textures						Page 3/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shirtTextures3()
	DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 3 of 3"
    ClearMenu()
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(shirts.txt_pg3[Menu.buttonCount+1], "saveshirt_txt", shirts.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","shirtTextures",nil)
    Menu.addButton("Previous Page","shirtTextures2",nil)
    Menu.addButton("Return","ShirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirts 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveshirt(shirt) --Sets Players head in database
    c_options.shirt = shirt
    SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(c_options.shirt), 0, 0)
    shirtTextures()
end
function fsaveshirt(shirt) --Sets Players head in database
    c_options.shirt = shirt
    SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 240, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(c_options.shirt), 0, 0)
    fshirtTextures()
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shirt Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveshirt_txt(shirt_txt) --Sets mask texture in database
    c_options.shirt_txt = shirt_txt
    SetPedComponentVariation(GetPlayerPed(-1), 11, tonumber(c_options.shirt), tonumber(c_options.shirt_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 1/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 1 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu2",nil)
    Menu.addButton("Previous Page","HandsMenu13",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 2/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 2 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu3",nil)
    Menu.addButton("Previous Page","HandsMenu",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 3/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 3 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu4",nil)
    Menu.addButton("Previous Page","HandsMenu2",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 4/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 4 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu5",nil)
    Menu.addButton("Previous Page","HandsMenu3",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 5/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 5 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu6",nil)
    Menu.addButton("Previous Page","HandsMenu4",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 6/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu6()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 6 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu7",nil)
    Menu.addButton("Previous Page","HandsMenu5",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 7/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu7()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 7 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu9",nil)
    Menu.addButton("Previous Page","HandsMenu6",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 8/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu8()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 8 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu9",nil)
    Menu.addButton("Previous Page","HandsMenu7",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 9/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu9()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 9 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu10",nil)
    Menu.addButton("Previous Page","HandsMenu8",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 10/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu10()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                 Page 10 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu11",nil)
    Menu.addButton("Previous Page","HandsMenu9",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 11/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu11()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                 Page 11 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu12",nil)
    Menu.addButton("Previous Page","HandsMenu10",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 12/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu12()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                 Page 12 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu13",nil)
    Menu.addButton("Previous Page","HandsMenu11",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 13/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function HandsMenu13()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                 Page 13 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg13[Menu.buttonCount+1], "savehand", hands.hands_pg13[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg13[Menu.buttonCount+1], "savehand", hands.hands_pg13[Menu.buttonCount+1])
    Menu.addButton("Next Page","HandsMenu",nil)
    Menu.addButton("Previous Page","HandsMenu12",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 1/13
--Hands Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 1 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg1[Menu.buttonCount+1], "savehand", hands.hands_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu2",nil)
    Menu.addButton("Previous Page","FHandsMenu13",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 2/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 2 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg2[Menu.buttonCount+1], "savehand", hands.hands_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu3",nil)
    Menu.addButton("Previous Page","FHandsMenu",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 3/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 3 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg3[Menu.buttonCount+1], "savehand", hands.hands_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu4",nil)
    Menu.addButton("Previous Page","FHandsMenu2",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 4/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 4 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg4[Menu.buttonCount+1], "savehand", hands.hands_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu5",nil)
    Menu.addButton("Previous Page","FHandsMenu3",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 5/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 5 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg5[Menu.buttonCount+1], "savehand", hands.hands_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu6",nil)
    Menu.addButton("Previous Page","FHandsMenu4",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 6/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu6()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 6 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg6[Menu.buttonCount+1], "savehand", hands.hands_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu7",nil)
    Menu.addButton("Previous Page","FHandsMenu5",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 7/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu7()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 7 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg7[Menu.buttonCount+1], "savehand", hands.hands_pg7[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu9",nil)
    Menu.addButton("Previous Page","FHandsMenu6",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 8/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu8()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 8 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg8[Menu.buttonCount+1], "savehand", hands.hands_pg8[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu9",nil)
    Menu.addButton("Previous Page","FHandsMenu7",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 9/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu9()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                  Page 9 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg9[Menu.buttonCount+1], "savehand", hands.hands_pg9[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu10",nil)
    Menu.addButton("Previous Page","FHandsMenu8",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 10/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu10()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                 Page 10 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg10[Menu.buttonCount+1], "savehand", hands.hands_pg10[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu11",nil)
    Menu.addButton("Previous Page","FHandsMenu9",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 11/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu11()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                 Page 11 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg11[Menu.buttonCount+1], "savehand", hands.hands_pg11[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu12",nil)
    Menu.addButton("Previous Page","FHandsMenu10",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 12/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu12()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                 Page 12 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg12[Menu.buttonCount+1], "savehand", hands.hands_pg12[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu13",nil)
    Menu.addButton("Previous Page","FHandsMenu11",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 13/13
--Hands
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FHandsMenu13()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Hands                 Page 13 of 13"
    ClearMenu()
    Menu.addButton(hands.hands_pg13[Menu.buttonCount+1], "savehand", hands.hands_pg13[Menu.buttonCount+1])
    Menu.addButton(hands.hands_pg13[Menu.buttonCount+1], "savehand", hands.hands_pg13[Menu.buttonCount+1])
    Menu.addButton("Next Page","FHandsMenu",nil)
    Menu.addButton("Previous Page","FHandsMenu12",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Hands
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savehand(hand) --Sets Players head in database
    c_options.hand = hand
    SetPedComponentVariation(GetPlayerPed(-1), 3, tonumber(c_options.hand), 0, 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 1/5
--Male Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleShoeMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shoes                    Page 1 of 5"
    ClearMenu()
    Menu.addButton(shoes.m_names_pg1[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg1[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg1[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg1[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg1[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg1[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg1[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleShoeMenu2",nil)
    Menu.addButton("Previous Page","MaleShoeMenu5",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 2/5
--Male Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleShoeMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shoes                    Page 2 of 5"
    ClearMenu()
    Menu.addButton(shoes.m_names_pg2[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg2[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg2[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg2[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg2[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg2[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg2[Menu.buttonCount+1], "saveshoe", shoes.fshoes_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleShoeMenu3",nil)
    Menu.addButton("Previous Page","MaleShoeMenu",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 3/5
--Male Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleShoeMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shoes                    Page 3 of 5"
    ClearMenu()
    Menu.addButton(shoes.m_names_pg3[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg3[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg3[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg3[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg3[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg3[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg3[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleShoeMenu4",nil)
    Menu.addButton("Previous Page","MaleShoeMenu2",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 4/5
--Male Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleShoeMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shoes                    Page 4 of 5"
    ClearMenu()
    Menu.addButton(shoes.m_names_pg4[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg4[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg4[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg4[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg4[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg4[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.m_names_pg4[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleShoeMenu5",nil)
    Menu.addButton("Previous Page","MaleShoeMenu3",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 5/5
--Male Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleShoeMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shoes                    Page 5 of 5"
    ClearMenu()
    Menu.addButton(shoes.m_names_pg5[Menu.buttonCount+1], "saveshoe", shoes.shoes_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleShoeMenu",nil)
    Menu.addButton("Previous Page","MaleShoeMenu4",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 1/5
--Female Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShoeMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shoes                    Page 1 of 5"
    ClearMenu()
    Menu.addButton(shoes.f_names_pg1[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg1[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg1[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg1[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg1[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg1[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg1[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShoeMenu2",nil)
    Menu.addButton("Previous Page","FemaleShoeMenu5",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 2/5
--Male Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShoeMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shoes                    Page 2 of 5"
    ClearMenu()
    Menu.addButton(shoes.f_names_pg2[Menu.buttonCount+1], "fsaveshoe", shoes.fshoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg2[Menu.buttonCount+1], "fsaveshoe", shoes.fshoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg2[Menu.buttonCount+1], "fsaveshoe", shoes.fshoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg2[Menu.buttonCount+1], "fsaveshoe", shoes.fshoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg2[Menu.buttonCount+1], "fsaveshoe", shoes.fshoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg2[Menu.buttonCount+1], "fsaveshoe", shoes.fshoes_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg2[Menu.buttonCount+1], "fsaveshoe", shoes.fshoes_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShoeMenu3",nil)
    Menu.addButton("Previous Page","FemaleShoeMenu",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 3/5
--Male Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShoeMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shoes                    Page 3 of 5"
    ClearMenu()
    Menu.addButton(shoes.f_names_pg3[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg3[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg3[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg3[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg3[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg3[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg3[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShoeMenu4",nil)
    Menu.addButton("Previous Page","FemaleShoeMenu2",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 4/5
--Male Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShoeMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shoes                    Page 4 of 5"
    ClearMenu()
    Menu.addButton(shoes.f_names_pg4[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg4[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg4[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg4[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg4[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg4[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg4[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShoeMenu5",nil)
    Menu.addButton("Previous Page","FemaleShoeMenu3",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 5/5
--Male Shoes
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleShoeMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Shoes                    Page 5 of 5"
    ClearMenu()
    Menu.addButton(shoes.f_names_pg5[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg5[Menu.buttonCount+1])
    Menu.addButton(shoes.f_names_pg5[Menu.buttonCount+1], "fsaveshoe", shoes.shoes_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleShoeMenu",nil)
    Menu.addButton("Previous Page","FemaleShoeMenu4",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoes
--Textures                      Page 1/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fshoeTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 1 of 3"
    ClearMenu()
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","fshoeTextures2",nil)
    Menu.addButton("Previous Page","fshoeTextures3",nil)
    Menu.addButton("Return","FemaleShoeMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoes
--Textures                      Page 2/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fshoeTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 2 of 3"
    ClearMenu()
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","fshoeTextures3",nil)
    Menu.addButton("Previous Page","fshoeTextures",nil)
    Menu.addButton("Return","FemaleShoeMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoes
--Textures                      Page 3/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fshoeTextures3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 3 of 3"
    ClearMenu()
    Menu.addButton(shoes.txt_pg3[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","fshoeTextures",nil)
    Menu.addButton("Previous Page","fshoeTextures2",nil)
    Menu.addButton("Return","FemaleShoeMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoes
--Textures                      Page 1/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shoeTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 1 of 3"
    ClearMenu()
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg1[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","shoeTextures2",nil)
    Menu.addButton("Previous Page","shoeTextures3",nil)
    Menu.addButton("Return","MaleShoeMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoes
--Textures                      Page 2/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shoeTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 2 of 3"
    ClearMenu()
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(shoes.txt_pg2[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","shoeTextures3",nil)
    Menu.addButton("Previous Page","shoeTextures",nil)
    Menu.addButton("Return","MaleShoeMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoes
--Textures                      Page 3/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shoeTextures3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 3 of 3"
    ClearMenu()
    Menu.addButton(shoes.txt_pg3[Menu.buttonCount+1], "saveshoe_txt", shoes.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","shoeTextures",nil)
    Menu.addButton("Previous Page","shoeTextures2",nil)
    Menu.addButton("Return","MaleShoeMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoes 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveshoe(shoe) --Sets Players head in database
    c_options.shoes = shoe
    SetPedComponentVariation(GetPlayerPed(-1), 6, tonumber(c_options.shoes), 0, 0)
    shoeTextures()
end

function fsaveshoe(shoe) --Sets Players head in database
    c_options.shoes = shoe
    SetPedComponentVariation(GetPlayerPed(-1), 6, tonumber(c_options.shoes), 0, 0)
    fshoeTextures()
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Shoe Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveshoe_txt(shoe_txt) --Sets mask texture in database
    c_options.shoes_txt = shoe_txt
    SetPedComponentVariation(GetPlayerPed(-1), 6, tonumber(c_options.shoes), tonumber(c_options.shoes_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Male                      Page 1/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MalePantsMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 1 of 6"
    ClearMenu()
    Menu.addButton(pants.m_names_pg1[Menu.buttonCount+1], "savepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg1[Menu.buttonCount+1], "savepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg1[Menu.buttonCount+1], "savepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg1[Menu.buttonCount+1], "savepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg1[Menu.buttonCount+1], "savepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg1[Menu.buttonCount+1], "savepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg1[Menu.buttonCount+1], "savepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg1[Menu.buttonCount+1], "savepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","MalePantsMenu2",nil)
    Menu.addButton("Previous Page","MalePantsMenu6",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Male                      Page 2/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MalePantsMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 2 of 6"
    ClearMenu()
    Menu.addButton(pants.m_names_pg2[Menu.buttonCount+1], "savepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg2[Menu.buttonCount+1], "savepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg2[Menu.buttonCount+1], "savepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg2[Menu.buttonCount+1], "savepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg2[Menu.buttonCount+1], "savepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg2[Menu.buttonCount+1], "savepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg2[Menu.buttonCount+1], "savepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","MalePantsMenu3",nil)
    Menu.addButton("Previous Page","MalePantsMenu",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Male                      Page 3/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MalePantsMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 3 of 6"
    ClearMenu()
    Menu.addButton(pants.m_names_pg3[Menu.buttonCount+1], "savepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg3[Menu.buttonCount+1], "savepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg3[Menu.buttonCount+1], "savepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg3[Menu.buttonCount+1], "savepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg3[Menu.buttonCount+1], "savepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg3[Menu.buttonCount+1], "savepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg3[Menu.buttonCount+1], "savepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg3[Menu.buttonCount+1], "savepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","MalePantsMenu4",nil)
    Menu.addButton("Previous Page","MalePantsMenu2",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Male                      Page 4/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MalePantsMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 4 of 6"
    ClearMenu()
    Menu.addButton(pants.m_names_pg4[Menu.buttonCount+1], "savepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg4[Menu.buttonCount+1], "savepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg4[Menu.buttonCount+1], "savepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg4[Menu.buttonCount+1], "savepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg4[Menu.buttonCount+1], "savepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg4[Menu.buttonCount+1], "savepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg4[Menu.buttonCount+1], "savepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg4[Menu.buttonCount+1], "savepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","MalePantsMenu5",nil)
    Menu.addButton("Previous Page","MalePantsMenu3",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Male                      Page 5/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MalePantsMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 5 of 6"
    ClearMenu()
    Menu.addButton(pants.m_names_pg5[Menu.buttonCount+1], "savepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg5[Menu.buttonCount+1], "savepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg5[Menu.buttonCount+1], "savepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg5[Menu.buttonCount+1], "savepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg5[Menu.buttonCount+1], "savepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg5[Menu.buttonCount+1], "savepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg5[Menu.buttonCount+1], "savepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","MalePantsMenu6",nil)
    Menu.addButton("Previous Page","MalePantsMenu4",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Male                      Page 6/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MalePantsMenu6()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 6 of 6"
    ClearMenu()
    Menu.addButton(pants.m_names_pg6[Menu.buttonCount+1], "savepants", pants.pants_pg6[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg6[Menu.buttonCount+1], "savepants", pants.pants_pg6[Menu.buttonCount+1])
    Menu.addButton(pants.m_names_pg6[Menu.buttonCount+1], "savepants", pants.pants_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","MalePantsMenu",nil)
    Menu.addButton("Previous Page","MalePantsMenu5",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Female                      Page 1/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemalePantsMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 1 of 6"
    ClearMenu()
    Menu.addButton(pants.f_names_pg1[Menu.buttonCount+1], "fsavepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg1[Menu.buttonCount+1], "fsavepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg1[Menu.buttonCount+1], "fsavepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg1[Menu.buttonCount+1], "fsavepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg1[Menu.buttonCount+1], "fsavepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg1[Menu.buttonCount+1], "fsavepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg1[Menu.buttonCount+1], "fsavepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg1[Menu.buttonCount+1], "fsavepants", pants.pants_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemalePantsMenu2",nil)
    Menu.addButton("Previous Page","FemalePantsMenu6",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Female                      Page 2/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemalePantsMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 2 of 6"
    ClearMenu()
    Menu.addButton(pants.f_names_pg2[Menu.buttonCount+1], "fsavepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg2[Menu.buttonCount+1], "fsavepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg2[Menu.buttonCount+1], "fsavepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg2[Menu.buttonCount+1], "fsavepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg2[Menu.buttonCount+1], "fsavepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg2[Menu.buttonCount+1], "fsavepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg2[Menu.buttonCount+1], "fsavepants", pants.pants_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemalePantsMenu3",nil)
    Menu.addButton("Previous Page","FemalePantsMenu",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Female                      Page 3/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemalePantsMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 3 of 6"
    ClearMenu()
    Menu.addButton(pants.f_names_pg3[Menu.buttonCount+1], "fsavepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg3[Menu.buttonCount+1], "fsavepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg3[Menu.buttonCount+1], "fsavepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg3[Menu.buttonCount+1], "fsavepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg3[Menu.buttonCount+1], "fsavepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg3[Menu.buttonCount+1], "fsavepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg3[Menu.buttonCount+1], "fsavepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg3[Menu.buttonCount+1], "fsavepants", pants.pants_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemalePantsMenu4",nil)
    Menu.addButton("Previous Page","FemalePantsMenu2",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Female                      Page 4/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemalePantsMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 4 of 6"
    ClearMenu()
    Menu.addButton(pants.f_names_pg4[Menu.buttonCount+1], "fsavepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg4[Menu.buttonCount+1], "fsavepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg4[Menu.buttonCount+1], "fsavepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg4[Menu.buttonCount+1], "fsavepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg4[Menu.buttonCount+1], "fsavepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg4[Menu.buttonCount+1], "fsavepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg4[Menu.buttonCount+1], "fsavepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg4[Menu.buttonCount+1], "fsavepants", pants.pants_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemalePantsMenu5",nil)
    Menu.addButton("Previous Page","FemalePantsMenu3",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Female                      Page 5/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemalePantsMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 5 of 6"
    ClearMenu()
    Menu.addButton(pants.f_names_pg5[Menu.buttonCount+1], "fsavepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg5[Menu.buttonCount+1], "fsavepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg5[Menu.buttonCount+1], "fsavepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg5[Menu.buttonCount+1], "fsavepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg5[Menu.buttonCount+1], "fsavepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg5[Menu.buttonCount+1], "fsavepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg5[Menu.buttonCount+1], "fsavepants", pants.pants_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemalePantsMenu6",nil)
    Menu.addButton("Previous Page","FemalePantsMenu4",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Female                      Page 6/6
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemalePantsMenu6()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Pants                    Page 6 of 6"
    ClearMenu()
    Menu.addButton(pants.f_names_pg6[Menu.buttonCount+1], "fsavepants", pants.pants_pg6[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg6[Menu.buttonCount+1], "fsavepants", pants.pants_pg6[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg6[Menu.buttonCount+1], "fsavepants", pants.pants_pg6[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg6[Menu.buttonCount+1], "fsavepants", pants.pants_pg6[Menu.buttonCount+1])
    Menu.addButton(pants.f_names_pg6[Menu.buttonCount+1], "fsavepants", pants.pants_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemalePantsMenu",nil)
    Menu.addButton("Previous Page","FemalePantsMenu5",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Textures                      Page 1/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fpantsTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 1 of 3"
    ClearMenu()
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","fpantsTextures2",nil)
    Menu.addButton("Previous Page","fpantsTextures3",nil)
    Menu.addButton("Return","FemalePantsMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Textures                      Page 2/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fpantsTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 2 of 3"
    ClearMenu()
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","fpantsTextures3",nil)
    Menu.addButton("Previous Page","fpantsTextures",nil)
    Menu.addButton("Return","FemalePantsMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Textures                      Page 3/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fpantsTextures3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 3 of 3"
    ClearMenu()
    Menu.addButton(pants.txt_pg3[Menu.buttonCount+1], "savepants_txt", pants.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","fpantsTextures",nil)
    Menu.addButton("Previous Page","fpantsTextures2",nil)
    Menu.addButton("Return","FemalePantsMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Textures                      Page 1/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function pantsTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 1 of 3"
    ClearMenu()
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg1[Menu.buttonCount+1], "savepants_txt", pants.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","pantsTextures2",nil)
    Menu.addButton("Previous Page","pantsTextures3",nil)
    Menu.addButton("Return","MalePantsMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Textures                      Page 2/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function pantsTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 2 of 3"
    ClearMenu()
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(pants.txt_pg2[Menu.buttonCount+1], "savepants_txt", pants.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","pantsTextures3",nil)
    Menu.addButton("Previous Page","pantsTextures",nil)
    Menu.addButton("Return","MalePantsMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants
--Textures                      Page 3/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function pantsTextures3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 3 of 3"
    ClearMenu()
    Menu.addButton(pants.txt_pg3[Menu.buttonCount+1], "savepants_txt", pants.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","pantsTextures",nil)
    Menu.addButton("Previous Page","pantsTextures2",nil)
    Menu.addButton("Return","MalePantsMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savepants(pants) --Sets Players head in database
    c_options.pants = pants
    SetPedComponentVariation(GetPlayerPed(-1), 4, tonumber(c_options.pants), 0, 0)
    pantsTextures()
end

function fsavepants(pants) --Sets Players head in database
    c_options.pants = pants
    SetPedComponentVariation(GetPlayerPed(-1), 4, tonumber(c_options.pants), 0, 0)
    fpantsTextures()
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Pants Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savepants_txt(pants_txt) --Sets mask texture in database
    c_options.pants_txt = pants_txt
    SetPedComponentVariation(GetPlayerPed(-1), 4, tonumber(c_options.pants), tonumber(c_options.pants_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 1/8
--Undershirt
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleUndershirtMenu()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts            Page 1 of 8"
    ClearMenu()
    Menu.addButton(undershirt.m_names_pg1[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg1[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg1[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg1[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg1[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg1[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg1[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg1[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton("Remove undershirt","RemoveUnderShirt")
    Menu.addButton("Next Page","MaleUndershirtMenu2",nil)
    Menu.addButton("Previous Page","MaleUndershirtMenu8",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 2/8
--Undershirt
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleUndershirtMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts            Page 2 of 8"
    ClearMenu()
    Menu.addButton(undershirt.m_names_pg2[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg2[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg2[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg2[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg2[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg2[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg2[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg2[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleUndershirtMenu3",nil)
    Menu.addButton("Previous Page","MaleUndershirtMenu",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 3/8
--Undershirt
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleUndershirtMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 3 of 8"
    ClearMenu()
    Menu.addButton(undershirt.m_names_pg3[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg3[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg3[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg3[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg3[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg3[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg3[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg3[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleUndershirtMenu4",nil)
    Menu.addButton("Previous Page","MaleUndershirtMenu2",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 4/8
--Undershirt
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleUndershirtMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 4 of 8"
    ClearMenu()
    Menu.addButton(undershirt.m_names_pg4[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg4[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg4[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg4[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg4[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg4[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg4[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg4[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleUndershirtMenu5",nil)
    Menu.addButton("Previous Page","MaleUndershirtMenu3",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 5/8
--Undershirt
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleUndershirtMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 5 of 8"
    ClearMenu()
    Menu.addButton(undershirt.m_names_pg5[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg5[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg5[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg5[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg5[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg5[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg5[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg5[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleUndershirtMenu6",nil)
    Menu.addButton("Previous Page","MaleUndershirtMenu4",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 6/8
--Undershirt
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleUndershirtMenu6()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 6 of 8"
    ClearMenu()
    Menu.addButton(undershirt.m_names_pg6[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg6[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg6[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg6[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg6[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg6[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg6[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg6[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleUndershirtMenu7",nil)
    Menu.addButton("Previous Page","MaleUndershirtMenu5",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 7/8
--Undershirt
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleUndershirtMenu7()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 7 of 8"
    ClearMenu()
    Menu.addButton(undershirt.m_names_pg7[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg7[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg7[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg7[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg7[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg7[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg7[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg7[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleUndershirtMenu8",nil)
    Menu.addButton("Previous Page","MaleUndershirtMenu6",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 8/8
--Undershirt
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleUndershirtMenu8()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 8 of 8"
    ClearMenu()
    Menu.addButton(undershirt.m_names_pg8[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg8[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg8[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg8[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg8[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg8[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg8[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.m_names_pg8[Menu.buttonCount+1], "saveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton("Next Page","MaleUndershirtMenu",nil)
    Menu.addButton("Previous Page","MaleUndershirtMenu7",nil)
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 1/8
--Undershirt
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleUndershirtMenu()
    shirt_help = true
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 1 of 8"
    ClearMenu()
    Menu.addButton(undershirt.f_names_pg1[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg1[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg1[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg1[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg1[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg1[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg1[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg1[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg1[Menu.buttonCount+1])
    Menu.addButton("Remove undershirt","RemoveUnderShirt")
    Menu.addButton("Next Page","FemaleUndershirtMenu2",nil)
    Menu.addButton("Previous Page","FemaleUndershirtMenu8",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 2/8
--Undershirt
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleUndershirtMenu2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 2 of 8"
    ClearMenu()
    Menu.addButton(undershirt.f_names_pg2[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg2[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg2[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg2[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg2[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg2[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg2[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg2[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleUndershirtMenu3",nil)
    Menu.addButton("Previous Page","FemaleUndershirtMenu",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 3/8
--Undershirt
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleUndershirtMenu3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 3 of 8"
    ClearMenu()
    Menu.addButton(undershirt.f_names_pg3[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg3[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg3[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg3[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg3[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg3[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg3[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg3[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleUndershirtMenu4",nil)
    Menu.addButton("Previous Page","FemaleUndershirtMenu2",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 4/8
--Undershirt
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleUndershirtMenu4()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 4 of 8"
    ClearMenu()
    Menu.addButton(undershirt.f_names_pg4[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg4[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg4[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg4[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg4[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg4[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg4[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg4[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg4[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleUndershirtMenu5",nil)
    Menu.addButton("Previous Page","FemaleUndershirtMenu3",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 5/8
--Undershirt
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleUndershirtMenu5()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 5 of 8"
    ClearMenu()
    Menu.addButton(undershirt.f_names_pg5[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg5[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg5[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg5[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg5[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg5[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg5[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg5[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg5[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleUndershirtMenu6",nil)
    Menu.addButton("Previous Page","FemaleUndershirtMenu4",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 6/8
--Undershirt
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleUndershirtMenu6()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 6 of 8"
    ClearMenu()
    Menu.addButton(undershirt.f_names_pg6[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg6[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg6[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg6[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg6[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg6[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg6[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg6[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg6[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleUndershirtMenu7",nil)
    Menu.addButton("Previous Page","FemaleUndershirtMenu5",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 7/8
--Undershirt
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleUndershirtMenu7()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 7 of 8"
    ClearMenu()
    Menu.addButton(undershirt.f_names_pg7[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg7[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg7[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg7[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg7[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg7[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg7[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg7[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg7[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleUndershirtMenu8",nil)
    Menu.addButton("Previous Page","FemaleUndershirtMenu6",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu           Page 8/8
--Undershirt
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleUndershirtMenu8()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Undershirts             Page 8 of 8"
    ClearMenu()
    Menu.addButton(undershirt.f_names_pg8[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg8[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg8[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg8[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg8[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg8[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg8[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton(undershirt.f_names_pg8[Menu.buttonCount+1], "fsaveundershirt", undershirt.undershirt_pg8[Menu.buttonCount+1])
    Menu.addButton("Next Page","FemaleUndershirtMenu",nil)
    Menu.addButton("Previous Page","FemaleUndershirtMenu7",nil)
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt
--Textures                      Page 1/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fundershirtTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 1 of 3"
    ClearMenu()
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","fundershirtTextures2",nil)
    Menu.addButton("Previous Page","fundershirtTextures3",nil)
    Menu.addButton("Return","FemaleUndershirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt
--Textures                      Page 2/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fundershirtTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 2 of 3"
    ClearMenu()
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","fundershirtTextures3",nil)
    Menu.addButton("Previous Page","fundershirtTextures",nil)
    Menu.addButton("Return","FemaleUndershirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt
--Textures                      Page 3/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function fundershirtTextures3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 3 of 3"
    ClearMenu()
    Menu.addButton(undershirt.txt_pg3[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg3[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg3[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg3[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg3[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","fundershirtTextures",nil)
    Menu.addButton("Previous Page","fundershirtTextures2",nil)
    Menu.addButton("Return","FemaleUndershirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt
--Textures                      Page 1/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function undershirtTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 1 of 3"
    ClearMenu()
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg1[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg1[Menu.buttonCount+1])
    Menu.addButton("Next Page","undershirtTextures2",nil)
    Menu.addButton("Previous Page","undershirtTextures3",nil)
    Menu.addButton("Return","MaleUndershirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt
--Textures                      Page 2/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function undershirtTextures2()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 2 of 3"
    ClearMenu()
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg2[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg2[Menu.buttonCount+1])
    Menu.addButton("Next Page","undershirtTextures3",nil)
    Menu.addButton("Previous Page","undershirtTextures",nil)
    Menu.addButton("Return","MaleUndershirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt
--Textures                      Page 3/3
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function undershirtTextures3()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Textures                Page 3 of 3"
    ClearMenu()
    Menu.addButton(undershirt.txt_pg3[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg3[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg3[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg3[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg3[Menu.buttonCount+1])
    Menu.addButton(undershirt.txt_pg3[Menu.buttonCount+1], "saveundershirt_txt", undershirt.txt_pg3[Menu.buttonCount+1])
    Menu.addButton("Next Page","undershirtTextures",nil)
    Menu.addButton("Previous Page","undershirtTextures2",nil)
    Menu.addButton("Return","MaleUndershirtMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveundershirt(undershirt) --Sets Players head in database
    c_options.undershirt = undershirt
    SetPedComponentVariation(GetPlayerPed(-1), 8, undershirt, 0, 0)
    undershirtTextures()
end

function fsaveundershirt(undershirt) --Sets Players head in database
    c_options.undershirt = undershirt
    SetPedComponentVariation(GetPlayerPed(-1), 8, undershirt, 0, 0)
    fundershirtTextures()
end

function RemoveUnderShirt()
    c_options.undershirt = 0
    c_options.undershirt_txt = 240
    SetPedComponentVariation(GetPlayerPed(-1), 8, tonumber(c_options.undershirt), tonumber(c_options.undershirt_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Undershirt Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function saveundershirt_txt(undershirt_txt) --Sets mask texture in database
    c_options.undershirt_txt = undershirt_txt
    SetPedComponentVariation(GetPlayerPed(-1), 8, tonumber(c_options.undershirt), tonumber(c_options.undershirt_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       
--Armour
--Male
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MaleArmourMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Armour"
    ClearMenu()
    Menu.addButton(armour.m_name[Menu.buttonCount+1], "removearmour", armour.m_armour[Menu.buttonCount+1])
    Menu.addButton(armour.m_name[Menu.buttonCount+1], "savearmour", armour.m_armour[Menu.buttonCount+1])
    Menu.addButton("Return","Customisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       
--Armour
--Female
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function FemaleArmourMenu()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Armour"
    ClearMenu()
    Menu.addButton(armour.f_name[Menu.buttonCount+1], "removearmour", armour.f_armour[Menu.buttonCount+1])
    Menu.addButton(armour.f_name[Menu.buttonCount+1], "fsavearmour", armour.f_armour[Menu.buttonCount+1])
    Menu.addButton("Return","FCustomisation",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       
--Armour
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function armourTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Armour Camos"
    ClearMenu()
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton("Return","MaleArmourMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu       
--Armour
--Textures
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function farmourTextures()
    DisplayHelpText("Use ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to ~y~move~w~ and ~y~Enter~w~ to ~r~select")
    options.menu_subtitle = "Armour Camos"
    ClearMenu()
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton(armour.txt_n[Menu.buttonCount+1], "savearmour_txt", armour.txt[Menu.buttonCount+1])
    Menu.addButton("Return","FemaleArmourMenu",nil)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Armour 
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savearmour(armour) --Sets Players head in database
    c_options.armour = armour
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(c_options.armour), 0, 0)
    armourTextures()
end

function fsavearmour(armour) --Sets Players head in database
    c_options.armour = armour
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(c_options.armour), 0, 0)
    farmourTextures()
end

function removearmour(armour) --Sets Players head in database
    c_options.armour = armour
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(c_options.armour), 0, 0)
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Customisation Menu
--Armour Textures
--Functions
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function savearmour_txt(armour_txt) --Sets mask texture in database
    c_options.armour_txt = armour_txt
    SetPedComponentVariation(GetPlayerPed(-1), 9, tonumber(c_options.armour), tonumber(c_options.armour_txt), 0)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Press E to open/close menu in the red marker
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local emplacement = {
	{name="Clothing", id=73, x=74.291, y=-1396.929, z=29.200},
    {name="Clothing", id=73, x=-709.985, y=-153.059, z=36.996},
    {name="Clothing", id=73, x=-163.204, y=-303.837, z=38.724},
    {name="Clothing", id=73, x=426.646, y=-803.452, z=29.338},
    {name="Clothing", id=73, x=-824.193, y=-1074.333, z=11.022},
    {name="Clothing", id=73, x=-1192.098, y=-767.020, z=17.163},
    {name="Clothing", id=73, x=-1450.63, y=-237.126, z=49.185},
    {name="Clothing", id=73, x=-7.777, y=6514.491, z=31.533},
    {name="Clothing", id=73, x=1694.586, y=4825.133, z=42.046},
    {name="Clothing", id=73, x=125.335, y=-225.199, z=54.505},
    {name="Clothing", id=73, x=1196.169, y=2710.895, z=37.866},
    {name="Clothing", id=73, x=-3170.172, y=1043.927, z=20.674},
    {name="Clothing", id=73, x=-1103.373, y=2708.356, z=19.422},
    {name="Clothing", id=73, x=-1034.118, y=-2739.378, z=20.169},
}
incircle = false
Citizen.CreateThread(function()
    for _, item in pairs(emplacement) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, item.id)
      SetBlipColour(item.blip, item.colour)
      SetBlipAsShortRange(item.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(item.name)
      EndTextCommandSetBlipName(item.blip)
    end
    while true do
        Citizen.Wait(0)
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        for k,v in ipairs(emplacement) do
            if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 15.0)then
                DrawMarker(1, v.x, v.y, v.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,165, 0, 0, 0,0)
                if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 1.0)then
                    if (incircle == false) then
                        DisplayHelpText("Press ~INPUT_CONTEXT~ to customise your character.")
                    end
                    incircle = true
                    if IsControlJustReleased(1, 51) then -- INPUT_CELLPHONE_DOWN
                        Main() -- Menu to draw
                        Menu.hidden = not Menu.hidden -- Hide/Show the menu
                        shirt_help = false
                        model_info = false
                        texture_help = false
                    end
                    if(IsControlJustReleased(1, 23)) then 
                        if mp_check then
                            mp_check_message = false
                            local user = {
                                hair = c_options.hair,
                                hcolour = c_options.hcolour,
                                shirt = c_options.shirt,
                                shirt_txt = c_options.shirt_txt,
                                pants = c_options.pants,
                                pants_txt = c_options.pants_txt,
                                undershirt = c_options.undershirt,
                                undershirt_txt = c_options.undershirt_txt,
                                shoe = c_options.shoes,
                                shoe_txt = c_options.shoes_txt,
                                hand = c_options.hand,
                                mask = c_options.mask,
                                mask_txt = c_options.mask_txt,
                                head = c_options.head,
                                armour = c_options.armour,
                                armour_txt = c_options.armour_txt,
                                helmet = c_options.helmet,
                                helmet_txt = c_options.helmet_txt,
                                glasses = c_options.glasses,
                                glasses_txt = c_options.glasses_txt,
                                piercing = c_options.piercing,
                                piercing_txt = c_options.piercing_txt
                            }
                            Notify("~g~You saved your outfit.") 
                            TriggerServerEvent("mm:saveeverything", user)
                        else
                            secondsRemaining2 = 10
                            mp_check_message = true
                            TriggerServerEvent("mm:timer2")                          
                        end
                    end
                    Menu.renderGUI(options) -- Draw menu on each tick if Menu.hidden = false
                elseif(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) > 1.0)then
                    incircle = false
                    shirt_help = false
                    model_info = false
                    texture_help = false
                    mp_check_message = false
                end
            end
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Help messages
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        if shirt_help then
            drawTxt(0.66, 1.45, 1.0,1.0,0.4, "~r~NOTICE~w~: If your characters hands or arms are invisible then go to the ~r~Hands ~w~menu.", 255, 255, 255, 255)
            drawTxt(0.66, 1.42, 1.0,1.0,0.4, "~r~NOTICE~w~: If your characters chest is invisible then go to the ~r~Under Shirt ~w~menu.", 255, 255, 255, 255)
            drawTxt(0.66, 1.37, 1.0,1.0,0.4, "~r~NOTICE~w~: If your characters body or arms are going through clothing then go to the ~r~Hands", 255, 255, 255, 255)
            drawTxt(0.66, 1.39, 1.0,1.0,0.4, "              ~w~menu.", 255, 255, 255, 255)
            drawTxt(0.66, 1.34, 1.0,1.0,0.4, "~r~NOTICE~w~: (~g~Number~w~) = the number of ~g~Textures ~w~available.", 255, 255, 255, 255)
            drawTxt(0.66, 1.31, 1.0,1.0,0.4, "~r~NOTICE~w~: ~g~T~w~ = ~g~Textures ~w~and the numbers are textures that work with the clothing.", 255, 255, 255, 255)
        end
        Citizen.Wait(0)
    end
end)
Citizen.CreateThread(function()
    while true do
        if model_info then
            drawTxt(0.66, 1.41, 1.0,1.0,0.4, "(~g~" .. secondsRemaining .. "~w~) ~r~NOTICE~w~: Your current player model cannot be customised.", 255, 255, 255, 255)
            drawTxt(0.66, 1.44, 1.0,1.0,0.4, "(~g~" .. secondsRemaining .. "~w~) ~r~NOTICE~w~: Your model must be ~r~mp_m_freemode_01 ~w~or ~r~mp_f_freemode_01~w~.", 255, 255, 255, 255)
        end
        Citizen.Wait(0)
    end
end)
Citizen.CreateThread(function()
    while true do
        if mp_check_message then
            drawTxt(0.66, 1.38, 1.0,1.0,0.4, "(~g~" .. secondsRemaining2 .. "~w~) ~r~NOTICE~w~: You cannot save your outfit as your model isn't customisable.", 255, 255, 255, 255)
        end
        Citizen.Wait(0)
    end
end)
Citizen.CreateThread(function()
    while true do
        if texture_help then
            drawTxt(0.66, 1.45, 1.0,1.0,0.4, "~r~NOTICE~w~: (~g~Number~w~) = the number of ~g~Textures ~w~available.", 255, 255, 255, 255)
            drawTxt(0.66, 1.42, 1.0,1.0,0.4, "~r~NOTICE~w~: ~g~T~w~ = ~g~Textures ~w~and the numbers are textures that work with the clothing.", 255, 255, 255, 255)
        end
        Citizen.Wait(0)
    end
end)
Citizen.CreateThread(function()
    while true do
        if model_info then
            Citizen.Wait(1000)
            if(secondsRemaining > 0)then
                secondsRemaining = secondsRemaining - 1
            end
        end

        Citizen.Wait(0)
    end
end)
Citizen.CreateThread(function()
    while true do
        if mp_check_message then
            Citizen.Wait(1000)
            if(secondsRemaining2 > 0)then
                secondsRemaining2 = secondsRemaining2 - 1
            end
        end

        Citizen.Wait(0)
    end
end)