local m = {}

-- Click Common

last_click = Timer()
local function click_common()
	if last_click:check() > Configs.ClickCooldownSeconds then
		if States.current_state == States.IN_BATTLE then
			click(Coordinates.LocationCommonClickBattle)
		else
			click(Coordinates.LocationCommonClick)
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
		click(Coordinates.LocationDragon)
	
		click(Coordinates.LocationSkill1)
		click(Coordinates.LocationSkill2)
		click(Coordinates.LocationSkill3)
		
		last_skill:set()
	end
	
	click_common()
end

-- Click Postgame Dialogs

local function clicks_postgame_dialogs()
	click(Coordinates.LocationProceedNext)
	wait(Configs.ClickCooldownSeconds)
	click(Coordinates.LocationCloseMiddleDialog)
	wait(Configs.ClickCooldownSeconds)
	click(Coordinates.LocationNoContinue)
	wait(Configs.ClickCooldownSeconds)
end

m.click_common = click_common
m.use_skills = use_skills
m.clicks_postgame_dialogs = clicks_postgame_dialogs