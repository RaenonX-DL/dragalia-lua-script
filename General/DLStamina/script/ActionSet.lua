-- Inherit General Common/ActionSet+Advanced.lua

-- Click on Insufficient Stamina

local function clicks_insufficient_stamina()
    click(Coordinates.LocationDiamantiumsRecover)
    wait(Configs.ClickCooldownSeconds)
    click(Coordinates.LocationRecoverButtonAndClose)
    wait(Configs.ClickCooldownSeconds)
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
m.fill_stamina = fill_stamina