local m = {}

PathParent = "/"

m.LocationCommonClick = Location(1188, 1730)

m.PathCommonScreenCheckItem = PathParent .. "common.png"
m.RegionCommonScreenCheckItem = Region(205, 125, 65, 45)

m.PathReadyText = PathParent .. "ready.png"
m.RegionReadyText = Region(1089, 2422, 111, 74)
m.LocationReady = Location(1084, 2413)

SkillY = 2550
m.LocationSkill1 = Location(523, SkillY)
m.LocationSkill2 = Location(795, SkillY)
m.LocationSkill3 = Location(1084, SkillY)
m.LocationDragon = Location(202, 2229)
m.LocationCommonClickBattle = Location(495, 1785)

m.PathMenu = PathParent .. "menu.png"
m.RegionMenu = Region(1291, 114, 102, 98)

m.PathEndGameCheckItem = PathParent .. "next.png"
m.RegionEndGameCheckItem = Region(1012, 2629, 136, 74)
m.LocationProceedNext = Location(1097, 2665)
m.LocationNoContinue = Location(1114, 2880)
m.LocationCloseMiddleDialog = Location(720, 1813)



m.PathHostTxt = PathParent .. "host.png"
m.RegionHostText = Region(275, 1365, 185, 70)

return m