Citizen.CreateThread(
  function()
    while true do
      Wait(0)

      local isPlayerInCar = IsPedInAnyVehicle(GetPlayerPed(-1))

      if (IsControlJustPressed(1, 303) and not(isPlayerInCar)) then -- 303 is the 'U' key
        Citizen.Trace("test")
        
        local player = GetPlayerPed(-1)
        local posPlayer = GetEntityCoords(player, false)
        local playerX, playerY, playerZ = posPlayer.x, posPlayer.y, posPlayer.z
        local radius = 20.0
        local nearestVeh = GetClosestVehicle(playerX, playerY, playerZ, radius)
        local nearestVehPlate = GetVehicleNumberPlateText(nearestVeh)

        TriggerServerEvent('veh:checkveh', tostring(nearestVehPlate))

        RegisterNetEvent('veh:rcheckveh')
        AddEventHandler('veh:rcheckveh',
          function(IsPlayerGotThisVeh)
            if IsPlayerGotThisVeh then
              local isLocked = GetVehicleDoorLockStatus(nearestVeh)

              if isLocked == 1 or isLocked == 0 then

                SetVehicleDoorsLocked(nearestVeh, 2)
              else
                SetVehicleDoorsLocked(nearestVeh, 1)
              end
            else
              TriggerEvent('chatMessage', "", {255, 0, 0}, "^1Tu n'as pas les clefs!")
            end
          end
        )
      end
    end
  end
)
