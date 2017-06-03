Citizen.CreateThread(function()
  while true do
    Wait(0)

    local player = GetPlayerPed(-1)
    local isPlayerInCar = IsPedInAnyVehicle(player)

    if IsControlJustPressed(1, 303) then -- 303 is the 'U' key
      AddTextComponentString("press key")
      DrawNotification(false, false)

        local posPlayer = GetEntityCoords(player, false)
        local playerX, playerY, playerZ = posPlayer.x, posPlayer.y, posPlayer.z
        local radius = 2.0
        local nearestVeh = GetClosestVehicle(playerX, playerY, playerZ, radius, 0, 70)
        local nearestVehPlate = GetVehicleNumberPlateText(nearestVeh)
        if nearestVehPlate ~= nil then
          TriggerServerEvent('veh:checkveh', nearestVeh, nearestVehPlate)
        end       
    end

  end
end)

RegisterNetEvent('InteractSound_SV:PlayWithinDistance')
RegisterNetEvent('veh:rcheckveh')
AddEventHandler('veh:rcheckveh', function(veh, playerGotThisVeh)
  local nearestVehPlate = GetVehicleNumberPlateText(veh)
  if playerGotThisVeh then
    local isLocked = GetVehicleDoorLockStatus(veh)

    if isLocked == 1 or isLocked == 0 then

      SetVehicleDoorsLocked(veh, 2)
      TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'lock', 0.5)
      --SetNotificationTextEntry("STRING")
      --AddTextComponentString("Véhicule ~r~fermé~w~")
      --DrawNotification(false, false)
      TriggerEvent("pNotify:SendNotification", { text = "Tu as <b style='color:red'>fermé</b> ton véhicule", type = "info", timeout = 250, layout = "centerLeft",})  
    else
      SetVehicleDoorsLocked(veh, 1)
      TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'unlock', 0.5)
      --SetNotificationTextEntry("STRING")
      --AddTextComponentString("Véhicule ~g~ouvert~w~")
      TriggerEvent("pNotify:SendNotification", { text = "Tu as <b style='color:green'>ouvert</b> ton véhicule", type = "info", timeout = 250, layout = "centerLeft",})  
     -- DrawNotification(false, false)
    end
  else
    --SetNotificationTextEntry("STRING")
    --AddTextComponentString("Tu n'as pas les clefs!")
    --DrawNotification(false, false)
    TriggerEvent("pNotify:SendNotification", { text = "Tu n'as pas les clefs du véhicule", type = "warning", timeout = 2500, layout = "centerLeft",})  
  end
end)
