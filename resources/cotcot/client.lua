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
      while count <= 50 do
        poulet = CreatePed(28, hash, 2126.68, 5013.56, 40.42, 0.0 ,true)
        count = count + 1
      end
            pop_finish = true
    end
end)
