local m = {}

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

-- 最上方的任務座標
-- 通常會是龍超級、迎擊超級。參見圖21的光迎超級位置。因為無法和圖19、圖20上方的那條單人、多人重合，所以點進去是任務就可以。
m.LocationQuestTop = Location(0, 0)

-- 判斷是否在好友選擇清單的圖和圖片偵測區域
-- 參見image/friend.png的範例圖檔。該圖位於圖19上方"單人/多人"選擇頁籤。截圖時，單人必須是選中的狀態，否則可能判圖出錯。
m.PathFriendSelectItem = m.PathParent .. "friend.png"
m.RegionFriendSelectItem = Region(0, 0, 0, 0)

-- 上方"單人/多人"選擇頁籤的"多人"的座標
-- 使用圖19或圖20都可以抓取座標
m.LocationMultiPlay = Location(0, 0)

-- 隨機入室 字樣的圖和圖片偵測區域 / 隨機入室按鈕點擊座標
-- 參見image/randroom.png的範例圖檔。該圖位於圖20偏下的"隨機入室"字樣。
-- 點擊座標直接與"非戰鬥狀態中常時點擊座標(LocationCommonClick)"相同，可以直接將其複製使用，或是尋找符合上述條件的座標點。
m.PathToRandomRoomItem = m.PathParent .. "randroom.png"
m.RegionToRandomRoom = Region(0, 0, 0, 0)
m.LocationRandomRoom = Location(0, 0)

-- 房間檢索中的圖和圖片偵測區域
-- 參見image/finding.png的範例圖檔。該圖位於圖2偏中間的"檢索"字樣。
m.PathRoomFindingTxt = m.PathParent .. "finding.png"
m.RegionRoomFindingTxt = Region(0, 0, 0, 0)

-- 判斷進房後準備與否字樣的圖和圖片偵測區域/按下準備的位置
-- 參見image/ready.png的範例圖檔。該圖位於圖5右下角準備按鈕上。
m.PathReadyText = PathParent .. "ready.png"
m.RegionReadyText = Region(0, 0, 0, 0)
m.LocationReady = Location(0, 0)

-- 讀取中 字樣的圖和圖片偵測區域
-- 參見image/loading.png的範例圖檔。該圖位於圖11的右下角。
m.PathLoading = PathParent .. "loading.png"
m.RegionLoading = Region(0, 0, 0, 0)

-- 判斷戰鬥中時用的圖和圖片偵測區域
-- 參見image/menu.png的範例圖檔。該圖位於圖4右上角。
m.PathMenu = PathParent .. "menu.png"
m.RegionMenu = Region(0, 0, 0, 0)

-- 技能Y座標(SkillY) - 圖4中，點擊技能1、2、3時的Y座標
-- 技能1、2、3座標(LocationSkill1、LocationSkill2、LocationSkill3) - 圖4中，點擊對應技能時的X座標。
-- 龍化座標(LocationDragon) - 圖4中，點擊後會使角色龍化的座標。
-- 普攻座標(LocationCommonClickBattle) - 圖4中任一點可以使角色普攻一下的座標。為了避免遊戲對話框誤判，建議偏左(大部分對話框"是"的選項都在右側)
-- !!! : 請在繪圖軟體上重合圖4和圖6，以檢查技能3的座標(LocationSkill3)不會按到圖6中的*繼續*，否則有可能造成腳本誤判。
SkillY = 0
m.LocationSkill1 = Location(0, SkillY)
m.LocationSkill2 = Location(0, SkillY)
m.LocationSkill3 = Location(0, SkillY)
m.LocationDragon = Location(0, 0)
m.LocationCommonClickBattle = Location(0, 0)

-- 戰鬥結束檢查用圖及結算點擊座標
-- 參見image/next.png的範例圖檔。該圖位於圖6右下角*繼續*按鈕上。
-- 座標1 (ProceedNext): 按下*繼續*按鈕的位置
-- 座標2 (NoContinue): 按下*不續戰*按鈕的位置，於預設有支援的手機中是按下返回的虛擬按鈕
-- 座標3 (CloseMiddleDialog): 關閉因出現EX而彈出的對話框的位置，詳見圖7關閉按鈕的位置。
m.PathEndGameCheckItem = PathParent .. "next.png"
m.RegionEndGameCheckItem = Region(0, 0, 0, 0)
m.LocationProceedNext = Location(0, 0)
m.LocationNoContinue = Location(0, 0)
m.LocationCloseMiddleDialog = Location(0, 0)



-- 斷線處理所需判斷的圖和圖片偵測區域
-- **ServerErrorRetry (可重試連接錯誤):
--     圖片路徑(Path): 參見image/retry.png的範例圖檔。該圖在圖13的右者按鈕上。
--     座標(Location): 關閉對話框所需點擊的座標。可從圖13中抓取。
-- **ServerError (不可重試連接錯誤)
--     區域(Region): 圖12中可能會出現關閉字樣圖(PathCloseTxt，參見上方)的圖片的座標。
--     座標(Location): 關閉對話框所需點擊的座標。可從圖12中抓取。
m.PathRetryTxt = PathParent .. "retry.png"
m.RegionServerError = Region(0, 0, 0, 0)
m.RegionServerErrorRetry = Region(0, 0, 0, 0)
m.LocationServerErrorClose = Location(0, 0)
m.LocationServerErrorRetry = Location(0, 0)

-- 補毛處理判斷用圖(不足字樣)
-- 參見image/insufficient.png的範例圖檔。該圖位於圖13中間偏下，關閉按鈕的上方。
m.PathInsufficientTxt = m.PathParent .. "insufficient.png"
m.RegionInsufficientWings = Region(0, 0, 0, 0)

-- 補毛選擇點擊座標
-- 可參閱圖13抓取。因為本腳本沒有實作吃灰補毛，所以目前只能選彩鑽或龍鑽補毛。
m.LocationDiamantiumsRecover = Location(0, 0)

-- 補毛確認座標
-- 抓取時，重合圖14、圖15，找出可以一次按到確認補毛和關閉對話框按鈕的座標。
m.LocationRecoverButtonAndClose = Location(0, 0)

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

return m