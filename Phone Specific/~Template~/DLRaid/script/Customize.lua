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

-- 點擊任務目錄中，RAID戰的座標
-- 從圖8中抓取Raid戰的位置。
-- 抓取時，座標建議不要和接下來會出現的圖9、圖10中的任何按鈕重疊，以避免判斷錯誤時誤按造成腳本失控。在支援的手機上實作時所點擊的點在最左邊，幾乎螢幕邊緣。
m.LocationQuestTop = Location(0, 0)

-- 難易度選擇 字樣的圖和圖片偵測區域 / 偵測到 難易度選擇 字樣後所要點擊的座標
-- 參見image/diff.png的範例圖檔。該圖/字樣位於圖9，圖10的左上方。
-- 點擊座標: 可以同時於圖9中可以點到EX、圖10中點到上級的座標。可以迴避與接下來的圖3的任何按鈕重合的點更好，雖然在支援的手機上實作時沒有做這個也沒有發生過問題。
m.LocationDifficultyTop = Location(0, 0)
m.PathDifficultyCheckItem = PathParent .. "diff.png"
m.RegionDifficultyCheckItem = Region(0, 0, 0, 0)

-- 關閉字樣圖 / 判斷是否準備要找房的圖和圖片偵測區域
-- 參見image/close.png的範例圖檔。因為這張圖還有在其他地方會使用，請截取任何出現關閉按鈕時一定會有的東西，建議擷取部分或全部關閉字樣最安全。
-- 此圖可以在圖3的隨機找房的按鈕下方找到。
m.PathCloseTxt = PathParent .. "close.png"
m.RegionRoomSelectCloseTxt = Region(0, 0, 0, 0)

-- 點選隨機找房按鈕的座標
-- 從圖3抓取，或者可以跟*非戰鬥狀態中常時點擊座標(LocationCommonClick)*相同。抓取座標所需條件和前述座標相同。
m.LocationRandomRoom = Location(0, 0)

-- 房間檢索中的圖和圖片偵測區域
-- 參見image/finding.png的範例圖檔。該圖位於圖2偏中間的"檢索"字樣。
m.PathRoomFindingTxt = PathParent .. "finding.png"
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
m.PathInsufficientTxt = PathParent .. "insufficient.png"
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



-- 戰鬥前置動作座標
-- 動作大綱:
--     目前所支援的RAID任務前置動作是開場往上滑約10下到王的背後，然後往下滑1下以面對王才開始攻擊。
-- 腳本會滑 由 -戰鬥座標1(LocationBattle1)- 滑至 -戰鬥座標2(LocationBattle2)- ，並重複 -動作重複次數(RepeatCountBattle)- 次才開始戰鬥循環。
-- 戰鬥座標1至2是往上滑，所以戰鬥座標1跟2的X可以相同，但是1的Y會大於2的Y。    
-- 動作重複次數通常設10，通常不需更動。
m.LocationBattle1 = Location(0, 0)
m.LocationBattle2 = Location(0, 0)
m.RepeatCountBattle = 0

return m