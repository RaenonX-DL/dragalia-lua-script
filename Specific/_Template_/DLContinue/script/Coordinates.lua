-- Inherit Specific Common/Coordinates+Advanced.lua

-- ========== v2.1.0 ==========

-- 最上方的任務座標
-- 通常會是龍超級、迎擊超級。參見圖21的光迎超級位置。因為無法和圖19、圖20上方的那條單人、多人重合，所以點進去是任務就可以。
m.LocationQuestTop = Location(0, 0)

-- 判斷是否在好友選擇清單的圖和圖片偵測區域
-- 參見image/friend.png的範例圖檔。該圖位於圖19上方"單人/多人"選擇頁籤。截圖時，單人必須是選中的狀態，否則可能判圖出錯。
m.PathFriendSelectItem = PathParent .. "friend.png"
m.RegionFriendSelectItem = Region(0, 0, 0, 0)

-- 上方"單人/多人"選擇頁籤的"多人"的座標
-- 使用圖19或圖20都可以抓取座標
m.LocationMultiPlay = Location(0, 0)

-- 隨機入室 字樣的圖和圖片偵測區域 / 隨機入室按鈕點擊座標
-- 參見image/randroom.png的範例圖檔。該圖位於圖20偏下的"隨機入室"字樣。
-- 點擊座標直接與"非戰鬥狀態中常時點擊座標(LocationCommonClick)"相同，可以直接將其複製使用，或是尋找符合上述條件的座標點。
m.PathToRandomRoomItem = PathParent .. "randroom.png"
m.RegionToRandomRoom = Region(0, 0, 0, 0)
m.LocationRandomRoom = Location(0, 0)


