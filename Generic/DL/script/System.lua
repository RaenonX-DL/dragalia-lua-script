States = dofile(scriptPath() .. "script/State.lua")
Configs = dofile(scriptPath() .. "script/Configs.lua")

local m = {}

begin_t = Timer()

-- Update Stop Message
local function updateStopMessage()
	setStopMessage(string.format("Elapsed Time: %.3f s \nState: %s\nPrevious State: %s", 
								 begin_t:check(), States.current_state, States.previous_state))
end

-- Terminate
local function terminate(message)
	vibrate(0.5)
	updateStopMessage()
	scriptExit(message)
end

-- Generate Toast

last_toast = Timer()local function generate_toast()
	updateStopMessage()
	if Configs.ToastEnable and last_toast:check() > Configs.ToastCooldownSeconds then
		toast(string.format("%.3f s @ %s", begin_t:check(), States.current_state))
		last_toast:set()
	end
end

-- Infinite State Check Preventer

m.updateStopMessage = updateStopMessage
m.terminate = terminate
m.generate_toast = generate_toast

return m