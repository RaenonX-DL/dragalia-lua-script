# 此腳本系列為 -失落的龍絆- 共鬥刷關用腳本，必須安裝 AnkuLua 才可以使用。

此腳本系列最多會有一個主功能及四個副功能，如下列:
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
[DL Continue](#DL-Continue) | 輪迴 | O | O | O | O
[DL Raid](#DL-Raid) | 輪迴 | O | O | O | O
----
### 說明書閱讀方式
- 先確認自己的手機型號，尤其解析度和長寬比。
- 在下面尋找要用的腳本。
- 確認對應的腳本的 **目前可運行手機** 中有自己的手機型號。
    - 手機型號一樣: 基本上可以直接使用，不應該有問題。
    - 解析度一樣 或 長寬比一樣: 可以試用看看，但是可能還是需要自訂座標組和截圖，詳見[腳本自訂指引](#腳本自訂指引)。
        - 螢幕高(Y)/寬(X)比若符合下列任一者，則對應的長寬比的手機型號所用的腳本**可能**可以運行。**可能**的原因是因為各牌手機的虛擬按鍵和通知列高度不一定相同，這會造成按鈕位置偏差。若無法運行，請參見下方[腳本自訂指引](#腳本自訂指引)。
            - 高(Y)/寬(X)比: 296/144 (2.055556), 使用 `Galaxy S9+` 的組建
            - 高(Y)/寬(X)比: 216/108 (2), 使用 `ROG Phone` 的組建
    - 解析度無吻合型號 或 長寬比無吻合型號: 必須自訂座標組和截圖。詳見[腳本自訂指引](#腳本自訂指引)。
- 使用對應的手機型號的腳本測試運行，若無法運行，請自訂座標組和截圖。詳見[腳本自訂指引](#腳本自訂指引)。

### 腳本使用方式
- 虛擬按鍵必須開啟。
- 請勿勾選 **找不到房間時自動建立房間** ，否則腳本很容易運行失敗。
- 啟動腳本時，請記得**將播放按鈕放在右中偏上的地方(螢幕切為九宮格後6的位置)**，以避免圖片判斷干擾。
- 腳本執行時會有橘色框框，該框是為[腳本自訂](#腳本自訂指引)偵錯而設計，可以不予理會。

----

# DL
這個腳本只會在**開始選擇房間(畫面出現檢索中)**到**點掉所有對話框回到任務頁面**之間執行。完成這系列動作以後腳本就會自動停止。

### 目前可運行手機
- 三星Galaxy S9+ (WQHD)
- 三星Galaxy Note 8 (WQHD) - 使用三星Galaxy S9+的腳本。

### 支援[腳本自訂](#腳本自訂指引)
是

----

# DL Continue
這是[DL](#DL)的延伸版本。相較於[DL](#DL)，這個腳本會不停刷關，直到使用者停止。

### 目前可運行手機
- 三星Galaxy S9+ (WQHD)
- 三星Galaxy Note 8 (WQHD) - 使用三星Galaxy S9+的腳本。

### 支援[腳本自訂](#腳本自訂指引)
是

----

# DL Raid
這個腳本會不停刷Raid活動。針對活動所需要的動作不同，有可能會有戰鬥開始前置動作。

#### 目前戰鬥開始前置動作對應的任務
> **[新春日下招福來運](https://dragalialost.com/cht/news/detail/552)**

### 目前可運行手機
- 三星Galaxy S9+ (WQHD)
- 三星Galaxy Note 8 (WQHD) - 使用三星Galaxy S9+的腳本。
- 華碩ROG Phone

### 支援[腳本自訂](#腳本自訂指引)
是

----

# 腳本自訂指引

因為腳本模組化，所以自訂腳本時，需要一些方法把基底程式碼跟自己所找到的座標...等專屬於手機型號的資料組在一起。

雖然範例圖片中是使用日文界面，自行截圖時可以使用任何語言。

### 事前準備

- 到 [releases](/releases) 的 assets 裡面**下載此程式庫的壓縮包(通常.zip即可)**，並解壓縮在自己記得的地方。

- **可以讓你做下列事情的繪圖軟體。** 我用的是 [Paint.NET](https://www.getpaint.net/) 。
    - 查詢目前游標座標
    - 擷取區域圖塊並複製貼上生成新圖片
    - 查詢選取區域的左上角座標以及獲得該區域的寬高
    - 重疊兩張圖片，兩張圖片都可以同時看見

- **文字編輯軟體。** 我用的是 [NotePad++](https://notepad-plus-plus.org/) ，因為這款軟體可以Highlight部分lua的關鍵字，而且打字排版相對快，又不需要像一般IDE一樣有繁重的前置讀取。

- **座標尋找、定義用截圖。詳情請參見下表。[圖片畫面對照表查詢請點此。](#圖片畫面對照表)**

- **安裝 [Python 3](https://www.python.org/downloads/)。** 組建腳本用。

腳本 | 主功能 | 斷線處理 | 自動補毛 | 房主退房 | 滅團處理
:---:|:---:|:---:|:---:|:---:|:---:
[DL](#DL) | [圖1](https://i.imgur.com/N0ZkK6p.jpg)、[圖2](https://i.imgur.com/FYwANMu.jpg)、[圖3](https://i.imgur.com/wopdueG.jpg)<br/>[圖4](https://i.imgur.com/Ign8UrZ.jpg)、[圖5](https://i.imgur.com/Lf0lIHw.jpg)、[圖6](https://i.imgur.com/kFyCGVF.jpg)<br/>[圖7](https://i.imgur.com/3ZQ4Fka.jpg) | - | - | [圖17](https://i.imgur.com/FecDTDd.jpg) | -
[DL Continue](#DL-Continue) | [圖1](https://i.imgur.com/N0ZkK6p.jpg)、[圖2](https://i.imgur.com/FYwANMu.jpg)、[圖3](https://i.imgur.com/wopdueG.jpg)<br/>[圖4](https://i.imgur.com/Ign8UrZ.jpg)、[圖5](https://i.imgur.com/Lf0lIHw.jpg)、[圖6](https://i.imgur.com/kFyCGVF.jpg)<br/>[圖7](https://i.imgur.com/3ZQ4Fka.jpg)、[圖20](https://i.imgur.com/a74UnCW.jpg)、[圖21](https://i.imgur.com/SRoxWjS.jpg)<br/>[圖22](https://i.imgur.com/sq5Xsvg.jpg) | [圖11](https://i.imgur.com/0IXVxBh.jpg)、[圖12](https://i.imgur.com/ZLhFldZ.jpg)、[圖13](https://i.imgur.com/jwjxXTv.jpg) | [圖14](https://i.imgur.com/FGYcjcR.jpg)、[圖15](https://i.imgur.com/TMQGWMr.jpg)、[圖16](https://i.imgur.com/0aUihct.jpg) | [圖17](https://i.imgur.com/FecDTDd.jpg) | [圖18](https://i.imgur.com/3RDUKFx.jpg)、[圖19](https://i.imgur.com/Jn4nRsl.jpg)
[DL Raid](#DL-Raid) | [圖1](https://i.imgur.com/N0ZkK6p.jpg)、[圖2](https://i.imgur.com/FYwANMu.jpg)、[圖3](https://i.imgur.com/wopdueG.jpg)<br/>[圖4](https://i.imgur.com/Ign8UrZ.jpg)、[圖5](https://i.imgur.com/Lf0lIHw.jpg)、[圖6](https://i.imgur.com/kFyCGVF.jpg)<br/>[圖7](https://i.imgur.com/3ZQ4Fka.jpg)、[圖8](https://i.imgur.com/Moczq9t.jpg)、[圖9](https://i.imgur.com/uJrSqCA.jpg)<br/>[圖10](https://i.imgur.com/hVbDrJz.jpg) | [圖11](https://i.imgur.com/0IXVxBh.jpg)、[圖12](https://i.imgur.com/ZLhFldZ.jpg)、[圖13](https://i.imgur.com/jwjxXTv.jpg) | [圖14](https://i.imgur.com/FGYcjcR.jpg)、[圖15](https://i.imgur.com/TMQGWMr.jpg)、[圖16](https://i.imgur.com/0aUihct.jpg) | [圖17](https://i.imgur.com/FecDTDd.jpg) | [圖18](https://i.imgur.com/3RDUKFx.jpg)、[圖19](https://i.imgur.com/Jn4nRsl.jpg)

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
#12|斷線處理|<img src="https://i.imgur.com/ZLhFldZ.jpg" width="50"/>|無法重試的連線失敗畫面
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
#23|滅團處理|<img src="https://i.imgur.com/Z2ikp1W.jpg" width="50"/>|滅團後房主退房的畫面

圖片提取要點
- [圖12](https://i.imgur.com/ZLhFldZ.jpg): 比較難抓到，通常是腳本卡住以後截圖才有機會獲得。開戰前讀取中出現/進入隨機房前出現的截圖都可以做為[圖12](https://i.imgur.com/ZLhFldZ.jpg)。
- [圖13](https://i.imgur.com/jwjxXTv.jpg): 連線開戰前將網路切斷即可。
- [圖14](https://i.imgur.com/FGYcjcR.jpg): 必須顯示"羽毛不足"，否則圖片無法使用ˇ。
- [圖17](https://i.imgur.com/FecDTDd.jpg): 找一位朋友協助開房，進房後請朋友關房。
- [圖18](https://i.imgur.com/3RDUKFx.jpg)、[圖19](https://i.imgur.com/Jn4nRsl.jpg): 用很爛的隊伍到要求高的關卡自殺。

> 因為在範本自訂檔案中提到圖片會使用截圖序號，推薦開著本頁操作以隨時對應。

以下範例將假設手機型號為 **DL** ，要組建的腳本為 [DL Raid](#DL-Raid) 。範例中所看到的 **DL** 或是 [DL Raid](#DL-Raid) 都可以更換為自己所要組建的手機型號、腳本。

#### 操作步驟

1. 創建 `Specific/DL` 資料夾。

2. 複製 `Specific/~Template~/DLRaid` (整個資料夾)至 `Specific/DL/DLRaid` 。

3. 開啟 `.../DLRaid` 內的所有檔案，根據檔案內的指示修改值。
    > `Location(X, Y)`: 代表一個座標點。參數名稱代表其意義。<br/>
    > `Region(X, Y, W, H)`: 代表一個區域。X、Y分別代表區域左上角的座標，W、H則是區域的寬、高。設定圖片搜索用區域座標時建議 **朝各方向拉大3畫素** 。

    1. 圖片通常因為畫素不同導致位置不同，必須重新抓取。
    2. 若非必須圖片暫時無法取得，請至少讓圖片存在，否則腳本找不到圖片將會無法運行。可以使用預設所提供的圖片或其他圖片暫時代替。座標可以先不更動。
    3. 若因為特殊需求，需要針對腳本單獨設定值，可以根據檔案最上方的 `Inherit General/Specifc` 後方的路徑往回找。找到對應的變數名稱後，再於腳本專屬的檔案中覆寫。
        > `Specific/Galaxy S9+/DLContinue/Script/Coordinates.lua` (專屬於 `DLContinue` 的檔案) 中的第3行就是覆寫 `Specific/Galaxy S9+/Common/Coordinates.lua` (經過 `Specific/Galaxy S9+/Common/Coordinates+Advanced.lua` 導入)中的第8行。

4. 開啟 `.../DLRaid/script/Configs.lua` ，根據需求調整(覆寫)設定。裡面會是目前所有設定的預設值，如果認為不需要更動，直接刪除該設定(該行)即可。
    - 設定時可以參照檔案內的指引或是[這個表格](#設定)。

5. 檔案內的中文註解可以自行決定刪除與否，不會影響腳本的運行。唯擁有 `Inherit...`字樣的註解不可刪除。
       
6. 執行 `BuildLua.py`。
    
    - 請確認 `BuildLua.json` 內的設定值如下
        
        - `PhoneModel` - 手機型號: DL
        - `Script` - 組建對象腳本: DLRaid
        
7. 複製 `BuildLua-output/DLRaid` 的內容至手機上。

8. 運行腳本。

備註

- 修改腳本時，建議由 `Specific/DL` 內修改。

- 如果有修改腳本，則必須重新從第六步(執行.bat檔)開始。以避免發生問題。

#### 運行順序

腳本運行順序如下。如果腳本沒有按照下列順序運行並運行時發生錯誤，則必須 [除錯](#除錯)。

目前的運行狀態可在下方訊息中看到。
> 如果沒有看到下方訊息出現，請至 [設定](#設定) 檢查下方訊息是否以啟用。(啟用下方訊息 - `ToastEnable` 必須為 `true`)

- [DL](#DL)

    - 照順序排列
    
        運行狀態|敘述
        :---:|:---:
        `CommonScreen`|非戰鬥(一般)畫面
        `Ready`|準備畫面
        `Battle`|戰鬥中
        `End`|戰鬥結算
        
    - 未照順序排列
        
        運行狀態|名稱|敘述
        :---:|:---:|:---:
        `Unknown`|不明|腳本起始，或是自行判斷已卡住時，會回到此狀態以重新偵測目前狀態。
        `Dead`|死亡|自己/己方完全滅團的狀態。

- [DL Continue](#DL-Continue)

    - 照順序排列
    
        運行狀態|敘述
        :---:|:---:
        `CommonScreen`|非戰鬥(一般)畫面
        `FriendSel`|好友選擇畫面
        `RandRoom`|房間管理畫面
        `FindRoom`|房間尋找中
        `Ready`|準備畫面
        `Loading`|讀取畫面
        `BattleStart`|戰鬥初始動作執行中
        `Battle`|戰鬥中
        `End`|戰鬥結算
        
    - 未照順序排列
        
        運行狀態|名稱|敘述
        :---:|:---:|:---:
        `Unknown`|不明|腳本起始，或是自行判斷已卡住時，會回到此狀態以重新偵測目前狀態。
        `WingsInsuf`|共鬥翼不足|共鬥之翼不足時，會進入此狀態。
        `Dead`|死亡|自己/己方完全滅團的狀態。
      
- [DL Raid](#DL-Raid)

    - 照順序排列
    
        運行狀態|敘述
        :---:|:---:
        `CommonScreen`|非戰鬥(一般)畫面
        `Difficulty`|難易度選擇畫面
        `RoomSelect`|房間管理畫面
        `FindRoom`|房間尋找中
        `Ready`|準備畫面
        `Loading`|讀取畫面
        `BattleStart`|戰鬥初始動作執行中
        `Battle`|戰鬥中
        `End`|戰鬥結算
        
    - 未照順序排列
        
        運行狀態|名稱|敘述
        :---:|:---:|:---:
        `Unknown`|不明|腳本起始，或是自行判斷已卡住時，會回到此狀態以重新偵測目前狀態。
        `WingsInsuf`|共鬥翼不足|共鬥之翼不足時，會進入此狀態。
        `Dead`|死亡|自己/己方完全滅團的狀態。

#### 設定

以下所有設定都可以在 `script/Configs.lua` 內覆寫。
覆寫範例如下:

```lua
m.LogDebug = false
```

對照表

設定|設定項目|預設|單位|敘述
:---:|:---:|:---:|:---:|:---:
`LogDebug`|日誌記錄除錯訊息|`false`|-|開啟這個時，會更詳細的紀錄腳本的運行日誌。
`DimensionWidth`|螢幕寬度|(你的螢幕寬度)|畫素|腳本內部使用。
`ClickCooldownSeconds`|點擊間隔|0.1|秒|每次點擊螢幕的間隔。
`ScriptDefaultExistWaitMs`|圖片偵測間隔|0.05|秒|每次偵測圖片的間隔。
`DifficultyChecks`|難易度檢查次數|3|-|重覆檢查是否在難易度畫面(圖9、圖10)的次數。
`DifficultyCheckWaitSeconds`|難易度檢查間隔|0.7|秒|上述檢查的間隔。
`ReadyValidityPeriodSeconds`|已準備有效時間|5|秒|按下已準備後，腳本就不會在這段時間內重覆檢查是否已準備。
`HostLeftWaitSeconds`|房主退房延遲|5|秒|房主退房並確認對話框以後進行接下來的動作的等待秒數，避免游戲延遲導致誤按。
`MaxLoadingStuckSeconds`|最大讀取中時間|30|秒|腳本處在 `@ Loading` 狀態的最大許可秒數。超過這個秒數以後，腳本就會認定已卡住，重新偵測目前狀態。
`SkillIntervalSecond`|戰鬥中技能間隔|1.5|秒|戰鬥狀態(`@ Battle`)下，點擊技能的間隔。
`PostgameClickCheckWaitSeconds`|結算點擊間隔|0.7|秒|結算狀態(`@ End`)下，點擊所有座標的間隔。
`MaxStateChecksOnUnknown`|最大未知狀態時間|60|秒|腳本處在 `@ Unknown` 狀態的最大許可秒數。超過這個秒數以後，腳本就會自動終止。
`ToastCooldownSeconds`|下方訊息顯示間隔|10|秒|下方訊息顯示的間隔。太常顯示可能導致腳本提早閃退。
`ToastEnable`|啟用下方訊息|`true`|-|是否啟用顯示下方訊息的功能。

#### 除錯

- 除錯時，請注意下方訊息方塊。
    - 預設每10秒出現一次，可以調整[設定](#設定)中的**下方訊息顯示間隔( `ToastEnable` )以查看目前的[運行狀態](#運行順序)。
- 腳本執行時會有橘色框框，可以看看腳本有沒有找到對的區域用。
- 腳本運行狀態順序[請參見此處](#運行順序)。

編號 | 錯誤原因 | 除錯方式
:---:|:---:|:---:
1|點歪|檢查對應的點擊座標( `Location**` )是否正確。
2|狀態(State，下方訊息的後半部)不隨畫面變化|檢查圖片搜索區域( `Region**` )是否正確。
3|亂點|設定錯誤。若狀態有根據畫面變化則按照#1除錯，否則#2。
4|腳本無法運行|嘗試不同的組建方式。詳情請參見[操作步驟](#操作步驟)內的步驟6。

#### 版本更新

更新版本時，請按照下列步驟操作。

1. 將 `Specific` 內，除了原先預設提供的資料夾( `Galaxy S9+` 、 `ROG` )外的所有資料夾及其檔案備份。

2. 下載新腳本。

3. 核對 `Specific` 內 和 備份好的檔案，檢查是否有新項目新增(可以看版本號輔助)。有新項目的話，按照裡面的指示補上。

4. 由[操作步驟](#操作步驟)內的步驟6開始操作。
