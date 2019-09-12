local m = {}

-- ========== v2.1.0 ==========

-- 圖片母目錄，通常不需要更動，這個會自動連結到image/這個資料夾。
PathParent = "/"

-- 非戰鬥狀態中常時點擊座標
-- 抓取時，必須能一次點到圖1的再檢索、圖3的隨機入室按鈕，但是不會點到圖2的取消按鈕。
m.LocationCommonClick = Location(0, 0)

-- 判斷是否在非戰鬥相關螢幕的圖和圖片偵測區域
-- 參見image/common.png的範例圖檔。該圖位於任何沒有被對話框覆蓋，並且不在任務中的圖片(例: 圖5)的左上角。
-- 範例圖所抓的是體力的日文的前兩個字，部分手機因不明原因無法判斷，此時可以改成判斷右方禮物箱圖案(請記得不要拍到會因為有無待領物品而被影響的區域)。
m.PathCommonScreenCheckItem = PathParent .. "common.png"
m.RegionCommonScreenCheckItem = Region(0, 0, 0, 0)

-- 判斷進房後準備與否字樣的圖和圖片偵測區域/按下準備的位置
-- 參見image/ready.png的範例圖檔。該圖位於圖5右下角準備按鈕上。
m.PathReadyText = PathParent .. "ready.png"
m.RegionReadyText = Region(0, 0, 0, 0)
m.LocationReady = Location(0, 0)

-- 技能Y座標(SkillY) - 圖4中，點擊技能1、2、3時的Y座標
-- 技能1、2、3座標(LocationSkill1、LocationSkill2、LocationSkill3) - 圖4中，點擊對應技能時的X座標。
-- 龍化座標(LocationDragon) - 圖4中，點擊後會使角色龍化的座標。
-- 普攻座標(LocationCommonClickBattle) - 圖4中任一點可以使角色普攻一下的座標。為了避免遊戲對話框誤判，建議偏左(大部分對話框"是"的選項都在右側)
-- !!! : 請在繪圖軟體上重合圖4和圖6，以檢查技能3的座標(LocationSkill3)不會按到圖6中的*繼續*，否則有可能造成腳本誤判。
-- !!! : 將座標點設定在「全員陣亡 & 戰鬥結束後，直接回到主畫面」時不會按到任何按鈕的地方可以避免誤按。
SkillY = 0
m.LocationSkill1 = Location(0, SkillY)
m.LocationSkill2 = Location(0, SkillY)
m.LocationSkill3 = Location(0, SkillY)
m.LocationDragon = Location(0, 0)
m.LocationCommonClickBattle = Location(0, 0)

-- 判斷戰鬥中時用的圖和圖片偵測區域
-- 參見image/menu.png的範例圖檔。該圖位於圖4右上角。
m.PathMenu = PathParent .. "menu.png"
m.RegionMenu = Region(0, 0, 0, 0)

-- 戰鬥結束檢查用圖及結算點擊座標
-- 參見image/next.png的範例圖檔。該圖位於圖6右下角*繼續*按鈕上。
-- 座標1 (ProceedNext): 按下*繼續*按鈕的位置。建議重疊圖6和圖23，兩個按鈕都能按到的座標。
-- 座標2 (NoContinue): 按下*不續戰*按鈕的位置，於預設有支援的手機中是按下返回的虛擬按鈕
-- 座標3 (CloseMiddleDialog): 關閉因出現EX而彈出的對話框的位置，詳見圖7關閉按鈕的位置。建議靠左。
m.PathEndGameCheckItem = PathParent .. "next.png"
m.RegionEndGameCheckItem = Region(0, 0, 0, 0)
m.LocationProceedNext = Location(0, 0)
m.LocationNoContinue = Location(0, 0)
m.LocationCloseMiddleDialog = Location(0, 0)



-- 房主退房處理用圖和圖片偵測區域
-- 參見image/host.png的範例圖檔。該圖位於圖16對話框中的"房主"字樣。
-- 關閉對話框會使用上方*戰鬥結束座標3(CloseMiddleDialog)*的座標點擊。
m.PathHostTxt = PathParent .. "host.png"
m.RegionHostText = Region(0, 0, 0, 0)

-- 滅團判斷用圖和圖片偵測區域
-- 參見image/continue.png的範例圖檔。該圖位於圖17、圖18所彈出的對話框中，上方"繼續"字樣。
-- 抓取範圍座標時，請重合圖17、圖18，然後框選一個於圖17、圖18畫面中，"繼續"字樣都會存在於框內的範圍。
m.PathContinueTxt = PathParent .. "continue.png"
m.RegionContinueTxt = Region(0, 0, 0, 0)