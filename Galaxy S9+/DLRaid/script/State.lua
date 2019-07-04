local m = {}

-- Definitions

m.UNKNOWN = "Unknown"
m.DIFFICULTY = "Difficulty"
m.ROOM_SELECT = "RoomSelect"
m.INSUFFICIENT_WINGS = "WingsInsuf"
m.FINDING_ROOM = "FindRoom"
m.READY = "Ready"
m.READY_SCREEN = "CommonScreen"
m.LOADING = "loading"
m.BATTLE_START = "BattleStart"
m.IN_BATTLE = "Battle"
m.END = "End"

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