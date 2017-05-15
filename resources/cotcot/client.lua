RequestModel( GetHashKey( "A_C_Hen" ) )
hash = GetHashKey( "A_C_Hen" )
while ( not HasModelLoaded( GetHashKey( "A_C_Hen" ) ) ) do
    Wait(0)
end
-- CreateVehicle(MISSION.hashTruck, 12.1995, -1.174761, 73.000, 0.0, true, false)

Citizen.CreateThread(function()

    local pop_finish = false
    local count = 0
    if not(pop_finish) then
      while count <= 25 do
        Wait(0)
        poulet = CreatePed(28, hash, 2126.68, 5013.56, 40.42, 0.0 ,true)
        SetEntityAsMissionEntity(poulet, true, true)
        SetEntityInvincible(poulet, true)
        count = count + 1
      end
            pop_finish = true
    end
    return 1
end)
