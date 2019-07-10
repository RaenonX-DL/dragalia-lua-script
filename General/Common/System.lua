local m = {}

begin_t = Timer()

-- Update Stop Message

local function update_stop_message()
	setStopMessage(string.format("Elapsed Time: %.3f s \nState: %s\nPrevious State: %s", 
								 begin_t:check(), States.current_state, States.previous_state))
end

-- Terminate

local function terminate(message)
	vibrate(0.5)
	update_stop_message()
	scriptExit(message)
end

-- Generate Toast

last_toast = Timer()
local function generate_toast()
	update_stop_message()
	if Configs.ToastEnable and last_toast:check() > Configs.ToastCooldownSeconds then
		toast(string.format("%.3f s @ %s", begin_t:check(), States.current_state))
		last_toast:set()
	end
end

m.update_stop_message = update_stop_message
m.terminate = terminate
m.generate_toast = generate_toast