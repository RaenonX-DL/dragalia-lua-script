Configs = dofile(scriptPath() .. "script/Configs.lua")
Customize = dofile(scriptPath() .. "script/Customize.lua")
CheckBase = dofile(scriptPath() .. "script/CheckBase.lua")
States = dofile(scriptPath() .. "script/State.lua")
System = dofile(scriptPath() .. "script/System.lua")

local m = {}

-- Click Common

last_click = Timer()
local function click_common()
	if last_click:check() > Configs.ClickCooldownSeconds then
		if States.current_state == States.IN_BATTLE then
			click(Customize.LocationCommonClickBattle)
		else
			click(Customize.LocationCommonClick)
		end
		last_click:set()
		System.generate_toast()
	else
		wait(Configs.ClickCooldownSeconds - last_click:check())
		click_common()
	end
end

-- Use Skills

last_skill = Timer()
local function use_skills()
	click_common()

	if last_skill:check() > Configs.SkillIntervalSecond then
		click(Customize.LocationDragon)
	
		click(Customize.LocationSkill1)
		click(Customize.LocationSkill2)
		click(Customize.LocationSkill3)
		
		last_skill:set()
	end
	
	click_common()
end

-- Click Postgame Dialogs

local function clicks_postgame_dialogs()
	doubleClick(Customize.LocationProceedNext)
	wait(Configs.ClickCooldownSeconds)
	doubleClick(Customize.LocationCloseMiddleDialog)
	wait(Configs.ClickCooldownSeconds)
	doubleClick(Customize.LocationNoContinue)
	wait(Configs.ClickCooldownSeconds)
end

m.click_common = click_common
m.use_skills = use_skills
m.clicks_postgame_dialogs = clicks_postgame_dialogs

return m