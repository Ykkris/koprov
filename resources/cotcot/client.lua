local firstspawn = 0
local peds = { { 2126.68, 5013.56, 41.42} }
local thisPed
local pedCoords = {}
local storedPeds = {}
AddEventHandler('playerSpawned', function(spawn)
  if firstspawn == 0 then
    for i=1, 10, 1 do
      pedCoords = peds[i]
      thisPed = CreatePed(26, 1706635382, pedCoords[1], pedCoords[2], pedCoords[3], 0.0, true, true)
      table.insert(storedPeds, {ped = thisPed})
      SetEntityInvincible(thisPed, true)
    end
    firstspawn = 1
  end
end)
