local m = {}

-- Definitions

m.UNKNOWN = "Unknown"
m.READY = "Ready"
m.END = "End"
m.READY_SCREEN = "CommonScreen"
m.IN_BATTLE = "Battle"
m.BATTLE_START = "BattleStart"
m.LOADING = "loading"
m.ROOM_SELECT = "RoomSelect"
m.FINDING_ROOM = "FindRoom"
m.INSUFFICIENT_WINGS = "WingsInsuf"
m.DIFFICULTY = "Difficulty"

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