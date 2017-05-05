-- This is Koprov team proprety. --
-- You can use it, share it and modify it BUT you're not allowed to make benefit with it. --
-- Contact us for more informations at koprov.fr --
require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")


function IsPlayerGotThisVeh(player, vehplate) -- veh is id veh (int)
  local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@name'", {['@name'] = player})
  local result = MySQL:getResults(executed_query, {'vehicle_plate'}, "identifier")
  if (vehplate == result[1].vehicle_plate) then 
	return true
  else
	return false
  end
end

RegisterServerEvent('veh:checkveh')
AddEventHandler('veh:checkveh', function(veh)
	local ishegotveh = IsPlayerGotThisVeh(source, veh) 
	RconPrint(tostring(ishegotveh))
	TrigerClientEvent('veh:rcheckveh', source, ishegotveh)
	CancelEvent()
end)
