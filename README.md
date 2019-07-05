### 此腳本系列為 -失落的龍絆- 共鬥刷關用腳本，必須安裝 AnkuLua 才可以使用。
----
此腳本系列最多會有一主功能及四副功能，如下列:
##### 主功能
- 自動遊玩共鬥關卡
##### 副功能
1. 斷線自動取消對話框
2. 自動補毛(目前只支援吃鑽)
3. 房主退房自動取消對話框
4. 滅團即停止自動點擊
 
### 腳本目錄

腳本 | 主功能 | 斷線處理 | 自動補毛 | 房主退房 | 滅團處理
:---:|:---:|:---:|:---:|:---:|:---:|
[DL](#DL) | 單次 | X | X | O | X
[DL Continue](#DL%20Continue) | 輪迴 | O | O | O | O
[DL Raid](#DL%20Raid) | 輪迴 | O | O | O | O
----
### 說明書閱讀方式
- 先確認自己的手機型號，尤其解析度和長寬比。
- 在下面尋找要用的腳本。
- 確認對應的腳本的 **目前可運行手機** 中有自己的手機型號。
    - 手機型號一樣: 基本上可以直接使用，不應該有問題。
    - 解析度一樣 或 長寬比一樣: 可以試用看看，但是可能還是需要自訂座標組和截圖，詳見[自訂指引](#自訂指引)。
        - 螢幕高(Y)/寬(X)比若符合下列任一者，則對應的長寬比的手機型號所用的腳本**可能**可以運行。**可能**的原因是因為各牌手機的虛擬按鍵和通知列高度不一定相同，這會造成按鈕位置偏差。若無法運行，請參見下方[自訂指引](#自訂指引)。
            - 高(Y)/寬(X)比: 296/144 (2.055556), 使用 `Galaxy S9+` 的組建
            - 高(Y)/寬(X)比: 216/108 (2), 使用 `ROG Phone` 的組建
    - 解析度無吻合型號 或 長寬比無吻合型號: 必須自訂座標組和截圖。詳見[自訂指引](#自訂指引)。
- 使用對應的手機型號的腳本測試運行，若無法運行，請自訂座標組和截圖。詳見[自訂指引](#自訂指引)。

### 腳本使用方式
- 虛擬按鍵必須開啟。
- 啟動腳本時，請記得**將播放按鈕放在右中偏上的地方(螢幕切為九宮格後6的位置)**，以避免圖片判斷干擾。
----
# DL
這個腳本只會在**開始選擇房間(畫面出現檢索中)**到**點掉所有對話框回到任務頁面**之間執行。完成這系列動作以後腳本就會自動停止。

### 目前可運行手機
- 三星Galaxy S9+ (WQHD)
----
# DL Continue
這是[DL](#DL)的延伸版本。相較於[DL](#DL)，這個腳本會不停刷關，直到使用者停止。

### 目前可運行手機
- 三星Galaxy S9+ (WQHD)

----
# DL Raid
這個腳本會不停刷Raid活動。針對活動所需要的動作不同，有可能會有戰鬥開始前置動作。

#### 目前戰鬥開始前置動作對應的任務
> **[新春日下招福來運](https://dragalialost.com/cht/news/detail/552)**

### 目前可運行手機
- 三星Galaxy S9+ (WQHD)
- 華碩ROG Phone
----

# 自訂腳本指引

因為腳本模組化，所以自訂腳本時，需要一些方法把基底程式碼跟自己所找到的座標...等專屬於手機型號的資料組在一起。

### 事前準備

- 到 [releases](/releases) 的 assets 裡面**下載此程式庫的壓縮包(通常.zip即可)**，並解壓縮在自己記得的地方。

- **可以讓你做下列事情的繪圖軟體。** 我用的是 [Paint.NET](https://www.getpaint.net/) 。
    - 查詢目前游標座標
    - 擷取區域圖塊並複製貼上生成新圖片
    - 查詢選取區域的左上角座標以及獲得該區域的寬高
    - 重疊兩張圖片，兩張圖片都可以同時看見

- **文字編輯軟體。** 我用的是 [NotePad++](https://notepad-plus-plus.org/) ，因為這款軟體可以Highlight部分lua的關鍵字，而且打字排版相對快，又不需要像一般IDE一樣有繁重的前置讀取。

- **座標尋找、定義用截圖。詳情請參見下表。[圖片畫面對照表查詢請點此。](#圖片畫面對照表)**

腳本 | 主功能 | 斷線處理 | 自動補毛 | 房主退房 | 滅團處理
:---:|:---:|:---:|:---:|:---:|:---:
[DL](#DL) | [圖1](https://i.imgur.com/N0ZkK6p.jpg)、[圖2](https://i.imgur.com/FYwANMu.jpg)、[圖3](https://i.imgur.com/wopdueG.jpg)<br/>[圖4](https://i.imgur.com/Ign8UrZ.jpg)、[圖5](https://i.imgur.com/Lf0lIHw.jpg)、[圖6](https://i.imgur.com/kFyCGVF.jpg)<br/>[圖7](https://i.imgur.com/3ZQ4Fka.jpg) | - | - | [圖17](https://i.imgur.com/FecDTDd.jpg) | -
[DL Continue](#DL%20Continue) | [圖1](https://i.imgur.com/N0ZkK6p.jpg)、[圖2](https://i.imgur.com/FYwANMu.jpg)、[圖3](https://i.imgur.com/wopdueG.jpg)<br/>[圖4](https://i.imgur.com/Ign8UrZ.jpg)、[圖5](https://i.imgur.com/Lf0lIHw.jpg)、[圖6](https://i.imgur.com/kFyCGVF.jpg)<br/>[圖7](https://i.imgur.com/3ZQ4Fka.jpg)、[圖20](https://i.imgur.com/a74UnCW.jpg)、[圖21](https://i.imgur.com/SRoxWjS.jpg)<br/>[圖22](https://i.imgur.com/sq5Xsvg.jpg) | [圖11](https://i.imgur.com/0IXVxBh.jpg)、[圖12](https://i.imgur.com/ZLhFldZ.jpg)、[圖13](https://i.imgur.com/jwjxXTv.jpg) | [圖14](https://i.imgur.com/FGYcjcR.jpg)、[圖15](https://i.imgur.com/TMQGWMr.jpg)、[圖16](https://i.imgur.com/0aUihct.jpg) | [圖17](https://i.imgur.com/FecDTDd.jpg) | [圖18](https://i.imgur.com/3RDUKFx.jpg)、[圖19](https://i.imgur.com/Jn4nRsl.jpg)
[DL Raid](#DL%20Raid) | [圖1](https://i.imgur.com/N0ZkK6p.jpg)、[圖2](https://i.imgur.com/FYwANMu.jpg)、[圖3](https://i.imgur.com/wopdueG.jpg)<br/>[圖4](https://i.imgur.com/Ign8UrZ.jpg)、[圖5](https://i.imgur.com/Lf0lIHw.jpg)、[圖6](https://i.imgur.com/kFyCGVF.jpg)<br/>[圖7](https://i.imgur.com/3ZQ4Fka.jpg)、[圖8](https://i.imgur.com/Moczq9t.jpg)、[圖9](https://i.imgur.com/uJrSqCA.jpg)<br/>[圖10](https://i.imgur.com/hVbDrJz.jpg) | [圖11](https://i.imgur.com/0IXVxBh.jpg)、[圖12](https://i.imgur.com/ZLhFldZ.jpg)、[圖13](https://i.imgur.com/jwjxXTv.jpg) | [圖14](https://i.imgur.com/FGYcjcR.jpg)、[圖15](https://i.imgur.com/TMQGWMr.jpg)、[圖16](https://i.imgur.com/0aUihct.jpg) | [圖17](https://i.imgur.com/FecDTDd.jpg) | [圖18](https://i.imgur.com/3RDUKFx.jpg)、[圖19](https://i.imgur.com/Jn4nRsl.jpg)

### 圖片畫面對照表
圖片編號 | 所屬功能 | 縮圖 | 主功能
:---:|:---:|:---:|:---:
#1|主功能|<img src="https://i.imgur.com/N0ZkK6p.jpg" width="50"/>|找不到房間時彈出再檢索對話框
#2|主功能|<img src="https://i.imgur.com/FYwANMu.jpg" width="50"/>|房間檢索中
#3|主功能|<img src="https://i.imgur.com/wopdueG.jpg" width="50"/>|檢索前畫面。有隨機入房、開設條件房...等按鈕
#4|主功能|<img src="https://i.imgur.com/Ign8UrZ.jpg" width="50"/>|角色生存的戰鬥中畫面
#5|主功能|<img src="https://i.imgur.com/Lf0lIHw.jpg" width="50"/>|進房後尚未準備的畫面
#6|主功能|<img src="https://i.imgur.com/kFyCGVF.jpg" width="50"/>|戰鬥完成後的結算畫面
#7|主功能|<img src="https://i.imgur.com/3ZQ4Fka.jpg" width="50"/>|戰鬥完成後的結算畫面，有EX對話框
#8|主功能|<img src="https://i.imgur.com/Moczq9t.jpg" width="50"/>|任務目錄頁面<br/>可以選擇HELL、RAID戰、BOSS戰...等
#9|主功能|<img src="https://i.imgur.com/uJrSqCA.jpg" width="50"/>|獲得EX，點選任務目錄的RAID戰後的畫面
#10|主功能|<img src="https://i.imgur.com/hVbDrJz.jpg" width="50"/>|未獲得EX，點選任務目錄的RAID戰後的畫面
#11|主功能|<img src="https://i.imgur.com/0IXVxBh.jpg" width="50"/>|開戰前的讀取中畫面
#12|斷線處理|<img src="https://i.imgur.com/0IXVxBh.jpg" width="50"/>|無法重試的連線失敗畫面
#13|斷線處理|<img src="https://i.imgur.com/jwjxXTv.jpg" width="50"/>|可重試的連線失敗畫面
#14|自動補毛|<img src="https://i.imgur.com/FGYcjcR.jpg" width="50"/>|開始關卡前，遊戲顯示毛不足，必須使用道具或鑽石補的畫面
#15|自動補毛|<img src="https://i.imgur.com/TMQGWMr.jpg" width="50"/>|補毛確認對話框(有確認補毛、取消兩個按鈕)
#16|自動補毛|<img src="https://i.imgur.com/0aUihct.jpg" width="50"/>|已補毛提示對話框(只有關閉按鈕)
#17|房主退房|<img src="https://i.imgur.com/FecDTDd.jpg" width="50"/>|可以找一個人開房後自己進房再請對方關房獲取
#18|滅團處理|<img src="https://i.imgur.com/3RDUKFx.jpg" width="50"/>|死亡時第一個出現的畫面，選擇鑽石種類復活或放棄
#19|滅團處理|<img src="https://i.imgur.com/Jn4nRsl.jpg" width="50"/>|已選定鑽石種類，等待確認復活的畫面
#20|主功能|<img src="https://i.imgur.com/a74UnCW.jpg" width="50"/>|點選任務以後，預設單機遊玩時的好友選擇畫面
#21|主功能|<img src="https://i.imgur.com/SRoxWjS.jpg" width="50"/>|點選任務並點選要多人遊玩以後，房間控制按鈕集中頁面
#22|主功能|<img src="https://i.imgur.com/sq5Xsvg.jpg" width="50"/>|任務(龍之試煉、迎擊...等)選擇頁面

圖片提取要點
- [圖12](https://i.imgur.com/0IXVxBh.jpg): 比較難抓到，通常是腳本卡住以後截圖才有機會獲得。開戰前讀取中出現/進入隨機房前出現的截圖都可以做為圖12。
- [圖13](https://i.imgur.com/jwjxXTv.jpg): 連線開戰前將網路切斷即可。
- [圖14](https://i.imgur.com/FGYcjcR.jpg): 必須顯示"羽毛不足"，否則圖片無法使用ˇ。
- [圖17](https://i.imgur.com/FecDTDd.jpg): 找一位朋友協助開房，進房後請朋友關房。
- [圖18](https://i.imgur.com/3RDUKFx.jpg)、[圖19](https://i.imgur.com/Jn4nRsl.jpg): 用很爛的隊伍到要求高的關卡自殺。

> 因為在範本自訂檔案中提到圖片會使用截圖序號，推薦開著本頁操作以隨時對應。

以下範例將假設手機型號為 **DL** ，要組建的腳本為 [DL Raid](#DL%20Raid) 。範例中所看到的 **DL** 或是 [DL Raid](#DL%20Raid) 都可以更換為自己所要組建的手機型號、腳本。

#### 操作步驟

1. 創建 `Phone Specific/DL` 資料夾。

2. 複製 `Phone Specific/~Template~/DLRaid` (整個資料夾)至 `Phone Specific/DL/DLRaid` 。

3. 開啟 `.../DLRaid/script/Customize.lua` ，根據裡面的指示操作。
    > `Location(X, Y)`: 代表一個座標點。參數名稱代表其意義。<br/>
    > `Region(X, Y, W, H)`: 代表一個區域。X、Y分別代表區域左上角的座標，W、H則是區域的寬、高。設定圖片搜索用區域座標時建議**朝各方向拉大3畫素**。

    1. 圖片通常因為畫素不同導致位置不同，必須重新抓取。
    2. 若非必須圖片暫時無法取得，請至少讓圖片存在，否則腳本找不到圖片將會無法運行。可以使用預設所提供的圖片或其他圖片暫時代替。座標可以先不更動。

4. 開啟 `.../DLRaid/script/Configs.lua` ，根據需求調整(覆寫)設定。裡面會是目前所有設定的預設值，如果認為不需要更動，直接刪除該設定(該行)即可。

5. 檔案內的中文註解可以自行決定刪除與否，不會影響腳本的運行。

6. 執行 `Build/Template BuildDLRaid.bat`，輸入**DL**。

7. 批次檔將會生成一個資料夾 **DLRaid-DL** ，將整個資料夾或裡面的檔案剪下/複製到手機上運行。
