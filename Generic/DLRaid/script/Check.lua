ActionSet = dofile(scriptPath() .. "script/ActionSet.lua")
CheckBase = dofile(scriptPath() .. "script/CheckBase.lua")
Configs = dofile(scriptPath() .. "script/Configs.lua")
Customize = dofile(scriptPath() .. "script/Customize.lua")
States = dofile(scriptPath() .. "script/State.lua")

local m = {}

local function check_difficulty_screen()
	return CheckBase.check_set_state(Customize.RegionDifficultyCheckItem, Customize.PathDifficultyCheckItem, States.DIFFICULTY)
end

local function check_room_select()
	return CheckBase.check_set_state(Customize.RegionRoomSelectCloseTxt, Customize.PathCloseTxt, States.ROOM_SELECT)
end

local function check_room_finding()
	return CheckBase.check_set_state(Customize.RegionRoomFindingTxt, Customize.PathRoomFindingTxt, States.FINDING_ROOM)
end
local function check_in_room()
	return CheckBase.check_set_state_true_actions(Customize.RegionReadyText, Customize.PathReadyText, States.READY, function()
		States.update_state(States.READY)
		click(Customize.LocationReady)
	end)
end

local function check_loading()
	return CheckBase.check_set_state(Customize.RegionLoading, Customize.PathLoading, States.LOADING)
end
local function check_battle_begin()
	return CheckBase.check_set_state(Customize.RegionMenu, Customize.PathMenu, States.BATTLE_START)
end
local function check_in_battle()
	return CheckBase.check_set_state_true_actions(Customize.RegionMenu, Customize.PathMenu, States.IN_BATTLE, ActionSet.use_skills)
end
local function check_end_game()
	return CheckBase.check_set_state(Customize.RegionEndGameCheckItem, Customize.PathEndGameCheckItem, States.END)
end
local function check_post_game()
	return CheckBase.check_set_state(Customize.RegionCommonScreenCheckItem, Customize.PathCommonScreenCheckItem, States.READY_SCREEN)
end



local function check_insufficient_wings()
	return CheckBase.check_set_state(Customize.RegionInsufficientWings, Customize.PathInsufficientTxt, States.INSUFFICIENT_WINGS)
end

local function check_host_left()
	return CheckBase.check_set_state_true_actions(
		Customize.RegionHostText, 
		Customize.PathHostTxt, 
		States.READY_SCREEN, 
		function() click(Customize.LocationCloseMiddleDialog) end
	)
end
local function check_dead()
	return CheckBase.check_set_state(Customize.RegionContinueTxt, Customize.PathContinueTxt, States.current_state)
end



local function check_current_state(in_between_action)
	in_between_action()
	if check_difficulty_screen() then return end
	-- Check difficulty at first so if the host left, click once can get a difficulty selection screen
	
	in_between_action()
	if check_in_room() then return end
		
	in_between_action()
	if check_battle_begin() then return end
		
	States.update_state(States.UNKNOWN)
end

m.check_in_room = check_in_room
m.check_battle_begin = check_battle_begin
m.check_in_battle = check_in_battle
m.check_end_game = check_end_game
m.check_post_game = check_post_game
m.check_difficulty_screen = check_difficulty_screen
m.check_host_left = check_host_left
m.check_room_select = check_room_select
m.check_room_finding = check_room_finding
m.check_dead = check_dead
m.check_loading = check_loading
m.check_insufficient_wings = check_insufficient_wings
m.check_current_state = check_current_state
	
return m