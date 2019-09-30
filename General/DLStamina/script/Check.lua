-- Inherit General Common/Check+Advanced.lua

local function check_re()
	return CheckBase.check_set_state(Coordinates.RegionReCheck, Coordinates.PathReCheck, States.RE)
end

local function check_insufficient_stamina()
	return CheckBase.check_set_state(Coordinates.RegionInsufficientStamina, Coordinates.PathInsufficientTxt, States.INSUFFICIENT_STAMINA)
end

local function check_fill_stamina()
	return CheckBase.check_set_state(Coordinates.RegionFillStamina, Coordinates.PathInsufficientTxt, States.FILL_STAMINA)
end

local function dismiss_end_battle_mid_dialog()
    return CheckBase.check_set_state_true_actions(Coordinates.RegionBuffCloseDialog, Coordinates.PathCloseTxt, States.current_state, function()
		click(Coordinates.LocationBuffCloseDialog)
	end)
end

local function check_current_state(in_between_action)
	in_between_action()
	if check_in_battle() then return end

	in_between_action()
	if check_end_game() then return end
		
	States.update_state(States.UNKNOWN)
end

m.check_re = check_re
m.check_insufficient_stamina = check_insufficient_stamina
m.check_fill_stamina = check_fill_stamina
m.check_current_state = check_current_state
m.dismiss_end_battle_mid_dialog = dismiss_end_battle_mid_dialog