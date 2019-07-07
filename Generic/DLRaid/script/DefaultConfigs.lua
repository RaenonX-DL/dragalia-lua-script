local m = {}

-- Main

m.LogDebug = false
m.DimensionWidth = 1440

-- Script Executions

m.ClickCooldownSeconds = 0.1
m.ScriptDefaultExistWaitMs = 0.05

-- Action Specific Configurations

m.DifficultyChecks = 3
m.DifficultyCheckWaitSeconds = 0.7
m.ReadyValidityPeriodSeconds = 5
m.HostLeftWaitSeconds = 5
m.MaxLoadingStuckSeconds = 30
m.SkillIntervalSecond = 1.5
m.PostgameClickCheckWaitSeconds = 0.7

m.MaxStateChecksOnUnknown = 60

-- Toast

m.ToastCooldownSeconds = 10
m.ToastEnable = true

return m