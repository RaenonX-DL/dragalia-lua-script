local m = {}

-- Definitions

m.UNKNOWN = "Unknown"
m.COMMON_SCREEN = "CommonScreen"
m.READY = "Ready"
m.IN_BATTLE = "Battle"
m.END = "End"
m.BATTLE_DEAD = "Dead"

------------------------------------

m.current_state = m.UNKNOWN
m.previous_state = m.UNKNOWN

local function update_state(new_state)
	if new_state == nil then
		scriptExit("Attempted to assign a `nil` state.\n" .. debug.traceback())
	end

	if m.current_state ~= new_state then
		m.previous_state = m.current_state
		m.current_state = new_state
	end

	if Configs.LogDebug then
		Logger.screenshot_message_file_suffix(
				string.format("State Changed from %s to %s", m.previous_state, m.current_state), m.current_state)
	end
end

m.update_state = update_state