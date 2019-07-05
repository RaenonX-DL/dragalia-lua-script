local m = {}

PathParent = "/"

m.LocationCommonClick = Location(1188, 1730)

m.PathMenu = PathParent .. "menu.png"
m.RegionMenu = Region(1291, 114, 102, 98)

m.PathReadyText = PathParent .. "ready.png"
m.RegionReadyText = Region(1089, 2422, 111, 74)
m.LocationReady = Location(1084, 2413)

m.PathEndGameCheckItem = PathParent .. "next.png"
m.RegionEndGameCheckItem = Region(1012, 2629, 136, 74)
m.LocationProceedNext = Location(1097, 2665)
m.LocationNoContinue = Location(1114, 2880)
m.LocationCloseMiddleDialog = Location(720, 1813)

m.PathCommonScreenCheckItem = PathParent .. "common.png"
m.RegionCommonScreenCheckItem = Region(205, 125, 65, 45)

m.LocationQuestTop = Location(1361, 1607)
m.PathCloseTxt = PathParent .. "close.png"
m.RegionRoomSelectCloseTxt = Region(630, 2140, 55, 60)

m.LocationRandomRoom = Location(1228, 1774)
m.PathRoomFindingTxt = PathParent .. "finding.png"
m.RegionRoomFindingTxt = Region(715, 1460, 115, 55)

m.LocationDifficultyTop = Location(736, 1008)
m.PathDifficultyCheckItem = PathParent .. "diff.png"
m.RegionDifficultyCheckItem = Region(40, 600, 295, 60)

m.PathLoading = PathParent .. "loading.png"
m.RegionLoading = Region(1112, 2651, 227, 61)

m.PathRetryTxt = PathParent .. "retry.png"
m.RegionServerError = Region(628, 1782, 63, 60)
m.RegionServerErrorRetry = Region(927, 1788, 214, 52)
m.LocationServerErrorClose = Location(709, 1811)
m.LocationServerErrorRetry = Location(1035, 1813)

m.PathContinueTxt = PathParent .. "continue.png"
m.RegionContinueTxt = Region(91, 1680, 426, 329)

m.PathHostTxt = PathParent .. "host.png"
m.RegionHostText = Region(275, 1365, 185, 70)

m.PathInsufficientTxt = PathParent .. "insufficient.png"
m.RegionInsufficientWings = Region(410, 1850, 140, 90)
m.LocationDiamantiumsRecover = Location(720, 995)
m.LocationRecoverButtonAndClose = Location(816, 1851)

SkillY = 2550
m.LocationSkill1 = Location(523, SkillY)
m.LocationSkill2 = Location(795, SkillY)
m.LocationSkill3 = Location(1084, SkillY)
m.LocationDragon = Location(202, 2229)
m.LocationCommonClickBattle = Location(495, 1785)

m.LocationBattle1 = Location(720, 2450)
m.LocationBattle2 = Location(720, 1200)
m.RepeatCountBattle = 10

return m