-- This is Koprov team proprety. --
-- You can use it, share it and modify it BUT you're not allowed to make benefit with it. --
-- Contact us for more informations at koprov.fr --
require "resources/essentialmode/lib/MySQL"
MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")





--function IsPlayerGotThisVeh(player, vehPlate) -- vehplate string
--  local executed_query = MySQL:executeQuery("SELECT * FROM user_vehicle WHERE identifier = '@name' AND vehicle_plate = '@plate'",
-- {['@name'] = player, ['@plate'] = vehPlate})
--  local result = MySQL:getResults(executed_query, {'identifier'})
--  local match = false
--  if result[1] then
--    match = true
--  end
  --for i,j in iparis(result) do
  --	if (tostring(vehplate) == tostring(v.vehicle_plate)) then 
	--	match = true
  --	end
  -- end

--  return match
--end

--RconPrint(tostring(IsPlayerGotThisVeh( , 03YCZ856))

--RegisterServerEvent('veh:checkveh')
--AddEventHandler('veh:checkveh', function(veh, plate)
--	TriggerEvent('es:getPlayerFromId', source, function(user)
--    local player = user.identifier
--  	TriggerClientEvent('veh:rcheckveh', source, veh, IsPlayerGotThisVeh(player, plate), true)
--  end)
-- end)
