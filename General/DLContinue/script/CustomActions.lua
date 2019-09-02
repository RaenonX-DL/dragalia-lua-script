local m = {}

local function battle_begin_actions()
    for i = 1, 10 do
        ActionSet.click_common()
        wait(0.1)
    end
end

m.battle_begin_actions = battle_begin_actions
