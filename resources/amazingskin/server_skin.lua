require "resources/essentialmode/lib/MySQL"
-- MySQL:open("127.0.0.1", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

RegisterServerEvent("mm:spawn")
AddEventHandler("mm:spawn", function()
	TriggerEvent("es:getPlayerFromId", source, function(target)
		local executed_query = MySQL:executeQuery("SELECT identifier FROM modelmenu WHERE identifier = '@name'", {['@name'] = target.identifier})
		local result = MySQL:getResults(executed_query, {'identifier'}, "identifier")

		if(result[1] == nil) then
			local executed_query2 = MySQL:executeQuery("INSERT INTO modelmenu(identifier) VALUES ('@name')",{['@name']= target.identifier})
			TriggerClientEvent("mm:firstspawn", source)
		else
			local mpmodel = getModelIsMP(target.identifier)
			if(mpmodel == 0) then
			local model = getmodels(target.identifier)
			TriggerClientEvent("mm:changemodelspawn", source, model)
			end
			if(mpmodel == 1) then
			local model = getmodels(target.identifier)
			TriggerClientEvent("mm:changempmodelspawn", source, model)
			end
		end
	end)
end)

RegisterServerEvent("mm:checkCustomisation")
AddEventHandler("mm:checkCustomisation", function()
	TriggerEvent("es:getPlayerFromId", source, function(target)
		local mpmodel = getModelIsMP(target.identifier)
		if(mpmodel == 0) then
			TriggerClientEvent("mm:Customisationisanonono", source)
		else
			TriggerClientEvent("mm:Customisationisagogogo", source)
		end
	end)
end)

RegisterServerEvent("mm:spawn2")
AddEventHandler("mm:spawn2", function()
	TriggerEvent("es:getPlayerFromId", source, function(target)
		local executed_query = MySQL:executeQuery("SELECT mask,mask_txt,hair,hair_colour,shoe,shoe_txt,shirt,shirt_txt,hand,pants,pants_txt,undershirt,undershirt_txt,armour,armour_txt,head,helmet,helmet_txt,glasses,glasses_txt FROM modelmenu WHERE identifier = '@name'", {['@name'] = target.identifier})
		local result = MySQL:getResults(executed_query, {'mask', 'mask_txt', 'hair', 'hair_colour', 'shoe', 'shoe_txt', 'shirt', 'shirt_txt', 'hand', 'pants', 'pants_txt', 'undershirt', 'undershirt_txt', 'armour', 'armour_txt', 'head', 'helmet', 'helmet_txt', 'glasses', 'glasses_txt'})
		local user = {
        hair = result[1].hair,
        hcolour = result[1].hair_colour,
        shirt = result[1].shirt,
        shirt_txt = result[1].shirt_txt,
        pants = result[1].pants,
        pants_txt = result[1].pants_txt,
        undershirt = result[1].undershirt,
        undershirt_txt = result[1].undershirt_txt,
        shoe = result[1].shoe,
        shoe_txt = result[1].shoe_txt,
        hand = result[1].hand,
        mask = result[1].mask,
        mask_txt = result[1].mask_txt,
        head = result[1].head,
        armour = result[1].armour,
        armour_txt = result[1].armour_txt,
        helmet = result[1].helmet,
        helmet_txt = result[1].helmet_txt,
        glasses = result[1].glasses,
		glasses_txt = result[1].glasses_txt
		}
		TriggerClientEvent("mm:changeeverything_spawn", source, user)
	end)
end)

RegisterServerEvent("mm:timer")
AddEventHandler("mm:timer", function()
    SetTimeout(10500, function()
    	TriggerClientEvent("mm:timerend", source)    	
    end)
end)

RegisterServerEvent("mm:timer2")
AddEventHandler("mm:timer2", function()
    SetTimeout(10500, function()
    	TriggerClientEvent("mm:timerend2", source)    	
    end)
end)

function getModelIsMP(identifier)
	local executed_query = MySQL:executeQuery("SELECT mpmodel FROM modelmenu WHERE identifier = '@name'", {['@name'] = identifier})
	local result = MySQL:getResults(executed_query, {'mpmodel'})
    local mpmodel = result[1].mpmodel
	return mpmodel
end

function getmodels(identifier)
	local executed_query = MySQL:executeQuery("SELECT model FROM modelmenu WHERE identifier = '@name'", {['@name'] = identifier})
	local result = MySQL:getResults(executed_query, {'model'})
    local model = result[1].model
	ChangeIdGender(model, identifier)
	return model
end

function doesItMatch(str)
  for word in string.gmatch(str, '([^_]+)') do
      if word == "m" then
        value = "M"
        break
      elseif word == "f" then
        value = "F"
        break
      end
    
  end
  return value
end

function ChangeIdGender(model, identifier)
	local gender = doesItMatch(model)
	local gender_query = MySQL:executeQuery("UPDATE users SET gender = '@gender' WHERE identifier='@user'",{['@gender']= gender ,['@user']= identifier})
end

RegisterServerEvent("mm:savempmodel")
AddEventHandler("mm:savempmodel",function(model)
	TriggerEvent('es:getPlayerFromId', source, function(target)
		local executed_query_mp = MySQL:executeQuery("UPDATE modelmenu SET mpmodel = 1 WHERE identifier='@user'",{['@user']= target.identifier})
		local executed_query = MySQL:executeQuery("UPDATE modelmenu SET model='@model' WHERE identifier='@user'",{['@model']= model,['@user']= target.identifier})
		local executed_query2 = MySQL:executeQuery("SELECT identifier FROM modelmenu WHERE identifier='@user'",{['@user']= target.identifier})
		local result = MySQL:getResults(executed_query2, {'identifier'}, "identifier")
		if result[1].identifier ~= nil then
			TriggerClientEvent("mm:changempmodel", source, model)
		else
			TriggerClientEvent("mm:changempmodel", source, model)
		end
	end)
end)

RegisterServerEvent("mm:savemodel")
AddEventHandler("mm:savemodel",function(model)
	TriggerEvent('es:getPlayerFromId', source, function(target)
		local executed_query_mp = MySQL:executeQuery("UPDATE modelmenu SET mpmodel = 0 WHERE identifier='@user'",{['@user']= target.identifier})
		local executed_query = MySQL:executeQuery("UPDATE modelmenu SET model='@model' WHERE identifier='@user'",{['@model']= model,['@user']= target.identifier})
		local executed_query2 = MySQL:executeQuery("SELECT identifier FROM modelmenu WHERE identifier='@user'",{['@user']= target.identifier})
		local result = MySQL:getResults(executed_query2, {'identifier'}, "identifier")
		if result[1].identifier ~= nil then
			TriggerClientEvent("mm:changemodel", source, model)
		else
			TriggerClientEvent("mm:changemodel", source, model)
		end
	end)
end)

RegisterServerEvent("mm:saveeverything")
AddEventHandler("mm:saveeverything",function(user)
	TriggerEvent('es:getPlayerFromId', source, function(target)
		local executed_query = MySQL:executeQuery("UPDATE modelmenu SET armour='@armour', armour_txt='@atxt', head='@head', mask='@mask', mask_txt='@mtxt', hair='@hair', hair_colour='@hcolour', shirt='@shirt', shirt_txt='@stxt', hand='@hand', shoe='@shoe', shoe_txt='@shtxt', pants='@pants', pants_txt='@ptxt', undershirt='@undershirt', undershirt_txt='@ustxt', helmet='@helmet', helmet_txt='@htxt', glasses='@glasses', glasses_txt='@gtxt' WHERE identifier='@user'",{['@armour']= user.armour,['@atxt']= user.armour_txt,['@head']= user.head,['@mask']= user.mask,['@mtxt']= user.mask_txt,['@hair']= user.hair,['@hcolour']= user.hcolour,['@shirt']= user.shirt,['@stxt']= user.shirt_txt,['@hand']= user.hand,['@shoe']= user.shoe,['@shtxt']= user.shoe_txt,['@pants']= user.pants,['@ptxt']= user.pants_txt,['@undershirt']= user.undershirt,['@ustxt']= user.undershirt_txt,['@helmet']= user.helmet,['@htxt']= user.helmet_txt,['@glasses']= user.glasses,['@gtxt']= user.glasses_txt,['@user']= target.identifier})
		local executed_query2 = MySQL:executeQuery("SELECT identifier FROM modelmenu WHERE identifier='@user'",{['@user']= target.identifier})
		local result = MySQL:getResults(executed_query2, {'identifier'}, "identifier")
		if result[1].identifier ~= nil then
			TriggerClientEvent("mm:changeeverything", source, user)
		else
			TriggerClientEvent("mm:changeeverything", source, user)
		end
	end)
end)