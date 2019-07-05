local m = {}

logger = io.open(scriptPath() .. "log.txt", "a+")
local function writeLog(message) 
	logger:write(message)
end

writeLog("\n===============\n")
writeLog(os.date("Starts at %c\n"))

m.writeLog = writeLog

return m