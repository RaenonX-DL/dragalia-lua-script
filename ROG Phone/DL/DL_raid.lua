local UNKNOWN, READY, IN_BATTLE, END, READY_SCREEN = "Unknown", "Ready", "Battle", "End", "CommonScreen"
local ROOM_SELECT, FINDING_ROOM, INSUFFICIENT_WINGS, DIFFICULTY = "RoomSelect", "FindRoom", "WingsInsuf", "Difficulty"

_PathParent = "/"

_PathMenu = _PathParent .. "menu.png"
_PathReadyText = _PathParent .. "ready.png"
_PathUnreadyText = _PathParent .. "unready.png"
_PathEndGameCheckItem = _PathParent .. "next.png"
_PathCommonScreenCheckItem = _PathParent .. "common.png"
_PathHostTxt = _PathParent .. "host.png"
_PathCloseTxt = _PathParent .. "close.png"
_PathRoomFindingTxt = _PathParent .. "finding.png"
_PathInsufficientTxt = _PathParent .. "insufficient.png"
_PathDifficultyCheckItem = _PathParent .. "diff.png"

_RegionMenu = Region(976, 104, 1042, 462)
_RegionReadyText = Region(822, 1758, 900, 1802)
_RegionHostText = Region(214, 1001, 338, 1042)
_RegionEndGameCheckItem = Region(765, 1911, 850, 1954)
_RegionCommonScreenCheckItem = Region(950, 126, 1014, 192)
_RegionRoomSelectCloseTxt = Region(470, 1572, 515, 1617)  
_RegionRoomFindingTxt = Region(540, 1062, 620, 1106)
_RegionInsufficientWings = Region(315, 1370, 400, 1414)
_RegionDifficultyCheckItem = Region(29, 423, 248, 470)

_SkillY = 1848
_LocationSkill1 = Location(384, _SkillY)
_LocationSkill2 = Location(603, _SkillY)
_LocationSkill3 = Location(816, _SkillY)

_LocationReady = Location(825, 1748)
_LocationDragon = Location(159, 1602)
_LocationCommonClick = Location(787, 1279)
_LocationCommonClickBattle = Location(200, 1380)
_LocationProceedNext = Location(812, 1932)
_LocationNoContinue = Location(301, 2094)
_LocationCloseMiddleDialog = Location(516, 1282)
_LocationQuestTop = Location(10, 1238)
_LocationDifficultyTop = Location(527, 779)
_LocationRandomRoom = Location(787, 1279)
_LocationDiamantiumsRecover = Location(541, 724)
_LocationRecoverButtonAndClose = Location(653, 1340)

_SkillIntervalSecond = 1.5

_ClickCooldownSeconds = 0.25
_ToastCooldownSeconds = 10
_ToastEnable = true
_MaxReadyCheckSeconds = 3
_MaxRepeatCheckCount = 3
_MaxUnknownStateCheckCount = 60

-- Variables for program
current_state = UNKNOWN
previous_state = UNKNOWN

begin_t = Timer()
last_skill = Timer()
last_click = Timer()
last_toast = Timer()
last_ready_check = nil

counter_repeat_check = 0
counter_in_battle = 0
unknown_state_count = 0

in_battle_recorded = false

file_stream = io.open(scriptPath().."log.txt", "a+")
file_stream:write("\n===============\n")
file_stream:write(os.date("Starts at %c\n"))

-- Checks
function _check_set_state_wait_time(_region, _path, _new_state, _wait_time)
	return _check_set_state_true_actions(_region, _path, _new_state, function() end, _wait_time)
end

function _check_set_state(_region, _path, _new_state)
	return _check_set_state_true_actions(_region, _path, _new_state, function() end, 0.1)
end

function _check_set_state_true_actions(_region, _path, _new_state, _true_func)
	return _check_set_state_true_actions_wait_time(_region, _path, _new_state, _true_func, 0.1)
end

function _check_set_state_true_actions_wait_time(_region, _path, _new_state, _true_func, _wait_time)
	found = _region:exists(_path, _wait_time)
	
	if found then
		update_state(_new_state)
		_true_func()
	end
	
	return found
end

function check_in_room()
	if last_ready_check ~= nil then
		result = regionFindAllNoFindException(_RegionReadyText, _PathUnreadyText)

		if _RegionReadyText:exists(_PathUnreadyText, 0.4) and last_ready_check:check() > _MaxReadyCheckSeconds then
			update_state(READY)
			last_ready_check = nil
			
			return true
		end
		
		last_ready_check = nil
	else
		_check_set_state_true_actions(_RegionReadyText, _PathReadyText, READY, function()
			update_state(READY)
			click(_LocationReady)
			
			last_ready_check = Timer()
		end)
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

function check_difficulty_screen()
	return _check_set_state(_RegionDifficultyCheckItem, _PathDifficultyCheckItem, DIFFICULTY)
end

function check_host_left()
	return _check_set_state_true_actions(_RegionHostText, _PathHostTxt, READY_SCREEN, function() click(_LocationCloseMiddleDialog) end)
end

function check_room_select()
	return _check_set_state(_RegionRoomSelectCloseTxt, _PathCloseTxt, ROOM_SELECT)
end

function check_room_finding()
	return _check_set_state(_RegionRoomFindingTxt, _PathRoomFindingTxt, FINDING_ROOM)
end

function check_insufficient_wings()
	return _check_set_state(_RegionInsufficientWings, _PathInsufficientTxt, INSUFFICIENT_WINGS)
end

-- Bundled Actions
function update_state(new_state)
	if current_state ~= new_state then
		previous_state = current_state
		current_state = new_state
	end
end

function analyze_current_state()
	click_common()
	if check_difficulty_screen() then return end
	-- Check difficulty at first so if the host left, click once can get a difficulty selection screen
	
	click_common()
	if check_in_room() then return end
		
	click_common()
	if check_in_battle() then return end
		
	current_state = UNKNOWN
end

function clicks_postgame_dialogs()
	click(_LocationProceedNext)
	wait(_ClickCooldownSeconds)
	click(_LocationCloseMiddleDialog)
	wait(_ClickCooldownSeconds)
	click(_LocationNoContinue)
	wait(_ClickCooldownSeconds)
end

function clicks_insufficient_wings()
	click(_LocationDiamantiumsRecover)
	wait(_ClickCooldownSeconds)
	click(_LocationRecoverButtonAndClose)
	wait(_ClickCooldownSeconds)
end

function terminate(message)
	vibrate(0.5)
	updateStopMessage()
	scriptExit(message)
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

function count_analyze_state()
	if current_state == UNKNOWN then
		unknown_state_count = unknown_state_count + 1
		
		if unknown_state_count >= _MaxUnknownStateCheckCount then
			terminate(string.format("State determination failed. (%s)", current_state))
		end
	else
		unknown_state_count = 0
	end
end

function updateStopMessage()
	setStopMessage(string.format("Elapsed Time: %.3f s (%d runs)\nState: %s\nPrevious State: %s", 
								begin_t:check(), counter_in_battle, current_state, previous_state))
end

function generate_toast()
	updateStopMessage()
	if _ToastEnable and last_toast:check() > _ToastCooldownSeconds then
		toast(string.format("%.3f s @ %s", begin_t:check(), current_state))
		last_toast:set()
	end
end

-- NOT USING --

function repeat_check(bool_check_func) 
	r = false
	for i = 1, _MaxRepeatCheckCount do
		if not r then
			r = bool_check_func()
		else
			return r
		end
	end
	return r
end

------- MAIN -------
while true do
	if current_state == READY then
		if check_host_left() then
			wait(5)
			update_state(UNKNOWN)
		end
		check_in_room() -- Prevent unready but set to ready
		check_in_battle()
	elseif current_state == IN_BATTLE then
		if not in_battle_recorded then 
			counter_in_battle = counter_in_battle + 1
			in_battle_recorded = true 
			file_stream:write(string.format("Battle #%d Started at %s\n", counter_in_battle, os.date("%c")))
		end
	
		click_common()
		check_in_battle()
		click_common()
		
		click_common()
		check_end_game()
		click_common()
	elseif current_state == END then
		in_battle_recorded = false
		clicks_postgame_dialogs()
		wait(1.5)
		check_post_game()
	elseif current_state == READY_SCREEN then
		click(_LocationQuestTop)
		wait(0.7)
		check_difficulty_screen()
		wait(0.7)
		check_difficulty_screen()
	elseif current_state == DIFFICULTY then
		click(_LocationDifficultyTop)
		check_room_select()
	elseif current_state == ROOM_SELECT then
		click(_LocationRandomRoom)
		check_room_finding()
		check_in_room()
		check_insufficient_wings()
	elseif current_state == FINDING_ROOM then
		check_in_room()
		click(_LocationRandomRoom)
	elseif current_state == INSUFFICIENT_WINGS then
		clicks_insufficient_wings()
		check_room_finding()
	else
		analyze_current_state()
		count_analyze_state()
	end
	
	generate_toast()
end