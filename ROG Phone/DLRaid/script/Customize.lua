local m = {}

PathParent = "/"

m.LocationCommonClick = Location(1188, 1730)

m.PathMenu = PathParent .. "menu.png"
_RegionMenu = Region(976, 104, 1042, 462)

m.PathReadyText = PathParent .. "ready.png"
_RegionReadyText = Region(822, 1758, 900, 1802)
_LocationReady = Location(825, 1748)

m.PathEndGameCheckItem = PathParent .. "next.png"
_RegionEndGameCheckItem = Region(765, 1911, 850, 1954)
_LocationProceedNext = Location(812, 1932)
_LocationNoContinue = Location(301, 2094)
_LocationCloseMiddleDialog = Location(516, 1282)

m.PathCommonScreenCheckItem = PathParent .. "common.png"
_RegionCommonScreenCheckItem = Region(950, 126, 1014, 192)

_LocationQuestTop = Location(10, 1238)
m.PathCloseTxt = PathParent .. "close.png"
_RegionRoomSelectCloseTxt = Region(470, 1572, 515, 1617)  

_LocationRandomRoom = Location(787, 1279)
m.PathRoomFindingTxt = PathParent .. "finding.png"
_RegionRoomFindingTxt = Region(540, 1062, 620, 1106)

_LocationDifficultyTop = Location(527, 779)
m.PathDifficultyCheckItem = PathParent .. "diff.png")
_RegionDifficultyCheckItem = Region(29, 423, 248, 470)

m.RegionLoading = Region(0, 258, 30, 30) -- NO IMAGE

m.PathRetryTxt = PathParent .. "retry.png" -- NO IMAGE
m.RegionServerError = Region(0, 0, 0, 0) -- NO IMAGE
m.RegionServerErrorRetry = Region(0, 0, 0, 0) -- NO IMAGE
m.LocationServerErrorClose = Location(0, 0) -- NO IMAGE
m.LocationServerErrorRetry = Location(0, 0) -- NO IMAGE

m.PathContinueTxt = PathParent .. "continue.png" -- NO IMAGE
m.RegionContinueTxt = Region(91, 1680, 426, 329) -- NO IMAGE

m.PathHostTxt = PathParent .. "host.png"
m.RegionHostText = Region(214, 1001, 338, 1042)

m.PathInsufficientTxt = PathParent .. "insufficient.png"
m.RegionInsufficientWings = Region(315, 1370, 400, 1414)
m.LocationDiamantiumsRecover = Location(541, 724)
m.LocationRecoverButtonAndClose = Location(653, 1340)

SkillY = 1848
m.LocationSkill1 = Location(384, _SkillY)
m.LocationSkill2 = Location(603, _SkillY)
m.LocationSkill3 = Location(816, _SkillY)
m.LocationDragon = Location(159, 1602)
m.LocationCommonClickBattle = Location(200, 1380)

m.LocationBattle1 = Location(540, 1570)
m.LocationBattle2 = Location(540, 400)
m.RepeatCountBattle = 10

return m