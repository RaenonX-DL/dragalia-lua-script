local m = {}

PathParent = "/"

m.LocationCommonClick = Location(787, 1279)

m.PathCommonScreenCheckItem = PathParent .. "common.png"
m.RegionCommonScreenCheckItem = Region(950, 126, 64, 66)

m.LocationQuestTop = Location(10, 1238)

m.LocationDifficultyTop = Location(527, 779)
m.PathDifficultyCheckItem = PathParent .. "diff.png"
m.RegionDifficultyCheckItem = Region(26, 417, 231, 59)

m.PathCloseTxt = PathParent .. "close.png"
m.RegionRoomSelectCloseTxt = Region(469, 1569, 51, 50)  

m.LocationRandomRoom = Location(787, 1279)

m.PathRoomFindingTxt = PathParent .. "finding.png"
m.RegionRoomFindingTxt = Region(540, 1062, 80, 44)

m.PathReadyText = PathParent .. "ready.png"
m.RegionReadyText = Region(822, 1758, 78, 44)
m.LocationReady = Location(825, 1748)

m.PathLoading = PathParent .. "loading.png"
m.RegionLoading = Region(830, 1920, 179, 52)

m.PathMenu = PathParent .. "menu.png"
m.RegionMenu = Region(976, 102, 66, 60)

SkillY = 1848
m.LocationSkill1 = Location(384, SkillY)
m.LocationSkill2 = Location(603, SkillY)
m.LocationSkill3 = Location(816, SkillY)
m.LocationDragon = Location(159, 1602)
m.LocationCommonClickBattle = Location(200, 1380)

m.PathEndGameCheckItem = PathParent .. "next.png"
m.RegionEndGameCheckItem = Region(762, 1906, 91, 51)
m.LocationProceedNext = Location(812, 1932)
m.LocationNoContinue = Location(301, 2094)
m.LocationCloseMiddleDialog = Location(516, 1282)



m.PathRetryTxt = PathParent .. "retry.png"
m.RegionServerError = Region(469, 1302, 54, 54)
m.RegionServerErrorRetry = Region(695, 1309, 156, 38)
m.LocationServerErrorClose = Location(533, 1325)
m.LocationServerErrorRetry = Location(772, 1328)

m.PathInsufficientTxt = PathParent .. "insufficient.png"
m.RegionInsufficientWings = Region(315, 1370, 85, 44)

m.LocationDiamantiumsRecover = Location(541, 724)

m.LocationRecoverButtonAndClose = Location(653, 1340)

m.PathHostTxt = PathParent .. "host.png"
m.RegionHostText = Region(214, 1001, 126, 47)

m.PathContinueTxt = PathParent .. "continue.png"
m.RegionContinueTxt = Region(68, 1201, 324, 239)



m.LocationBattle1 = Location(540, 1570)
m.LocationBattle2 = Location(540, 400)
m.RepeatCountBattle = 10

return m