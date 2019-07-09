Logger = dofile(scriptPath() .. "script/Logger.lua")
Configs = dofile(scriptPath() .. "script/Configs.lua")

local m = {}

-- Definitions

m.UNKNOWN = "Unknown"
m.COMMON_SCREEN = "CommonScreen"
m.DIFFICULTY = "Difficulty"
m.ROOM_SELECT = "RoomSelect"
m.INSUFFICIENT_WINGS = "WingsInsuf"
m.FINDING_ROOM = "FindRoom"
m.READY = "Ready"
m.LOADING = "Loading"
m.BATTLE_START = "BattleStart"
m.IN_BATTLE = "Battle"
m.BATTLE_DEAD = "Dead"
m.END = "End"

------------------------------------

m.current_state = m.UNKNOWN
m.previous_state = m.UNKNOWN

local function update_state(new_state)
	if m.current_state ~= new_state then
		m.previous_state = m.current_state
		m.current_state = new_state

		if Configs.LogDebug then
			Logger.screenshot_message_file_suffix(
				string.format("State Changed from %s to %s", m.previous_state, m.current_state), m.current_state)
		end
	end
end

m.update_state = update_state

return m