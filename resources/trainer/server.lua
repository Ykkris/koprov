RegisterServerEvent("ID") --Just Don't Edit!
RegisterServerEvent("GetID") --Just Don't Edit!

AddEventHandler("ID", function()
	local ID = GetPlayerIdentifiers(source)[1]
	if ID == "steam:110000101f91cd2" then --Change This To Your Steam Identifier
		TriggerClientEvent("admin", source)
	end
end)

AddEventHandler("GetID", function()
	local ID = GetPlayerIdentifiers(source)[1]
	print("" .. ID .. "")
end)

--[[
To Get Your Steam Identifier set "OnlyForAdmins" to "false" in the main.lua, then run FiveM,
join YOUR Server. Once your Ped Spawned, press the following Buttoncombi:

--->>>		Button for VEHICLE AIM + Button for PED COVER + Button for PED SPRINT.		<<<---

It Outputs the Identifier in your RCON Log. Edit this File (Replace steam:110000XXXXXXXXX with your Identifier)
Set "OnlyForAdmins" to "true" in the main.lua and you are good to go. Have Fun. :D
]]