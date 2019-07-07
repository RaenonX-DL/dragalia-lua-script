Logger = dofile(scriptPath() .. "script/Logger.lua")

local m = {}

m.counter_runs = 0

local function count_once() 
	m.counter_runs = m.counter_runs + 1
	Logger.write_log(string.format("Battle #%d was completed at %s\n", m.counter_runs, os.date("%c")))
end

m.count_once = count_once

return m