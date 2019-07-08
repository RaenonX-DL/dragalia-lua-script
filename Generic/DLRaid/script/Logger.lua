local m = {}

logger = io.open(scriptPath() .. "log.txt", "a+")

local function write_log(message) 
	logger:write(message)
end

local function screenshot_message_file_suffix(message, file_suffix)
	fileName = string.format("log/%s-%s.png", os.date("%y%m%d-%H%M%S"), file_suffix)

	logger:write(string.format("Screenshot saved at %s. Message: %s", fileName, message))
	logger:write(message)

	screen = getAppUsableScreenSize()
	reg = Region(0, 0, screen:getX(), screen:getY())
	reg:save(fileName)
end

local function screenshot_message(message)
	screenshot_message_file_suffix(message, "")
end

local function write_header()
	write_log("\n===============\n")
	write_log(os.date("Starts at %c\n"))
end

m.write_log = write_log
m.write_header = write_header
m.screenshot_message = screenshot_message
m.screenshot_message_file_suffix = screenshot_message_file_suffix

return m