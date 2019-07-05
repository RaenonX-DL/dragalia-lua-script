-- States
Settings:setCompareDimension(true, 1440)
Settings:setScriptDimension(true, 1440)

local UNKNOWN, READY, IN_BATTLE, END, READY_SCREEN = "Unknown", "Ready", "Battle", "End", "rdyscr"
current_state = UNKNOWN

begin_t = Timer()
last_skill = Timer()
last_click = Timer()
last_toast = Timer()
last_ready_check = nil

counter_ready = 0

exec = true

_PathParent = "/"

_PathMenu = _PathParent .. "menu.png"
_PathReadyText = _PathParent .. "ready.png"
_PathUnreadyText = _PathParent .. "unready.png"
_PathEndGameCheckItem = _PathParent .. "next.png"
_PathCommonScreenCheckItem = _PathParent .. "common.png"
_PathHostTxt = _PathParent .. "host.png"

_RegionMenu = Region(1291, 114, 1393, 212)
_RegionReadyText = Region(1089, 2422, 1200, 2496)
_RegionHostText = Region(275, 1365, 460, 1435)
_RegionEndGameCheckItem = Region(1012, 2629, 1148, 2703)
_RegionCommonScreenCheckItem = Region(205, 125, 270, 170)

_SkillY = 2624
_LocationSkill1 = Location(523, _SkillY)
_LocationSkill2 = Location(795, _SkillY)
_LocationSkill3 = Location(1084, _SkillY)

_LocationReady = Location(1084, 2413)
_LocationDragon = Location(202, 2229)
_LocationCommonClick = Location(1199, 1801)
_LocationCommonClickBattle = Location(714, 1742)
_LocationProceedNext = Location(1097, 2665)
_LocationNoContinue = Location(638, 2288)
_LocationCloseMiddleDialog = Location(720, 1813)

_SkillIntervalSecond = 1.5

_ClickCooldownSeconds = 0.15
_ToastCooldownSeconds = 2
_ToastEnable = false
_MaxReadyCheckSeconds = 20

-- Checks

function _check_set_state(_region, _path, _new_state)
	_check_set_state_true_actions(_region, _path, _new_state, function() end)
end

function _check_set_state_true_actions(_region, _path, _new_state, _true_func)
	result = regionFindAllNoFindException(_region, _path)
	for i, m in ipairs(result) do
		current_state = _new_state
		_true_func()
		return true
	end
	return false
end

function check_in_room()
	if last_ready_check ~= nil then
		result = regionFindAllNoFindException(_RegionReadyText, _PathUnreadyText)
		for i, m in ipairs(result) do
			if last_ready_check:check() > _MaxReadyCheckSeconds then
				current_state = READY
				last_ready_check = nil
			end
			
			return true
		end
		
		last_ready_check = nil
	else
		result = regionFindAllNoFindException(_RegionReadyText, _PathReadyText)
		for i, m in ipairs(result) do
			click(_LocationReady)
			
			last_ready_check = Timer()
			break
		end
	end
	return false
end

function check_in_battle()
	return _check_set_state_true_actions(_RegionMenu, _PathMenu, IN_BATTLE, use_skills)
end

function check_end_game()
	return _check_set_state(_RegionEndGameCheckItem, _PathEndGameCheckItem, END)
end

function check_post_game()
	return _check_set_state(_RegionCommonScreenCheckItem, _PathCommonScreenCheckItem, READY_SCREEN)
end

function check_host_left()
	return _check_set_state_true_actions(_RegionHostText, _PathHostTxt, READY_SCREEN, function() click(_LocationCloseMiddleDialog) end)
end

-- Bundled Actions

function set_state()
	click_common()
	if check_in_room() then
		current_state = READY
		return
	end
		
	click_common()
	if check_in_battle() then
		current_state = IN_BATTLE
		return
	end
		
	click_common()
	current_state = UNKNOWN
end

function battle_end_click_dialogs()
	click(_LocationProceedNext)
	wait(_ClickCooldownSeconds)
	click(_LocationCloseMiddleDialog)
	wait(_ClickCooldownSeconds)
	click(_LocationNoContinue)
	wait(_ClickCooldownSeconds)
end

function terminate()
	vibrate(0.5)
	setStopMessage(string.format("Elapsed Time: %.3f s", begin_t:check()))
	scriptExit("Script Execution Completed.")
end

function use_skills()
	click_common()

	if last_skill:check() > _SkillIntervalSecond then
		click(_LocationDragon)
	
		click(_LocationSkill1)
		click(_LocationSkill2)
		click(_LocationSkill3)
		
		last_skill:set()
	end
	
	click_common()
end

function click_common()
	if last_click:check() > _ClickCooldownSeconds then
		if current_state == IN_BATTLE then
			click(_LocationCommonClickBattle)
		else
			click(_LocationCommonClick)
		end
		last_click:set()
		generate_toast()
	else
		wait(_ClickCooldownSeconds - last_click:check())
		click_common()
	end
end

-- NOT USING --
	
function generate_toast()
	setStopMessage(string.format("Elapsed Time: %.3f s", begin_t:check()))
	if _ToastEnable and last_toast:check() > _ToastCooldownSeconds then
		toast(string.format("%.3f s @ %s", begin_t:check(), current_state))
		last_toast:set()
	end
end

------- MAIN -------

while true do
	if current_state == READY then
		check_host_left()
		check_in_battle()
	elseif current_state == IN_BATTLE then
		click_common()
		check_in_battle()
		click_common()
		
		click_common()
		check_end_game()
		click_common()
	elseif current_state == END then
		battle_end_click_dialogs()
		check_post_game()
	elseif current_state == READY_SCREEN then
		terminate()
	else
		set_state()
	end
	
	generate_toast()
end