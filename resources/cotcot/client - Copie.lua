RequestModel( GetHashKey( "A_C_Cow" ) )
while ( not HasModelLoaded( GetHashKey( "A_C_Cow" ) ) ) do
    Citizen.Wait( 1 )
end

Citizen.CreateThread(function()
    local pop_finish = false
    local count = 0
    if not(pop_finish) then
      while count > 0 do
        poulet = CreatePed(28, 0xFCFA9E1E, 2126.68, 5013.56, 40.42, 0.0, false)
    
       pop_finish = true
      end
    end
end)
