-- Inherit General Common/ActionSet+Advanced.lua

-- Click on Insufficient Stamina

local function clicks_insufficient_stamina()
    click(Coordinates.LocationDiamantiumsRecover)
    wait(Configs.ClickCooldownSeconds)
    click(Coordinates.LocationRecoverButtonAndClose)
    wait(Configs.ClickCooldownSeconds)
end

local function clicks_postgame_dialogs()
    click(Coordinates.LocationContinue)
    wait(Configs.ClickCooldownSeconds)
    click(Coordinates.LocationCloseMiddleDialog)
    wait(Configs.ClickCooldownSeconds)
end

local function clicks_re_dialogs()
    click(Coordinates.LocationContinue)
    wait(Configs.ClickReCooldownSeconds)
    click(Coordinates.LocationRe)
    wait(Configs.ClickReCooldownSeconds)
    click(Coordinates.LocationConfirmContinue)
    wait(Configs.ClickReCooldownSeconds)
end

local function fill_stamina()
    for _ = 1, Configs.FillStaminaTaps do
        click(Coordinates.LocationFillStamina)
        wait(Configs.FillStaminaWaitSeconds)
    end
    click(Coordinates.LocationUseHoney)
    wait(Configs.FillStaminaWaitSeconds)
    click(Coordinates.LocationRecoverConfirm)
end

m.clicks_insufficient_stamina = clicks_insufficient_stamina
m.clicks_postgame_dialogs = clicks_postgame_dialogs
m.clicks_re_dialogs = clicks_re_dialogs
m.fill_stamina = fill_stamina