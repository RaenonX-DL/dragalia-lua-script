-- Inherit Specific Common/Coordinates.lua

-- ========== v2.1.0 ==========

-- 讀取中 字樣的圖和圖片偵測區域
-- 參見image/loading.png的範例圖檔。該圖位於圖11的右下角。
m.PathLoading = PathParent .. "loading.png"
m.RegionLoading = Region(0, 0, 0, 0)

-- 斷線處理所需判斷的圖和圖片偵測區域
-- **ServerErrorRetry (可重試連接錯誤):
--     圖片路徑(Path): 參見image/retry.png的範例圖檔。該圖在圖13的右者按鈕上。
--     座標(Location): 關閉對話框所需點擊的座標。可從圖13中抓取。
-- **ServerError (不可重試連接錯誤)
--     區域(Region): 圖12中可能會出現關閉字樣圖(PathCloseTxt，參見上方)的圖片的座標。
--     座標(Location): 關閉對話框所需點擊的座標。可從圖12中抓取。

-- 關閉字樣圖
-- 參見image/close.png的範例圖檔。因為這張圖還有在其他地方會使用，請截取任何出現關閉按鈕時一定會有的東西，建議擷取部分或全部關閉字樣最安全。
m.PathRetryTxt = PathParent .. "retry.png"
m.PathCloseTxt = PathParent .. "close.png"
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


-- 房間檢索中的圖和圖片偵測區域
-- 參見image/finding.png的範例圖檔。該圖位於圖2偏中間的"檢索"字樣。
m.PathRoomFindingTxt = PathParent .. "finding.png"
m.RegionRoomFindingTxt = Region(0, 0, 0, 0)

-- ========== v2.3.0 ==========

-- 終戰時，資源溢出對話方塊的關閉字樣的圖片偵測區域和點擊座標
-- 可參閱圖24中間的"閉"字樣。
m.PathCenterClose = PathParent .. "overlimit.png"
m.RegionCenterClose = Region(0, 0, 0, 0)
m.LocationCenterClose = Location(0, 0)