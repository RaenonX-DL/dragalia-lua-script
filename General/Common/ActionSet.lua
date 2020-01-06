local m = {}

-- Click Common

last_click = Timer()
last_click_battle = Timer()
local function click_common()
    if States.current_state == States.IN_BATTLE then
        if last_click_battle:check() > Configs.ClickCooldownSecondsBattle then
            click(Coordinates.LocationCommonClickBattle)
            last_click_battle = Timer()
        end
        last_click = Timer()
    else
        if last_click:check() > Configs.ClickCooldownSeconds then
            click(Coordinates.LocationCommonClick)
            last_click = Timer()
        end
        last_click_battle = Timer()
    end
end

local function click_common3()
    for i = 1, 3 do
        ActionSet.click_common()
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
m.click_common3 = click_common3
m.use_skills = use_skills
m.clicks_postgame_dialogs = clicks_postgame_dialogs