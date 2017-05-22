local currentlyTowedVehicle = nil
radius = 8.0

RegisterNetEvent('pv:tow')
AddEventHandler('pv:tow', function()
	
	local playerped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(playerped, true)
	
	local towmodel = GetHashKey('flatbed')
	local isVehicleTow = IsVehicleModel(vehicle, towmodel)
			
	if isVehicleTow then
	
		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
		local targetVehicle = getVehicleInDirection(coordA, coordB)

		if currentlyTowedVehicle == nil then
			if targetVehicle ~= 0 then
					Citizen.Trace(tostring(targetVehicle))
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetVehicle then
						Citizen.Trace("On a vérifier que vehicle etait diff de target")
						local postargetveh = GetEntityCoords(targetVehicle ,1)
						Citizen.Trace("On a pris les coords de targer ".. postargetveh)
						local posveh = GetEntityCoords(vehicle, 1)
						Citizen.Trace("On a prit les coords de vehicle " .. posveh)
						local diffpos = GetDistanceBetweenCoords(postargetveh.x, postargetveh.y, postargetveh.z, posveh.x, posveh.y, posveh.z, true)
						Citizen.Trace("On a fait la diff ".. diffpos)
						if diffpos <= radius then
								
							AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
							currentlyTowedVehicle = targetVehicle
							TriggerEvent("pNotify:SendNotification", {
+							type = "sucess",
+							timeout = 1000,
+							layout = "centerLeft",
+							text = "Vehicule accroché à la dépanneuse!"
+							})
							SetVehicleDerformationFixed(currentlyTowedVehicle)
								
						else
							ShowNotification("Vous n'êtes pas a coté d'un véhicule.")
						end
					else
						TriggerEvent("pNotify:SendNotification", {
+							type = "error",
+							timeout = 1000,
+							layout = "centerLeft",
+							text = "Vous ne pouvez pas accrocher votre depanneuse à votre depanneuse"
+							})
					end
				end
			else
				TriggerEvent("chatMessage", "[TOWFuckers]", {255, 255, 0}, "Theres no vehicle to tow?")
				TriggerEvent("pNotify:SendNotification", {
+							type = "error",
+							timeout = 1000,
+							layout = "centerLeft",
+							text = "il n'y a pas de vehicule a accrocher"
+							})
			end
		else
			AttachEntityToEntity(currentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
			DetachEntity(currentlyTowedVehicle, true, true)
			SetVehicleOnGroundProperly(vehicle)
			currentlyTowedVehicle = nil
			TriggerEvent("pNotify:SendNotification", {
+							type = "sucess",
+							timeout = 1000,
+							layout = "centerLeft",
+							text = "Vehicule décrocher de la dépanneuse!"
+							})
		end
	end
end)

function getVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end
	
function ShowNotification(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(false, false)
end	
