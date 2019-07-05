此腳本系列為 -失落的龍絆- 共鬥刷關用腳本，必須安裝 AnkuLua 才可以使用。
----
# DL
這個腳本只會在**開始選擇房間(畫面出現檢索中)**到**點掉所有對話框回到任務頁面**之間執行。完成這系列動作以後腳本就會自動停止。

### 目前可運行手機
- 三星Galaxy S9+ (WQHD) - 腳本位於`Galaxy S9+/DL`
----
# DL Continue
這是[DL](#DL)的延伸版本。相較於[DL](#DL)，這個腳本會不停刷關，直到使用者停止。

### 目前可運行手機
- 三星Galaxy S9+ (WQHD) - 腳本位於`Galaxy S9+/DLContinue`
----
# DL Raid
這個腳本會不停刷Raid活動。針對活動所需要的動作不同，有可能會有戰鬥開始前置動作。

#### 目前戰鬥開始前置動作對應的任務
> [新春日下招福來運](https://dragalialost.com/cht/news/detail/552)

### 目前可運行手機
#### 這個腳本需要組建。到[releases](/releases)的assets裡面下載此程式庫的壓縮檔(通常.zip)後，執行`Build/BuildDLRaid-%YOUR_PHONE_TYPE%.bat`。其中%YOUR_PHONE_TYPE%為要組建的手機型號，目前有支援的手機型號如下列。
> 組建也可以不透過批次檔(*.bat)執行。只要複製`Generic/DLRaid`和`Phone Specific\%YOUR_PHONE_TYPE%\DLRaid`內的所有內容到同一目錄即可。

- 三星Galaxy S9+ (WQHD) - 腳本位於`Galaxy S9+/DLContinue`
- 華碩ROG Phone

##### 註記
- 啟動腳本時，請記得**將播放按鈕放在右中偏上的地方(螢幕切為九宮格後6的位置)**，以避免圖片判斷干擾。
- 虛擬按鍵必須開啟。
- 螢幕高(Y)/寬(X)比若符合下列任一者，則對應的長寬比的手機型號所用的腳本**可能**可以運行。**可能**的原因是因為各牌手機的虛擬按鍵和通知列高度不一定相同，這會造成按鈕位置偏差。若無法運行，請參見下方[自訂指引](#自訂指引)。
  - 高(Y)/寬(X)比: 296/144 (2.055556), 使用`Galaxy S9+`的組建
  - 高(Y)/寬(X)比: 216/108 (2), 使用`ROG Phone`的組建

### 自訂指引
事前準備:
- **可以讓你做下列事情的繪圖軟體。** 我用的是[Paint.NET](https://www.getpaint.net/)。
    - 查詢目前游標座標
    - 擷取區域圖塊並複製貼上生成新圖片
    - 查詢選取區域的左上角座標以及獲得該區域的寬高
    - 重疊兩張圖片，兩張圖片都可以同時看見
- **文字編輯軟體。** 我用的是[NotePad++](https://notepad-plus-plus.org/)，因為這款軟體可以Highlight部分lua的關鍵字，而且打字排版相對快，又不需要像一般IDE一樣有繁重的前置讀取。
- **座標輸入用截圖。**
    - 必須 - 任務循環輪轉必要，可簡單取得
        - [圖1](https://i.imgur.com/N0ZkK6p.jpg) - 找不到房間時彈出再檢索對話框。
        - [圖2](https://i.imgur.com/FYwANMu.jpg) - 房間檢索中
        - [圖3](https://i.imgur.com/wopdueG.jpg) - 檢索前畫面。有隨機入房、開設條件房...等按鈕。
        - [圖4](https://i.imgur.com/Ign8UrZ.jpg) - 角色生存的戰鬥中畫面。
        - [圖5](https://i.imgur.com/Lf0lIHw.jpg) - 進房後尚未準備的畫面。
        - [圖6](https://i.imgur.com/kFyCGVF.jpg) - 戰鬥完成後第一個出現的結算畫面。
        - [圖7](https://i.imgur.com/3ZQ4Fka.jpg) - 戰鬥完成後第一個出現的結算畫面，其中有因為出現EX而彈出的對話框
        - [圖8](https://i.imgur.com/Moczq9t.jpg) - 任務選擇頁面。有可以選擇HELL、RAID戰、BOSS戰...等按鈕的頁面。
        - [圖9](https://i.imgur.com/uJrSqCA.jpg) - RAID戰EX開啟後，點擊[圖8](https://i.imgur.com/Moczq9t.jpg)中的RAID戰EX級按鈕會出現的畫面。
        - [圖10](https://i.imgur.com/hVbDrJz.jpg) - RAID戰EX未開啟時，點擊[圖8](https://i.imgur.com/Moczq9t.jpg)中的RAID戰按鈕會出現的畫面。
        - [圖11](https://i.imgur.com/0IXVxBh.jpg) - 開戰前的讀取中畫面
    - 第一優先 - 斷線處理，可於腳本卡住時截圖/開戰前讀取過程中刻意斷線
        - [圖12](https://i.imgur.com/ZLhFldZ.jpg) - 無法重試的連線失敗畫面。
            - 這個通常要截到需要靠點運氣，腳本運行卡住後有可能會卡在這個畫面。
            - 開戰前出現的，或是入房時所出現的圖都可以做為圖12，兩者對話框位置相同。
        - [圖13](https://i.imgur.com/jwjxXTv.jpg) - 可重試的連線失敗畫面。
            - 這個可以藉由讀取過程中直接斷網獲得。
    - 第二優先 - 自動補毛 - 必須打到沒有毛，下方有顯示"不足"字樣的圖片才可用。
        - [圖13](https://i.imgur.com/FGYcjcR.jpg) - 要開始關卡前，遊戲顯示毛不足，必須選擇使用龍鑽、彩鑽、骨灰三者其一補毛的畫面。
        - [圖14](https://i.imgur.com/TMQGWMr.jpg) - 補毛確認對話框(有確認補毛、取消兩個按鈕)
        - [圖15](https://i.imgur.com/0aUihct.jpg) - 已補毛提示對話框(只有關閉按鈕)
    - 第三優先 - 房主退房 - 可以找一個人開房後自己進房再請對方關房獲取。
        -  [圖16](https://i.imgur.com/FecDTDd.jpg) - "房主已退房"對話框。
    - 第四優先 - 死亡處理，可以帶一隊很弱的隊伍到很強的關卡(例: HELL)送死獲取
        - [圖17](https://i.imgur.com/3RDUKFx.jpg) - 死亡時第一個出現的畫面，選擇鑽石種類復活或放棄
        - [圖18](https://i.imgur.com/Jn4nRsl.jpg) - 已選定鑽石種類，等待確認復活的畫面。

> 因為在範本自訂檔案中提到圖片會使用截圖序號，推薦開著本頁操作以隨時對應。

1. 於`Phone Specific`創建一個資料夾，任意命名(推薦命名為自己的手機型號，此處以**DL**示範。任何出現DL的地方都代表手機型號。)
2. 複製`Phone Specific/~Template~/DLRaid`(整個資料夾)至`Phone Specific/DL/DLRaid`。
3. 開啟`.../DLRaid/script/Customize.lua`，根據裡面的指示操作。
    > `Location(X, Y)`: 代表一個座標點。參數名稱代表其意義。
    > `Region(X, Y, W, H)`: 代表一個區域。X、Y分別代表區域左上角的座標，W、H則是區域的寬、高。設定圖片搜索用區域座標時建議**朝各方向拉大3畫素**。
    
    1. 圖片通常因為畫素不同導致位置不同，必須重新抓取。
    2. 若非必須圖片暫時無法取得，請至少讓圖片存在，否則腳本找不到圖片將會無法運行。可以使用預設所提供的圖片或其他圖片暫時代替。座標可以先不更動。
4. 開啟`.../DLRaid/script/Configs.lua`，根據需求調整(覆寫)設定。裡面會是目前所有設定的預設值，如果認為不需要更動，直接刪除該設定(該行)即可。
5. 執行'Build/BuildDLRaid-Template.bat`，輸入**DL**(手機型號)。
6. 批次檔將會生成一個資料夾**DLRaid-DL**，將整個資料夾或裡面的檔案剪下/複製到手機上運行。
