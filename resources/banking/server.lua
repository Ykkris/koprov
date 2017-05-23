require "resources/essentialmode/lib/MySQL"
MySQL:open("localhost", "gta5_gamemode_essential", "root", "5M32bNCpFdgG")

-- HELPER FUNCTIONS
function bankBalance(player)
  local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@name'", {['@name'] = player})
  local result = MySQL:getResults(executed_query, {'bankbalance'}, "identifier")
  return tonumber(result[1].bankbalance)
end

function deposit(player, amount)
  local bankbalance = bankBalance(player)
  local new_balance = bankbalance + amount
  MySQL:executeQuery("UPDATE users SET `bankbalance`='@value' WHERE identifier = '@identifier'", {['@value'] = new_balance, ['@identifier'] = player})
end

function withdraw(player, amount)
  local bankbalance = bankBalance(player)
  local new_balance = bankbalance - amount
  MySQL:executeQuery("UPDATE users SET `bankbalance`='@value' WHERE identifier = '@identifier'", {['@value'] = new_balance, ['@identifier'] = player})
end

-- Check Bank Balance
TriggerEvent('es:addCommand', 'checkbalance', function(source, args, user)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    local player = user.identifier
    local bankbalance = bankBalance(player)
    --TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Votre solde actuel: ~g~$".. bankbalance)
    TriggerClientEvent("pNotify:SendNotification", source, { text = "Tu as <b style='color:green'>" .. amount .. "$</b> sur ton compte", type = "info", timeout = 10000, layout = "centerLeft",})
    TriggerClientEvent("banking:updateBalance", source, bankbalance)
    CancelEvent()
  end)
end)

-- Bank Deposit
TriggerEvent('es:addCommand', 'deposit', function(source, args, user)
  local amount = ""
  local player = user.identifier
  for i=1,#args do
    amount = args[i]
  end
  TriggerClientEvent('bank:deposit', source, amount)
end)

RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    	if(tonumber(amount) <= tonumber(user:money)) then
        user:removeMoney((amount))
        local player = user.identifier
        deposit(player, amount)
        local new_balance = bankBalance(player)
        --TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Déposé: ~g~$".. amount .." ~n~~s~Nouveau Solde: ~g~$" .. new_balance)
        TriggerClientEvent("pNotify:SendNotification", source, { text = "<b style='color:green'>" .. amount .. "$</b> ont été déposés sur ton compte", type = "info", timeout = 10000, layout = "centerLeft",})
        TriggerClientEvent("banking:updateBalance", source, new_balance)
        TriggerClientEvent("banking:addBalance", source, amount)
        CancelEvent()
      else
        --TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Pas assez de cash!^0")
        TriggerClientEvent("pNotify:SendNotification", source, { text = "Tu n'as pas <b style='color:red'>".. amount .."$</b> sur toi", type = "warning", timeout = 10000, layout = "centerLeft",})
        CancelEvent()
      end
  end)
end)

-- Bank Withdraw
TriggerEvent('es:addCommand', 'withdraw', function(source, args, user)
  local amount = ""
  local player = user.identifier
  for i=1,#args do
    amount = args[i]
  end
  TriggerClientEvent('bank:withdraw', source, amount)
end)

RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
  TriggerEvent('es:getPlayerFromId', source, function(user)
      local player = user.identifier
      local bankbalance = bankBalance(player)
      if(tonumber(amount) <= tonumber(bankbalance)) then
        withdraw(player, amount)
        user:addMoney((amount))
        local new_balance = bankBalance(player)
        --TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Retiré: ~g~$".. amount .." ~n~~s~Nouveau Solde: ~g~$" .. new_balance)
        TriggerClientEvent("pNotify:SendNotification", source, { text = "Tu as retiré <b style='color:green'>" .. amount .. "$</b> de ton compte", type = "info", timeout = 10000, layout = "centerLeft",})
        TriggerClientEvent("banking:updateBalance", source, new_balance)
        TriggerClientEvent("banking:removeBalance", source, amount)
        CancelEvent()
      else
        --TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Pas assez d'argent sur le compte!^0")
        TriggerClientEvent("pNotify:SendNotification", source, { text = "Tu n'as pas <b style='color:red'>".. amount .."$</b> sur ton compte !", type = "warning", timeout = 10000, layout = "centerLeft",})
        CancelEvent()
      end
  end)
end)

RegisterServerEvent('bank:withdrawAmende')
AddEventHandler('bank:withdrawAmende', function(amount)
    TriggerEvent('es:getPlayerFromId', source, function(user)
        local player = user.identifier
        local bankbalance = bankBalance(player)
		withdraw(player, amount)
		local new_balance = bankBalance(player)
		--TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Nouveau Solde: ~g~$" .. new_balance)
    TriggerClientEvent("pNotify:SendNotification", source, { text = "Tu as payé(e) <b style='color:red'>".. amount .."$</b> d'amende !", type = "warning", timeout = 10000, layout = "centerLeft",})
		TriggerClientEvent("banking:updateBalance", source, new_balance)
		TriggerClientEvent("banking:removeBalance", source, amount)
		CancelEvent()
    end)
end)

-- Bank Transfer
TriggerEvent('es:addCommand', 'transfer', function(source, args, user)
  local fromPlayer
  local toPlayer
  local amount
  if (args[2] ~= nil and tonumber(args[3]) > 0) then
    fromPlayer = tonumber(source)
    toPlayer = tonumber(args[2])
    amount = tonumber(args[3])
    TriggerClientEvent('bank:transfer', source, fromPlayer, toPlayer, amount)
	else
    --TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Utilise la commande /transfer [id] [montant]^0")
    return false
  end
end)

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(fromPlayer, toPlayer, amount)
  TriggerEvent('es:getPlayerFromId', fromPlayer, function(user)
      
      transferto = user:getSessionVar("name")
      local player = user.identifier
      local bankbalance = bankBalance(player)
      if(tonumber(amount) <= tonumber(bankbalance)) then
        withdraw(player, amount)
        local new_balance = bankBalance(player)
        --TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Transféré: ~r~-$".. amount .." ~n~~s~Nouveau Solde: ~g~$" .. new_balance)
        TriggerEvent('es:getPlayerFromId', toPlayer, function(user2)
          local recipient = user2.identifier
        totransfer = user2:getSessionVar("name")
        TriggerClientEvent("pNotify:SendNotification", source, { text = "Tu as transféré(e) <b style='color:green'>" .. amount .. "$</b> à ".. transferto.first_name.." "..transferto.last_name, type = "info", timeout = 5000, layout = "centerLeft",})
        TriggerClientEvent("banking:updateBalance", source, new_balance)
        TriggerClientEvent("banking:removeBalance", source, amount)            
            deposit(recipient, amount)
            new_balance2 = bankBalance(recipient)

                TriggerClientEvent("pNotify:SendNotification", toPlayer, {
                text = "Tu as reçu <b style='color:green'>" .. amount .. "$</b> de la part de "..totransfer.first_name.." "..totransfer.last_name,type = "info",timeout = 5000,layout = "centerLeft",})


            --TriggerClientEvent("es_freeroam:notify", toPlayer, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Reçu: ~g~$".. amount .." ~n~~s~Nouveau Solde: ~g~$" .. new_balance2)
            TriggerClientEvent("banking:updateBalance", toPlayer, new_balance2)
            TriggerClientEvent("banking:addBalance", source, amount)
            CancelEvent()
        end)
        CancelEvent()
      else
        --TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Pas assez d'argent sur le compte!^0")
        TriggerClientEvent("pNotify:SendNotification", source, { text = "Tu n'as pas <b style='color:red'>".. amount .."$</b> sur ton compte !", type = "warning", timeout = 10000, layout = "centerLeft",})
        CancelEvent()
      end
  end)
end)

-- Give Cash
TriggerEvent('es:addCommand', 'givecash', function(source, args, user)
  local fromPlayer
  local toPlayer
  local amount
  if (args[2] ~= nil and tonumber(args[3]) > 0) then
    fromPlayer = tonumber(source)
    toPlayer = tonumber(args[2])
    amount = tonumber(args[3])
    TriggerClientEvent('bank:givecash', source, toPlayer, amount)
	else
    TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Utilise la commande /givecash [id] [montant]^0")
    return false
  end
end)

RegisterServerEvent('bank:givecash')
AddEventHandler('bank:givecash', function(toPlayer, amount)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		if (tonumber(user.money) >= tonumber(amount)) then
			local player = user.identifier
			user:removeMoney(amount)
			TriggerEvent('es:getPlayerFromId', toPlayer, function(recipient)
				recipient:addMoney(amount)
				TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Argent donnée: ~r~-$".. amount .." ~n~~s~Cash: ~g~$" .. user.money)
				TriggerClientEvent("es_freeroam:notify", toPlayer, "CHAR_BANK_MAZE", 1, "KoprovBank", false, "Argent donnée: ~g~$".. amount .." ~n~~s~Cash: ~g~$" .. recipient.money)
			end)
		else
			if (tonumber(user.money) < tonumber(amount)) then
        TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1Pas assez de cash!^0")
        CancelEvent()
			end
		end
	end)
end)

AddEventHandler('es:playerLoaded', function(source)
  TriggerEvent('es:getPlayerFromId', source, function(user)
      local player = user.identifier
      local bankbalance = bankBalance(player)
      TriggerClientEvent("banking:updateBalance", source, bankbalance)
    end)
end)
