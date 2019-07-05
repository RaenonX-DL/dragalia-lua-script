local m = {}

-- Definitions

m.UNKNOWN = "Unknown"
m.READY = "Ready"
m.IN_BATTLE = "Battle"
m.END = "End"
m.READY_SCREEN = "CommonScreen"

------------------------------------

m.current_state = m.UNKNOWN
m.previous_state = m.UNKNOWN

local function update_state(new_state)
	if m.current_state ~= new_state then
		m.previous_state = m.current_state
		m.current_state = new_state
	end
end

m.update_state = update_state

return m