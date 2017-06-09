require "resources/mysql-async/lib/MySQL"
local isBuy = 0

local lang = 'fr'

local txt = {
  ['fr'] = {
        ['welcome'] = 'Bienvenue dans votre appartement!\n',
        ['nocash'] = 'Vous n\'avez pas assez d\'argent!\n',
        ['estVendu'] = 'Appartement vendus!\n'
  },

    ['en'] = {
        ['welcome'] = 'Welcome to home!\n',
        ['nocash'] = 'You d\'ont have enough cash!\n',
        ['estVendu'] = 'Apartment sold!\n'
    }
}

---------------------------
------CHOSE SQL MODE-------
---------------------------
--Async   -----------------
--MySQL   -----------------
--Couchdb ----------------- (soon)
---------------------------
local mode = Async


RegisterServerEvent("apart:getAppart")
AddEventHandler('apart:getAppart', function(name)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    if (mode == Async) then
      MySQL.Async.fetchAll("SELECT * FROM user_appartement WHERE name = @nom", {['@nom'] = tostring(name)}, function (result)
        if (result) then
          count = 0
          for _ in pairs(result) do
            count = count + 1
          end
          if count > 0 then
          	if (result[1].identifier == player) then
          		TriggerClientEvent('apart:isMine', source)
          	else
              	TriggerClientEvent('apart:isBuy', source)
          	end
          else
          	TriggerClientEvent('apart:isNotBuy', source)
          end
        end
      end)
    elseif mode == MySQL then
      --DO THE SCRIPT FOR MYSQL
    end
  end)
end)

RegisterServerEvent("apart:buyAppart")
AddEventHandler('apart:buyAppart', function(name, price)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    local price = price
    if (tonumber(user.money) >= tonumber(price)) then
        user:removeMoney((price))
      if (mode == Async) then
    	  MySQL.Async.execute("INSERT INTO user_appartement (`identifier`, `name`, `price`) VALUES (@username, @name, @price)", {['@username'] = player, ['@name'] = name, ['@price'] = price})
      elseif mode == MySQL then
        --DO THE SCRIPT FOR MYSQL
      end
    	TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['welcome'])
    	TriggerClientEvent('apart:isMine', source)
    else
    	TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['nocash'])
    end
  end)
end)

RegisterServerEvent("apart:sellAppart")
AddEventHandler('apart:sellAppart', function(name, price)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local name = name
    local price = price/2
    user:addMoney((price))
      if (mode == Async) then
        MySQL.Async.execute("DELETE from user_appartement WHERE identifier = @username AND name = @name",
        {['@username'] = player, ['@name'] = name})
      elseif mode == MySQL then
        --DO THE SCRIPT FOR MYSQL
      end
      TriggerClientEvent("es_freeroam:notify", source, "CHAR_SIMEON", 1, "Stephane", false, txt[lang]['estVendu'])
      TriggerClientEvent('apart:isNotBuy', source)
  end)
end)