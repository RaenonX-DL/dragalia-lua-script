-- Inherit Specific Common/Coordinates+Advanced.lua

-- ====== v2.0.2 ======

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

-- 關閉字樣圖 / 判斷是否準備要找房的圖片偵測區域
-- 參見image/close.png的範例圖檔以確認區域。因為這張圖還有在其他地方會使用，請截取任何出現關閉按鈕時一定會有的東西，建議擷取部分或全部關閉字樣最安全。
-- 此區域可以在圖3的隨機找房的按鈕下方找到。
m.RegionRoomSelectCloseTxt = Region(0, 0, 0, 0)

-- 點選隨機找房按鈕的座標
-- 從圖3抓取，或者可以跟*非戰鬥狀態中常時點擊座標(LocationCommonClick)*相同。抓取座標所需條件和前述座標相同。
m.LocationRandomRoom = Location(0, 0)


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