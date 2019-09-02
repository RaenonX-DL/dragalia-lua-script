-- Inherit General Common/Check.lua

local function check_room_finding()
	return CheckBase.check_set_state(Coordinates.RegionRoomFindingTxt, Coordinates.PathRoomFindingTxt, States.FINDING_ROOM)
end

local function check_battle_begin()
	return CheckBase.check_set_state(Coordinates.RegionMenu, Coordinates.PathMenu, States.BATTLE_START)
end

local function check_insufficient_wings()
	return CheckBase.check_set_state(Coordinates.RegionInsufficientWings, Coordinates.PathInsufficientTxt, States.INSUFFICIENT_WINGS)
end

local function check_loading()
	return CheckBase.check_set_state(Coordinates.RegionLoading, Coordinates.PathLoading, States.LOADING)
end


local function check_current_state(in_between_action)
	in_between_action()
	if check_in_room() then return end
		
	in_between_action()
	if check_battle_begin() then return end

	in_between_action()
	if check_insufficient_wings() then return end

	in_between_action()
	if check_post_game() then return end
		
	States.update_state(States.UNKNOWN)
end

m.check_battle_begin = check_battle_begin
m.check_room_finding = check_room_finding
m.check_insufficient_wings = check_insufficient_wings
m.check_loading = check_loading
m.check_current_state = check_current_state