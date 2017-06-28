-- ●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●
-- ..░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░..
-- ..░█░█░█░█▀▀▀░█░░░░█▀▀▀░█▀▀█░█▀█▀█░█▀▀▀░..
-- ..░█░█░█░█▀▀▀░█░░░░█░░░░█░░█░█░█░█░█▀▀▀░.. Art painting by Juju
-- ..░▀▀▀▀▀░▀▀▀▀░▀▀▀▀░▀▀▀▀░▀▀▀▀░▀░▀░▀░▀▀▀▀░..
-- ..░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░..
-- ●▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬●

local position = {0.1060,  0.378}
local boxSize = {0.1550, 0.040}
local indexSelected = 1
local forIndex = 1

local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

function DrawAdvancedTextInformation(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end


mainMenu =
{
  id = nil,
  title = "Entrepôt",
  visible = false,
  visibleLenght = 7,
  listitem = {

    {text = "Déposer", onclick = function()
      mainMenu.visible = false
      deposer.id = mainMenu.id
      retirer.visible = false

      deposer.visible = true
      activeMenu = deposer
      indexSelected = 1
      TriggerServerEvent("item:getItems")
    end},
    {text = "Recupérer", onclick = function()
      mainMenu.visible = false
      deposer.visible = false
      retirer.id = mainMenu.id
      retirer.visible = true
      activeMenu = retirer
      indexSelected = 1
      TriggerServerEvent("coffre:getCoffre", mainMenu.id) -- useless here

    end},
    {text = "Sortir", onclick = function()
      mainMenu.visible = false
      deposer.visible = false
      retirer.visible = false
      indexSelected = 1
      TriggerServerEvent("item:getItems") -- useless here

    end}
  }
}

deposer =
{
  id = nil,
  title = "Entrepôt: Déposer",
  visible = false,
  visibleLenght = 7,
  listitem = {
    {text = "Retour", onclick = function()
     deposer.visible = false
     retirer.visible = false
     mainMenu.visible = true
     activeMenu = deposer
     indexSelected = 1

   end}
  }
}

retirer =
{
  id = nil,
  title = "Entrepôt: Retirer",
  visible = false,
  indexSelected = 1,
  visibleLenght = 7,
  listitem = {
    {text = "Retour", onclick = function()
     deposer.visible = false
     retirer.visible = false
     mainMenu.visible = true
     activeMenu = mainMenu
     indexSelected = 1

   end}
  }
}



modelSelector = {
  title = "Fermier: Spawn Vehicule",
  visible = false,
  visibleLenght = 15,
  listitem = {
    {text = "Van A", onclick = function()
      model = "Burrito3"
      modelSelector.visible = false
      colorSelector.visible = true
      indexSelected = 1
    end},
    {text = "Van B", onclick = function()
      model = "Rumpo"
      modelSelector.visible = false
      colorSelector.visible = true
      indexSelected = 1
    end},
    {text = "Retour", onclick = function()
    modelSelector.visible = false
    colorSelector.visible = false
    indexSelected = 1

  end}
  }
}

colorSelector = {
  title = "Fermier: Spawn Vehicule",
  visible = false,
  visibleLenght = 15,
  listitem = {

    {text = "Color Default", onclick = function()
      createFermierVehicle(model, 80,81,72)
      modelSelector.visible = false
      colorSelector.visible = false
    end},

    {text = "Sheepy Color", onclick = function()
      createFermierVehicle(model, 99,19,142)
      modelSelector.visible = false
      colorSelector.visible = false
    end},

    {text = "Nice Color", onclick = function()
      createFermierVehicle(model, 160,24,124)
      modelSelector.visible = false
      colorSelector.visible = false
    end},

    {text = "Retour", onclick = function()
      modelSelector.visible = false
      colorSelector.visible = false
    end}
  }
}


activeMenu = mainMenu
GlobalMenu = {
  mainMenu, deposer, retirer, modelSelector, colorSelector
}

function createFermierVehicle(model, r,g,b)
  local vehicle = GetHashKey(model)
  RequestModel(vehicle)

  while not HasModelLoaded(vehicle) do
    Wait(1)
  end
  local random_n_plate = math.random(10, 99)
  local plate = "KO"..tostring(random_n_plate).."SOV"
  local spawned_camion = CreateVehicle(vehicle, -156.719, 6194.7, 31.382, false, true)
  SetEntityAsMissionEntity( spawned_camion, true, true)
  SetVehicleHasBeenOwnedByPlayer(spawned_camion, myPed)
  SetVehicleOnGroundProperly(spawned_camion)
  SetVehicleNumberPlateText(spawned_camion, plate)
  SetVehicleTyreFixed(spawned_camion, 4)
  SetVehicleTyreSmokeColor(spawned_camion, r, g, b)
  SetVehicleCustomPrimaryColour(spawned_camion, r, g, b)
  SetPedIntoVehicle(GetPlayerPed(-1), spawned_camion, -1)
end

local enableControl = false

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if enableControl then
      for _,MyMenu in ipairs(GlobalMenu) do

        if MyMenu.visible == false then
        else
          DrawRect(position[1] , position[2] + 0.15 - (boxSize[2] + 0.008), boxSize[1], boxSize[2], 0, 0, 0, 1)
          DrawRect(position[1] , position[2] + 0.0075 - (boxSize[2] + 0.008), boxSize[1], boxSize[2] + 0.005, 233, 233, 233, 250)
          DrawAdvancedTextInformation(position[1] + 0.100, position[2] - (boxSize[2] + 0.008), 0.005, 0.0028, 0.8, MyMenu.title, 255, 255, 255, 255, 1, 0)

          if indexSelected - #MyMenu.listitem > MyMenu.visibleLenght * - 1 then
            forIndex = forIndex
          else
            forIndex = indexSelected
          end
          index = 0
          for i=forIndex, #MyMenu.listitem do
            if index < MyMenu.visibleLenght then -- max item to show
              item = MyMenu.listitem[i]
              backgroundColor = {0,0,0,200}
              if i == indexSelected then
                backgroundColor = {52, 152, 219,200}
              end
              DrawRect(position[1] , position[2] + index * boxSize[2], boxSize[1], boxSize[2], backgroundColor[1], backgroundColor[2], backgroundColor[3], backgroundColor[4])
              DrawAdvancedTextInformation(position[1] + 0.095, position[2] + index * boxSize[2] + boxSize[2] / 40, 0.005, 0.0028, 0.4, item.text, 255, 255, 255, 255, 4, 0)
            end
          index = index + 1
          end
        end
      end
    end
end
end)

RegisterNetEvent("coffre:cbCoffre")
AddEventHandler("coffre:cbCoffre", function(coffre)
  Citizen.Trace("coffrecb")
  for _, menu in ipairs(GlobalMenu) do
    if string.match(menu.title, "Retirer") then
      Citizen.Trace(json.encode(coffre))
      if menu.visible == true and menu.id == coffre.id then
        menu.listitem = {}
        for i, item in ipairs(coffre.inventory) do
          if item.quantity ~= 0 then
            menu.listitem[#menu.listitem + 1] = {text = item.name .. "(" .. tostring(item.quantity).. ")", name = item.name, quantity = item.quantity, id = item.id, onclick = function()
              DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
              while (UpdateOnscreenKeyboard() == 0) do
                  DisableAllControlActions(0)
                  Wait(0)
              end
              if (GetOnscreenKeyboardResult()) then
                  quantity =  tonumber(GetOnscreenKeyboardResult())
                  if(quantity > 0) then
                    quantity = quantity * -1
                  end
                  TriggerServerEvent("coffre:changeQuantity", tonumber(menu.id), tonumber(item.id), quantity, item.name)
              end
            end}
          end
        end
        menu.listitem[#menu.listitem + 1] = {text = "Retour", onclick = function()
          retirer.visible = false
          mainMenu.visible = true
        end}
      end
    end
  end
end)

RegisterNetEvent("gui:getItems")
AddEventHandler("gui:getItems", function(items)
  for _, menu in ipairs(GlobalMenu) do
    if string.match(menu.title, "Déposer") then
      Citizen.Trace(json.encode(items))
      if menu.visible == true then
        menu.listitem = {}
        for ind, value in pairs(items) do
          if (value.quantity > 0) then
              menu.listitem[#menu.listitem + 1] = {text = value.libelle .. "(" .. value.quantity.. ")", name = value.libelle, quantity = value.quantity, id = ind, onclick = function()
                DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0)
                    Wait(0)
                end
                if (GetOnscreenKeyboardResult()) then
                    quantity = tonumber(GetOnscreenKeyboardResult())
                    if quantity < 0 then
                      quantity = quantity * -1
                    end
                    TriggerServerEvent("coffre:changeQuantity", tonumber(menu.id), tonumber(ind), quantity, value.libelle)
                    TriggerServerEvent("item:getItems")
                end
              end}
          end
        end

        menu.listitem[#menu.listitem + 1] = {text = "Retour", onclick = function()
          deposer.visible = false
          mainMenu.visible = true
        end}
      end
    end
  end
end)



Citizen.CreateThread(function()
  while true do
    for _, item in ipairs(GlobalMenu) do
      if item.visible == true then
        if item ~= activeMenu then
          indexSelected = 1
        end
        activeMenu = item
      end
    end
    Citizen.Wait(1)
    if enableControl then
      if IsControlJustReleased(1, Keys["DOWN"]) then
        if indexSelected == #activeMenu.listitem then
          indexSelected = 1
        else
          indexSelected = indexSelected + 1
        end
      elseif IsControlJustReleased(1, Keys["TOP"]) then
        if indexSelected ~= 1 then
          indexSelected = indexSelected - 1
        end
      elseif IsControlJustReleased(1, Keys["NENTER"]) then
        activeMenu.listitem[indexSelected].onclick()
      end
    end
  end

end)



RegisterNetEvent("mt:missiontext")
AddEventHandler("mt:missiontext", function(text, time)
  ClearPrints()
  SetTextEntry_2("STRING")
  AddTextComponentString(text)
  DrawSubtitleTimed(time, 1)
end)
--
--
local BlipID = 103
local BlipColor = 21 -- Brown
local jobName = nil

local jobRank = nil
local jobPosition = {}
local recoltTime = 5000
local traitementTime = 5000
local venteTime = 5000



RegisterNetEvent("jobCorp:jobInfos")
AddEventHandler("jobCorp:jobInfos", function(name, rank, position)
  jobName = name
  jobRank = rank
  jobPosition = json.decode(position)

  for i, pos in ipairs(jobPosition) do
    RemoveBlip(pos.blip)
  end

  for i, pos in ipairs(jobPosition) do
    pos.blip = AddBlipForCoord(pos.x,pos.y,pos.z)
    if (pos.blipID) then
      BlipID = pos.blipID
    end
    if (pos.blipCOLOR) then
      BlipColor = pos.blipCOLOR
    end
    SetBlipSprite(pos.blip, BlipID)
    SetBlipColour(pos.blip, BlipColor)
    SetBlipAsShortRange(pos.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(pos.name)
    EndTextCommandSetBlipName(pos.blip)
  end

  id = PlayerId()
  playerName = GetPlayerName(id)
  SendNUIMessage({
    updateJob = true,
    job = name,
    player = playerName
  })
end)

RegisterNetEvent("jobCorp:fire")
AddEventHandler("jobCorp:fire", function()
  for i, pos in ipairs(jobPosition) do
    RemoveBlip(pos.blip)
  end
  jobRank = nil
  jobName = nil
  SendNUIMessage({
    updateJob = true,
    job = "Chômeur",
    player = playerName
  })
end)


Citizen.CreateThread(function()

  while true do
    Wait(100)
    enableControl = false
    -- if IsControlJustReleased(1, 38) then
    --   TriggerServerEvent("ask:source")
    -- end
    positionPlayer = GetEntityCoords(GetPlayerPed(-1))
    for i,pos in ipairs(jobPosition) do
        local distance = GetDistanceBetweenCoords(tonumber(positionPlayer.x), tonumber(positionPlayer.y), tonumber(positionPlayer.z), tonumber(pos.x), tonumber(pos.y), tonumber(pos.z), true)
        if pos.fieldType == "récolte" then
          if distance <= pos.radius then
            if exports.vdk_inventory:getQuantity(tonumber(pos.item.id)) < 30 then
              TriggerEvent("mt:missiontext", pos.fieldType .. ' en cours de ~g~' .. tostring(pos.item.name) .. '~s~...', recoltTime)
              Citizen.Wait(recoltTime)
              TriggerEvent("player:receiveItem", tonumber(pos.item.id), 1)
            else
              TriggerEvent("mt:missiontext", pos.fieldType .. ' en cours de ~g~' .. tostring(pos.item.name) .. '~s~)...', 1500)
            end
          end

        elseif pos.fieldType == "traitement" then
          if distance <= pos.radius then
            TriggerServerEvent("print:server", tostring(#pos.item.base))
            if #pos.item.base == 1 then

              conditional = true
                if exports.vdk_inventory:getQuantity(tonumber(pos.item.base[1].id)) < tonumber(pos.item.base[1].quantity) then
                  conditional = false
                end
              if conditional == true then
                TriggerEvent("mt:missiontext", pos.fieldType .. ' en cours', traitementTime)
                Citizen.Wait(traitementTime)
                TriggerEvent("player:looseItem", tonumber(pos.item.base[1].id), tonumber(pos.item.base[1].quantity))
                TriggerEvent("player:receiveItem", tonumber(pos.item.finish[1].id), tonumber(pos.item.finish[1].quantity))
              else
                TriggerEvent("mt:missiontext", pos.fieldType .. ' impossible il vous manque des ingredients ~g~ ...', 100)
              end

            elseif #pos.item.base == 2 then
              conditional = true
              for i=1, #pos.item.base do
                if exports.vdk_inventory:getQuantity(tonumber(pos.item.base[i].id)) < tonumber(pos.item.base[i].quantity) then
                  conditional = false
                  break
                end
              end
              if conditional == true then
                TriggerEvent("mt:missiontext", pos.fieldType .. ' en cours', traitementTime)
                Citizen.Wait(traitementTime)
                for i=1, #pos.item.base do
                  TriggerEvent("player:looseItem", tonumber(pos.item.base[i].id), tonumber(pos.item.base[i].quantity))
                end
                for i=1, #pos.item.finish do
                  TriggerEvent("player:receiveItem", tonumber(pos.item.finish[i].id), tonumber(pos.item.finish[i].quantity))
                end
              else
                TriggerEvent("mt:missiontext", pos.fieldType .. ' impossible il vous manque des ingredients ~g~ ...', 100)
              end
            end
          end

        elseif pos.fieldType == "vente" then
          if distance <= pos.radius then
            Citizen.Trace(tostring(jobRank))
            if jobRank == "Gérant" then
              for i=1, #pos.item do
                if exports.vdk_inventory:getQuantity(tonumber(pos.item[i].id)) > 0 then
                  TriggerEvent("mt:missiontext", pos.fieldType .. ' en cours de ~g~' .. tostring(pos.item.name) .. '~s~)...', 1500)
                  Citizen.Wait(venteTime)
                  TriggerEvent("player:sellItem", tonumber(pos.item[i].id), tonumber(pos.item[i].price))
                  break
                end
              end
              else
                TriggerEvent("mt:missiontext", 'Vous ne disposez pas du grade nécessaire à la vente', 100)
            end
          end
        elseif pos.fieldType == "entrepôt" then
          if distance <= pos.radius then
            enableControl = true
            mainMenu.id = pos.id
            mainMenu.title = pos.name
            deposer.title = pos.name .. ": Déposer"
            retirer.title = pos.name .. ": Retirer"

            if activeMenu == nil then
              activeMenu = mainMenu
              indexSelected = 1
              activeMenu.id = pos.id
              deposer.visible = false
              retirer.visible = false
              activeMenu.visible = true
            end
          end
        elseif pos.fieldType == "spawn" then
          if distance <= pos.radius then
            enableControl = true
            if colorSelector.visible == false and modelSelector.visible == false then
               activeMenu = modelSelector
               indexSelected = 1
               modelSelector.visible = true
            end
          else
            colorSelector.visible = false
            modelSelector.visible = false
          end
        end
    end
    if enableControl == false then
      activeMenu = nil
      deposer.visible = false
      retirer.visible = false
      mainMenu.visible = false
    end
  end
end)



-- Citizen.CreateThread(function()
--   while true do
--     Wait(10)
--
--     color = {r = 60, g = 60, b = 60, a = 250}
--
--     for i,pos in ipairs(jobPosition) do
--       if (pos.fieldType == "récolte") then
--         color = {r = 60, g = 60, b = 60, a = 250}
--       elseif(pos.fieldType == "traitement") then
--         color = {r = 160, g = 90, b = 160, a = 250}
--       elseif(pos.fieldType == "vente") then
--         color = {r = 152, g = 95, b = 30, a = 250}
--       elseif(pos.fieldType == "entrepôt") then
--         color = {r = 75, g = 98, b = 120, a = 250}
--       end
--
--       DrawMarker(0, pos.x, pos.y, pos.z , 0, 0, 0, 0, 0, 0, 5.01, 1.01, 5.01, color.r, color.g, color.b, color.a, 0, 0, 0,0)
--
--     end
--   end
-- end)