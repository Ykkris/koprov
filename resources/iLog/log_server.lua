start = false -->
file = nil

RegisterServerEvent("log:addLogServer")
AddEventHandler('log:addLogServer', function(name, tag, log)
   addLog(log, tag, name)
end)

--[[RegisterServerEvent("log:addLogClient")
AddEventHandler("log:addLogClient", function() On pourra ajouter des logs pour le client

end) ]]
AddEventHandler("onResourceStart", function(resource)
	if resource == "iLog" then
		start = true
		print("Logger Initialized")

		-- tests the functions above
		local dayMonthYear = os.date("%d.%m.%Y")
		file = 'resources/iLog/log/'..dayMonthYear..'.log' -- à changer avec la date
		local lines = lines_from(file)
		print("Creating/Loading log file : "..file)
	end
end)

function addLog(log, tag, sourceResourceName)
	openFile = io.open(file, "a")
	io.output(openFile)
	local heureMinuteSeconde =  "["..tostring(os.date("%H.%M.%S", os.time() - 2 * 60 * 60)).."] "
	local resourceName = "["..sourceResourceName.."]"
	if tag==false then
		io.write("\n"..heureMinuteSeconde.. resourceName .. " : ".. log)
	else
		local tag = "{"..tag.."}"
		io.write("\n"..heureMinuteSeconde..resourceName.. tag .. " : ".. log)
	end
	io.close(openFile)
end

-- see if the file exists
function file_exists(file)

  local f = io.open(file, "a")
  if f then io.close(file) end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
 	f = io.open(file, "a")
 	io.flush(f)
 	io.close(f)
end

AddEventHandler('rconCommand', function(commandName, args)
    if commandName == "logadd" then
        local msg = table.concat(args, ' ')
        addLog(msg, "WARNING", "resourceA")
        RconPrint('console: ' .. msg .. "\n")

        CancelEvent()
    end
end)
