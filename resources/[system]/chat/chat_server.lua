RegisterServerEvent('chatCommandEntered')
RegisterServerEvent('chatMessageEntered')

-- Test if message is one of there commands 
allowed_commands = {'/givecash', '/transfert', '/tow'}
function isAllowedCommand(message)
    allowed = false
    for i,c in pairs(allowed_commands) do
        if string.sub(message,1,string.len(c)) == c then
            allowed = true
        end
    end
    return allowed
end
------

AddEventHandler('chatMessageEntered', function(name, color, message)
    TriggerEvent("es:getPlayerFromId", source, function(user)
        if not(user.permission_level > 2 or isAllowedCommand(message)) then
            return
        end

        if not name or not color or not message or #color ~= 3 then
            return
        end

        TriggerEvent('chatMessage', source, name, message)

        if not WasEventCanceled() then
            TriggerClientEvent('chatMessage', -1, name, color, message)
        end

        print(name .. ': ' .. message)
    end)
end)

-- player join messages
--AddEventHandler('playerActivated', function()
    --TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, '^2* ' .. GetPlayerName(source) .. ' joined.')
--end)

--AddEventHandler('playerDropped', function(reason)
    --TriggerClientEvent('chatMessage', -1, '', { 0, 0, 0 }, '^2* ' .. GetPlayerName(source) ..' left (' .. reason .. ')')
--end)

-- say command handler
AddEventHandler('rconCommand', function(commandName, args)
    if commandName == "say" then
        local msg = table.concat(args, ' ')

        TriggerClientEvent('chatMessage', -1, 'console', { 0, 0x99, 255 }, msg)
        RconPrint('console: ' .. msg .. "\n")

        CancelEvent()
    end
end)

-- tell command handler
AddEventHandler('rconCommand', function(commandName, args)
    if commandName == "tell" then
        local target = table.remove(args, 1)
        local msg = table.concat(args, ' ')

        TriggerClientEvent('chatMessage', tonumber(target), 'console', { 0, 0x99, 255 }, msg)
        RconPrint('console: ' .. msg .. "\n")

        CancelEvent()
    end
end)
