-- Inherit General Common/ActionSet.lua

-- Click on Insufficient Wings

local function clicks_insufficient_wings()
	click(Coordinates.LocationDiamantiumsRecover)
	wait(Configs.ClickCooldownSeconds)
	click(Coordinates.LocationRecoverButtonAndClose)
	wait(Configs.ClickCooldownSeconds)
end

-- Handle Connection Errors

local function handle_connection_errors(in_between_action)
	in_between_action()

	if CheckBase.check_set_state_true_actions(Coordinates.RegionServerError, Coordinates.PathCloseTxt, States.current_state, function()
		click(Coordinates.LocationServerErrorClose)
	end) then
		return true
	end

	in_between_action()

	if CheckBase.check_set_state_true_actions(Coordinates.RegionServerErrorRetry, Coordinates.PathRetryTxt, States.current_state, function()
		click(Coordinates.LocationServerErrorRetry)
	end) then
		return true
	end

	in_between_action()

	return false
end

m.clicks_insufficient_wings = clicks_insufficient_wings
m.handle_connection_errors = handle_connection_errors