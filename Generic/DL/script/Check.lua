ActionSet = dofile(scriptPath() .. "script/ActionSet.lua")
CheckBase = dofile(scriptPath() .. "script/CheckBase.lua")
Configs = dofile(scriptPath() .. "script/Configs.lua")
Customize = dofile(scriptPath() .. "script/Customize.lua")
States = dofile(scriptPath() .. "script/State.lua")

local m = {}

local function check_in_room()
	return CheckBase.check_set_state_true_actions(Customize.RegionReadyText, Customize.PathReadyText, States.READY, function()
		States.update_state(States.READY)
		click(Customize.LocationReady)
	end)
end

local function check_host_left()
	return CheckBase.check_set_state_true_actions(
		Customize.RegionHostText, 
		Customize.PathHostTxt, 
		States.COMMON_SCREEN,
		function() click(Customize.LocationCloseMiddleDialog) end
	)
end

local function check_in_battle()
	return CheckBase.check_set_state_true_actions(Customize.RegionMenu, Customize.PathMenu, States.IN_BATTLE, ActionSet.use_skills)
end

local function check_end_game()
	return CheckBase.check_set_state(Customize.RegionEndGameCheckItem, Customize.PathEndGameCheckItem, States.END)
end

local function check_post_game()
	return CheckBase.check_set_state(Customize.RegionCommonScreenCheckItem, Customize.PathCommonScreenCheckItem, States.COMMON_SCREEN)
end

local function check_current_state(in_between_action)
	in_between_action()
	if check_in_room() then return end
		
	in_between_action()
	if check_in_battle() then return end
		
	States.update_state(States.UNKNOWN)
end

m.check_in_room = check_in_room
m.check_in_battle = check_in_battle
m.check_end_game = check_end_game
m.check_post_game = check_post_game
m.check_host_left = check_host_left
m.check_current_state = check_current_state
	
return m