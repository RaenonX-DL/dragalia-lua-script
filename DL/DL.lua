PHONE_RESOLUTION = "WQHD" -- WQHD / FHD+

-- States
local UNKNOWN, READY, IN_BATTLE, END = "Unknown", "Ready", "Battle", "End"
current_state = UNKNOWN

begin_t = Timer()
last_skill = Timer()
last_click = Timer()
last_toast = Timer()
last_ready_check = nil

counter_ready = 0

exec = true

_PathParent = PHONE_RESOLUTION .. "/"

_PathMenu = _PathParent .. "menu.png"
_PathReadyText = _PathParent .. "ready.png"
_PathUnreadyText = _PathParent .. "unready.png"
_PathDragonGage = _PathParent .. "gage.png"
_PathEndGameCheckItem = _PathParent .. "next.png"

if PHONE_RESOLUTION == "FHD+" then
	_RegionMenu = Region(955, 125, 1065, 235)
	_RegionReadyText = Region(820, 1760, 901, 1806)
	_RegionGage = Region(20, 1620, 75, 1720)
	_RegionEndGameCheckItem = Region(830, 1940, 940, 2005)
	
	_SkillY = 1987
	_LocationSkill1 = Location(387, _SkillY)
	_LocationSkill2 = Location(600, _SkillY)
	_LocationSkill3 = Location(817, _SkillY)

	_LocationReady = Location(830, 1739)
	_LocationDragon = Location(158, 1640)
	_LocationCommonClick = Location(887, 1344)
elseif PHONE_RESOLUTION == "WQHD" then
	_RegionMenu = Region(1291, 114, 1393, 212)
	_RegionReadyText = Region(1089, 2422, 1200, 2496)
	_RegionGage = Region(36, 2220, 88, 2335)
	_RegionEndGameCheckItem = Region(1012, 2629, 1148, 2703)
	
	_SkillY = 2624
	_LocationSkill1 = Location(523, _SkillY)
	_LocationSkill2 = Location(795, _SkillY)
	_LocationSkill3 = Location(1084, _SkillY)

	_LocationReady = Location(1084, 2413)
	_LocationDragon = Location(202, 2229)
	_LocationCommonClick = Location(1199, 1801)
	_LocationCommonClickBattle = Location(714, 1491)
else
	scriptExit(string.format("Unknown Phone Resolution. Should be WQHD or FHD+. (%s)", PHONE_RESOLUTION))
end

_SkillIntervalSecond = 1.5

_ClickCooldownSeconds = 0.15
_ToastCooldownSeconds = 2
_ToastEnable = false
_MaxReadyCheckSeconds = 5

-- Functions
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

function check_in_battle()
	result = regionFindAllNoFindException(_RegionMenu, _PathMenu)
	for i, m in ipairs(result) do
		use_skills()
	
		current_state = IN_BATTLE
		return true
	end
	return false
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

-- NOT USING --
function check_dragon()
	result = regionFindAllNoFindException(_RegionGage, _PathDragonGage)
	for i, m in ipairs(result) do
		click(_LocationDragon)
		
		current_state = IN_BATTLE
		return true
	end
	return false
end

function check_end_game()
	result = regionFindAllNoFindException(_RegionEndGameCheckItem, _PathEndGameCheckItem)
	for i, m in ipairs(result) do
		current_state = END
		return true
	end
	return false
end

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
		check_in_battle()
	elseif current_state == IN_BATTLE then
		click_common()
		check_in_battle()
		click_common()
		
		click_common()
		check_end_game()
		click_common()
	elseif current_state == END then
		vibrate(0.5)
		setStopMessage(string.format("Elapsed Time: %.3f s", begin_t:check()))
		scriptExit("Script Auto End")
	else
		set_state()
	end
	
	generate_toast()
end