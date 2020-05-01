-- Inherit Specific Common/Coordinates+Advanced.lua

m.LocationCommonClick = Location(1188, 1730)

m.LocationQuestSwipe1 = Location(720, 1600)
m.LocationQuestSwipe2 = Location(720, 1000)
m.RegionBanner = Region(0, 600, 1440, 1498)
m.PathBanner = PathParent .. "banner.png"

if Configs.DifficultyPosition == 1 then
    m.LocationDifficultyTop = Location(736, 1008)
elseif Configs.DifficultyPosition == 2 then
    m.LocationDifficultyTop = Location(715, 1496)
else
    scriptExit(string.format("Unknown `Configs.DifficultyPosition`: %d", Configs.DifficultyPosition))
end
m.PathDifficultyCheckItem = PathParent .. "diff.png"
m.RegionDifficultyCheckItem = Region(40, 600, 295, 60)

m.RegionRoomSelectCloseTxt = Region(620, 2130, 75, 80)

m.LocationRandomRoom = Location(1228, 1774)

m.RegionBuffCloseDialog = Region(619, 2121, 80, 71)
m.LocationBuffCloseDialog = Location(715, 2153)

m.LocationBattle1 = Location(720, 2450)
m.LocationBattle2 = Location(720, 1200)
m.RepeatCountBattle = 4