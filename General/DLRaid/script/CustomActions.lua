local m = {}

local function battle_begin_actions()
	for i = 1, Coordinates.RepeatCountBattle do
		swipe(Coordinates.LocationBattle1, Coordinates.LocationBattle2)
		wait(0.5)
	end
	swipe(Coordinates.LocationBattle2, Coordinates.LocationBattle1)
end

m.battle_begin_actions = battle_begin_actions