local m = {}

local function check_host_left()
	return CheckBase.check_set_state_true_actions(
		Coordinates.RegionHostText,
		Coordinates.PathHostTxt,
		States.COMMON_SCREEN,
		function() click(Coordinates.LocationCloseMiddleDialog) end
	)
end

ready_validity_counter = nil -- Give the "ready" result only a period of validity
local function check_in_room()
	if ready_validity_counter ~= nil and ready_validity_counter:check() > Configs.ReadyValidityPeriodSeconds then
		ready_validity_counter = nil
	end

	if ready_validity_counter == nil then
		found = CheckBase.check_set_state(Coordinates.RegionReadyText, Coordinates.PathReadyText, States.READY)

		if found then
			click(Coordinates.LocationReady)
			States.update_state(States.READY)
			ready_validity_counter = Timer()
		end
	end
	check_host_left()
end

local function check_in_battle()
	return CheckBase.check_set_state_true_actions(Coordinates.RegionMenu, Coordinates.PathMenu, States.IN_BATTLE, ActionSet.use_skills)
end

local function check_end_game()
	return CheckBase.check_set_state(Coordinates.RegionEndGameCheckItem, Coordinates.PathEndGameCheckItem, States.END)
end

local function check_post_game()
	return CheckBase.check_set_state(Coordinates.RegionCommonScreenCheckItem, Coordinates.PathCommonScreenCheckItem, States.COMMON_SCREEN)
end

local function check_dead()
	return CheckBase.check_set_state(Coordinates.RegionContinueTxt, Coordinates.PathContinueTxt, States.BATTLE_DEAD)
end

local function check_current_state(in_between_action)
	in_between_action()
	if check_in_room() then return end
		
	in_between_action()
	if check_in_battle() then return end
		
	States.update_state(States.UNKNOWN)
end

m.check_in_room = check_in_room
m.check_host_left = check_host_left
m.check_dead = check_dead
m.check_in_battle = check_in_battle
m.check_end_game = check_end_game
m.check_post_game = check_post_game
m.check_current_state = check_current_state