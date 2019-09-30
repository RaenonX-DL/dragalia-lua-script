-- Inherit General Common/Check+Advanced.lua

local function check_difficulty_screen()
	return CheckBase.check_set_state(Coordinates.RegionDifficultyCheckItem, Coordinates.PathDifficultyCheckItem, States.DIFFICULTY)
end

local function check_room_select()
	return CheckBase.check_set_state(Coordinates.RegionRoomSelectCloseTxt, Coordinates.PathCloseTxt, States.ROOM_SELECT)
end

local function dismiss_end_battle_mid_dialog()
    return CheckBase.check_set_state_true_actions(Coordinates.RegionBuffCloseDialog, Coordinates.PathCloseTxt, States.current_state, function()
		click(Coordinates.LocationBuffCloseDialog)
	end)
end

local function check_current_state(in_between_action)
	in_between_action()
	if check_difficulty_screen() then return end
	-- Check difficulty at first so if the host left, click once can get a difficulty selection screen

	in_between_action()
	if check_post_game() then return end

	in_between_action()
	if check_in_room() then return end
		
	in_between_action()
	if check_battle_begin() then return end
		
	States.update_state(States.UNKNOWN)
end

m.check_difficulty_screen = check_difficulty_screen
m.check_room_select = check_room_select
m.check_current_state = check_current_state
m.dismiss_end_battle_mid_dialog = dismiss_end_battle_mid_dialog