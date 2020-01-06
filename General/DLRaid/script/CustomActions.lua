local m = {}

local function battle_begin_actions()
    --	for i = 1, Coordinates.RepeatCountBattle do
    --		swipe(Coordinates.LocationBattle1, Coordinates.LocationBattle2)
    --		wait(0.5)
    --	end
    --	swipe(Coordinates.LocationBattle2, Coordinates.LocationBattle1)
end

local function click_quest_banner()
    setDragDropTiming(50, 50)
    setDragDropStepCount(80)
    setDragDropStepInterval(10)
    wait(1)

    match_result = Coordinates.RegionBanner:exists(Coordinates.PathBanner, 0.5)
    if match_result and match_result:getScore() > 0.9 then
        click(match_result:getTarget())
        return true
    end

    dragDrop(Coordinates.LocationQuestSwipe1, Coordinates.LocationQuestSwipe2)
    return false
end

m.battle_begin_actions = battle_begin_actions
m.click_quest_banner = click_quest_banner