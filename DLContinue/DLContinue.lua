-- States
local UNKNOWN, READY, IN_BATTLE, END, READY_SCREEN = "Unknown", "Ready", "Battle", "End", "CommonScreen"
local RANDOM_ROOM, FINDING_ROOM, INSUFFICIENT_WINGS, FRIEND_SELECT = "RandRoom", "FindRoom", "WingsInsuf", "FriendSel"

_PathParent = "/"

_PathMenu = _PathParent .. "menu.png"
_PathReadyText = _PathParent .. "ready.png"
_PathUnreadyText = _PathParent .. "unready.png"
_PathEndGameCheckItem = _PathParent .. "next.png"
_PathCommonScreenCheckItem = _PathParent .. "common.png"
_PathHostTxt = _PathParent .. "host.png"
_PathRoomFindingTxt = _PathParent .. "finding.png"
_PathInsufficientTxt = _PathParent .. "insufficient.png"
_PathFriendSelectItem = _PathParent .. "friend.png"
_PathToRandomRoomItem = _PathParent .. "randroom.png"

_RegionMenu = Region(1291, 114, 1393, 212)
_RegionReadyText = Region(1089, 2422, 1200, 2496)
_RegionHostText = Region(275, 1365, 460, 1435)
_RegionEndGameCheckItem = Region(1012, 2629, 1148, 2703)
_RegionCommonScreenCheckItem = Region(205, 125, 270, 170)
_RegionRoomFindingTxt = Region(710, 1450, 835, 1520)
_RegionInsufficientWings = Region(410, 1850, 550, 1940)
_RegionFriendSelectItem = Region(285, 845, 400, 920)
_RegionToRandomRoom = Region(545, 1710, 895, 1940)

_SkillY = 2624
_LocationSkill1 = Location(523, _SkillY)
_LocationSkill2 = Location(795, _SkillY)
_LocationSkill3 = Location(1084, _SkillY)

_LocationReady = Location(1084, 2413)
_LocationDragon = Location(202, 2229)
_LocationCommonClick = Location(1188, 1730)
_LocationCommonClickBattle = Location(714, 1491)
_LocationProceedNext = Location(1097, 2665)
_LocationNoContinue = Location(1114, 2880)
_LocationCloseMiddleDialog = Location(720, 1813)
_LocationQuestTop = Location(137, 1025)
_LocationRandomRoom = Location(178, 1903)
_LocationMultiPlay = Location(1021, 874)
_LocationDiamantiumsRecover = Location(720, 995)
_LocationRecoverButtonAndClose = Location(816, 1851)
_LocationRaidQuestsButton = Location(1114, 1954)

_SkillIntervalSecond = 1.5

_ClickCooldownSeconds = 0.1
_ToastCooldownSeconds = 15
_ToastEnable = true
_MaxReadyCheckSeconds = 5
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

-- Static functions
function _check_set_state(_region, _path, _new_state)
	_check_set_state_true_actions(_region, _path, _new_state, function() end)
end

function _check_set_state_true_actions(_region, _path, _new_state, _true_func)
	result = regionFindAllNoFindException(_region, _path)
	for i, m in ipairs(result) do
		update_state(_new_state)
		_true_func()
		return true
	end
	return false
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

function click3(location, wait_sec)
	for i = 1, 3 do
		click(location)
		wait(wait_sec)
	end
end

-- Checks

function check_in_room()
	if last_ready_check ~= nil then
		result = regionFindAllNoFindException(_RegionReadyText, _PathUnreadyText)
		for i, m in ipairs(result) do
			if last_ready_check:check() > _MaxReadyCheckSeconds then
				update_state(READY)
				last_ready_check = nil
			end
			
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

function check_host_left_series()
	host_left = false
	for i = 1, 3 do 
		if check_host_left() then
			host_left = true
			break
		end
	end
	
	if host_left then
		wait(5)
		update_state(END)
	end
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

function check_friend_select_screen()
	return _check_set_state(_RegionFriendSelectItem, _PathFriendSelectItem, FRIEND_SELECT)
end

function check_host_left()
	return _check_set_state_true_actions(_RegionHostText, _PathHostTxt, READY_SCREEN, function() click(_LocationCloseMiddleDialog) end)
end

function check_random_room()
	return _check_set_state(_RegionToRandomRoom, _PathToRandomRoomItem, RANDOM_ROOM)
end

function check_room_finding()
	return _check_set_state(_RegionRoomFindingTxt, _PathRoomFindingTxt, FINDING_ROOM)
end

function check_insufficient_wings()
	return _check_set_state(_RegionInsufficientWings, _PathInsufficientTxt, INSUFFICIENT_WINGS)
end

-- Bundled Actions
function update_state(new_state)
	if current_state == nil then
		terminate("Attempted to assign a `nil` state.")
	end

	if current_state ~= new_state then
		previous_state = current_state
		current_state = new_state
	end
end

function analyze_current_state()
	click_common()
	if check_in_room() then return end
		
	click_common()
	if check_in_battle() then return end
		
	click_common()
	if check_post_game() then return end
		
	current_state = UNKNOWN
end

------- MAIN -------
while true do
	if current_state == READY then
		check_host_left_series()
		check_in_room() -- Prevent unready but set to ready
		check_in_battle()
	elseif current_state == IN_BATTLE then
		if not in_battle_recorded then 
			counter_in_battle = counter_in_battle + 1
			in_battle_recorded = true 
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
		wait(0.7)
		check_post_game()
	elseif current_state == READY_SCREEN then
		click3(_LocationQuestTop, 0.5)
		for i = 1, 2 do 
			wait(0.7)
			check_friend_select_screen()
		end
	elseif current_state == FRIEND_SELECT then
		click3(_LocationMultiPlay, 0.5)
		check_random_room()
	elseif current_state == RANDOM_ROOM then
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