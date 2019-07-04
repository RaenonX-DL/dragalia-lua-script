States = dofile(scriptPath() .. "script/State.lua")
Configs = dofile(scriptPath() .. "script/Configs.lua")
Counter = dofile(scriptPath() .. "script/RunsCounter.lua")

local m = {}

begin_t = Timer()

-- Update Stop Message
local function updateStopMessage()
	setStopMessage(string.format("Elapsed Time: %.3f s (%d runs)\nState: %s\nPrevious State: %s", 
								 begin_t:check(), Counter.counter_runs, States.current_state, States.previous_state))
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

unknown_state_count = 0
local function count_analyze_state()
	if States.current_state == UNKNOWN then
		unknown_state_count = unknown_state_count + 1
		
		if unknown_state_count >= Configs.MaxStateChecksOnUnknown then
			terminate(string.format("State determination failed. (%s)", States.current_state))
		end
	else
		unknown_state_count = 0
	end
end

m.updateStopMessage = updateStopMessage
m.terminate = terminate
m.generate_toast = generate_toast
m.count_analyze_state = count_analyze_state

return m