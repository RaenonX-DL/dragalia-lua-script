local m = {}

local function check_set_state_true_actions_wait_time(region, path, new_state, true_func, wait_time)
	region:highlight()
	found = region:exists(path, wait_time)
	
	if found then
		States.update_state(new_state)
		true_func()
	end
	region:highlight()
	
	return found
end

local function check_set_state_true_actions(region, path, new_state, true_func)
	return check_set_state_true_actions_wait_time(region, path, new_state, true_func, Configs.ScriptDefaultExistWaitMs)
end

local function check_set_state(region, path, new_state)
	return check_set_state_true_actions(region, path, new_state, function() end, Configs.ScriptDefaultExistWaitMs)
end

local function check_color(region, color_r, color_g, color_b)
	region:highlight()
	for x = region:getX(), region:getW() do
		for y = region:getY(), region:getH() do
			r, g, b = getColor(Location(x, y))
			
			if r ~= color_r or g ~= color_g or b ~= color_b then
				return false
			end
		end
	end
	region:highlight()
	
	return true
end

m.check_set_state_true_actions_wait_time = check_set_state_true_actions_wait_time
m.check_set_state = check_set_state
m.check_set_state_true_actions = check_set_state_true_actions
m.check_color = check_color