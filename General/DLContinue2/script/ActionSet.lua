-- Inherit General Common/ActionSet+Advanced.lua

local function clicks_postgame_dialogs()
	click(Coordinates.LocationProceedNext)
	wait(Configs.ClickCooldownSeconds)
	click(Coordinates.LocationCloseMiddleDialog)
	wait(Configs.ClickCooldownSeconds)
	click(Coordinates.LocationContinue)
	wait(Configs.ClickCooldownSeconds)
end

m.clicks_postgame_dialogs = clicks_postgame_dialogs