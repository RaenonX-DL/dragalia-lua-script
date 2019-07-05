local m = {}

PathParent = "/"

m.LocationCommonClick = Location(1188, 1730)

m.PathCommonScreenCheckItem = PathParent .. "common.png"
m.RegionCommonScreenCheckItem = Region(1225, 102, 1362, 241)

m.LocationQuestTop = Location(137, 1025)

m.PathFriendSelectItem = m.PathParent .. "friend.png"
m.RegionFriendSelectItem = Region(285, 845, 400, 920)

m.LocationMultiPlay = Location(1021, 874)

m.PathToRandomRoomItem = m.PathParent .. "randroom.png"
m.RegionToRandomRoom = Region(545, 1710, 895, 1940)
m.LocationRandomRoom = Location(178, 1903)

m.PathRoomFindingTxt = m.PathParent .. "finding.png"
m.RegionRoomFindingTxt = Region(710, 1450, 835, 1520)

m.PathReadyText = PathParent .. "ready.png"
m.RegionReadyText = Region(1089, 2422, 1200, 2496)
m.LocationReady = Location(1084, 2413)

m.PathLoading = PathParent .. "loading.png"
m.RegionLoading = Region(1112, 2651, 227, 61)

m.PathMenu = PathParent .. "menu.png"
m.RegionMenu = Region(1291, 114, 1393, 212)

SkillY = 2624
m.LocationSkill1 = Location(523, SkillY)
m.LocationSkill2 = Location(795, SkillY)
m.LocationSkill3 = Location(1084, SkillY)
m.LocationDragon = Location(202, 2229)
m.LocationCommonClickBattle = Location(714, 1491)

m.PathEndGameCheckItem = PathParent .. "next.png"
m.RegionEndGameCheckItem = Region(1015, 2635, 1140, 2710)
m.LocationProceedNext = Location(1097, 2665)
m.LocationNoContinue = Location(638, 2288)
m.LocationCloseMiddleDialog = Location(720, 1813)



m.PathRetryTxt = PathParent .. "retry.png"
m.RegionServerError = Region(628, 1782, 63, 60)
m.RegionServerErrorRetry = Region(927, 1788, 214, 52)
m.LocationServerErrorClose = Location(709, 1811)
m.LocationServerErrorRetry = Location(1035, 1813)

m.PathInsufficientTxt = m.PathParent .. "insufficient.png"
m.RegionInsufficientWings = Region(410, 1850, 550, 1940)

m.LocationDiamantiumsRecover = Location(720, 995)

m.LocationRecoverButtonAndClose = Location(816, 1851)

m.PathHostTxt = PathParent .. "host.png"
m.RegionHostText = Region(275, 1365, 460, 1435)

m.PathContinueTxt = PathParent .. "continue.png"
m.RegionContinueTxt = Region(91, 1680, 426, 329)

return m