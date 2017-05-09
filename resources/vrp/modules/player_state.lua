local cfg = require("resources/vrp/cfg/player_state")

-- client -> server events
AddEventHandler("vRP:playerSpawned", function()
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    local data = vRP.getUserDataTable(user_id)
    local tmpdata = vRP.getUserTmpTable(user_id)

    if tmpdata.first_spawn then -- first spawn
      -- cascade load customization then weapons
      if data.customization == nil then
        data.customization = cfg.default_customization
      end

      if data.position ~= nil then -- teleport to saved pos
        vRPclient.teleport(source,{data.position.x,data.position.y,data.position.z})
      end

      if data.customization ~= nil then
        vRPclient.setCustomization(source,{data.customization},function()
          if data.weapons ~= nil then -- load saved weapons
            vRPclient.giveWeapons(source,{data.weapons,true})
          end
        end)
      else
        if data.weapons ~= nil then -- load saved weapons
          vRPclient.giveWeapons(source,{data.weapons,true})
        end
      end
 
      -- notify last login
      SetTimeout(15000,function()vRPclient.notify(source,{"last login "..tmpdata.last_login})end)
    else -- not first spawn (player died), don't load weapons, empty wallet, empty inventory
      vRP.setHunger(user_id,0)
      vRP.setThirst(user_id,0)
      vRP.clearInventory(user_id)
      data.phone_directory = {} -- clear phone directory after death

      vRP.setMoney(user_id,0)

      -- load character customization
      if data.customization ~= nil then
        vRPclient.setCustomization(source,{data.customization})
      end
    end

  end
end)

-- death, clear position and weapons
AddEventHandler("vRP:playerDied",function()
  print("player die")
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    local data = vRP.getUserDataTable(user_id)
    if data ~= nil then
      data.position = nil
      data.weapons = nil 
    end
  end
end)

-- updates

function tvRP.updatePos(x,y,z)
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    local data = vRP.getUserDataTable(user_id)
    if data ~= nil then
      data.position = {x = tonumber(x), y = tonumber(y), z = tonumber(z)}
    end
  end
end

function tvRP.updateWeapons(weapons)
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    local data = vRP.getUserDataTable(user_id)
    if data ~= nil then
      data.weapons = weapons
    end
  end
end

function tvRP.updateCustomization(customization)
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    local data = vRP.getUserDataTable(user_id)
    if data ~= nil then
      data.customization = customization
    end
  end
end
