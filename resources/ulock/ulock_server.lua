-- This is Koprov team proprety. --
-- You can use it, share it and modify it BUT you're not allowed to make benefit with it. --
-- Contact us for more informations at koprov.fr --


function IsPlayerGotThisVeh(player, vehplate) -- veh is id veh (int)
  local executed_query = MySQL:executeQuery("SELECT * FROM users_vehicle WHERE identifier = '@name'", {['@name'] = player})
  local result = MySQL:getResults(executed_query, {'vehicle_plate'}, "identifier")
  
  
  if (vehplate == result[1].vehicle_plate) then 
	return true
  else
	return false
  end
end

RegisterServerEvent('veh:checkveh')
AddEventHandler('veh:checkveh', function(veh)
	TrigerClientEvent('veh:rcheckveh', source, IsPlayerGotThisVeh(player, vehplate))
	CancelEvent()
	end)
end)