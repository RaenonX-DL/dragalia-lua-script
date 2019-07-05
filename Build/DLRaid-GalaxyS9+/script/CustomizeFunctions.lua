Customize = dofile(scriptPath() .. "script/Customize.lua")

local m = {}
local function battle_begin_actions()
	for i = 1, Customize.RepeatCountBattle do
		swipe(Customize.LocationBattle1, Customize.LocationBattle2)
		wait(0.5)
	end
	swipe(Customize.LocationBattle2, Customize.LocationBattle1)
end

m.battle_begin_actions = battle_begin_actions

return m