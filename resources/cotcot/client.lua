Citizen.CreateThread(function()
    local pop_finish = false
    local count = 0
    if not(pop_finish) then
      while count > 0 do
        poulet = CreatePed(28, 1794449327, 2126.68, 5013.56, 40.42, 0.0, false)
        SetEntityAsMissionEntity(poulet, true, true)
    
       pop_finish = true
      end
    end
    
    
end)
