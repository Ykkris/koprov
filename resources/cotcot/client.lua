RequestModel( GetHashKey( "A_C_Hen" ) )
hash = GetHashKey( "A_C_Hen" )
while ( not HasModelLoaded( GetHashKey( "A_C_Hen" ) ) ) do
    Wait(1)
end
-- CreateVehicle(MISSION.hashTruck, 12.1995, -1.174761, 73.000, 0.0, true, false)

Citizen.CreateThread(function()

    local pop_finish = false
    local count = 0
    if not(pop_finish) then
      while count >= 0 do
        poulet = CreatePed(hash, 2126.68, 5013.56, 40.42, 0.0 ,true)
        count = count + 1
      end
            pop_finish = true
    end
end)
