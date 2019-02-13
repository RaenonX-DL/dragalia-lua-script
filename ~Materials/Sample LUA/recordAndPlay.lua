version = "1.2.1"

function stringsZH()
    enderrorString = "錯誤"
    warningString = "警告"
    settingsString = "設定"

    immersiveString = "浸潤模式(沒有海苔條請勾選)"
    saveFileNameString = "儲存錄製點擊到檔案: "

    fileExistsString = "檔案已存在，要覆蓋嗎?"
    overWriteOriginalString = "覆蓋原檔: "
    overWriteNewString = "覆蓋新檔: "
    storeNewString = "儲存到新檔: "

    stopLocationString = "停止錄製區域\n (按此紅色區域可以停止錄製): "
    upperLeftString = "左上角"
    upperRightString = "右上角"
    lowerLeftString = "左下角"
    lowerRightString = "右下角"

    stopRecordString = "停止錄製"

    scriptToPlayString = "選擇要回放的檔案: "
    timesString = "回放次數: "
    gapString = "回放間隔幾秒: "
    contentString = "回放內容"

    modifiedString = "內容已更動"

    chooseActionString ="選擇要做的事"
    recordString = "錄製"
    playString = "回放"

    notExistString =" 檔案不存在"
    fileCreateFailString = " 檔案創建失敗"

    cutoutString = "有瀏海且瀏海在上方\n(將偵測瀏海高度並做補償)"

end
function stringsEN()
    errorString = "Error"
    warningString = "Warning"
    settingsString = "Settings"

    immersiveString = "Immersive mode"
    saveFileNameString = "Save recording to file: "

    fileExistsString = "File exists. Overwrite?"
    overWriteOriginalString = "Overwrite original file: "
    overWriteNewString = "Overwrite new file: "
    storeNewString = "Store to new file: "

    stopLocationString = "Stop recording area\n (click this red area to stop): "
    upperLeftString = "Upper left"
    upperRightString = "Upper right"
    lowerLeftString = "Lower left"
    lowerRightString = "Lower Right"

    stopRecordString = "Stop recoring"

    scriptToPlayString = "The file to playbak: "
    timesString = "Replay times: "
    gapString = "Gap (second) between replay: "
    contentString = "Plackback Content"

    modifiedString = "Content modified"

    chooseActionString ="Choose what to do"
    recordString = "Record"
    playString = "Playback"

    notExistString =" file doesn't exist."
    fileCreateFailString = " file creation fails."

    cutoutString = "with cutout and cutout on device top \n(Will detect cutout height and compensate)"

end

function cutoutHeightMeasure(startY)
    local width = getRealScreenSize():getX()
    local height = getRealScreenSize():getY()

    local testHeight = math.floor(height / 8)
    setHighlightStyle(0xff567890, true)
    local reg = Region(0, startY, width / 4, testHeight)
    reg:highlight()
    wait(0.5)
    snapshotColor()
    reg:highlightOff()
    local maxY = 0
    local found = false
    for y = math.floor(testHeight/2) + startY, startY + testHeight * 2 do
        local r, g, b = getColor(Location(10, y))
        --        print (string.format("y = %d, r = %x, g = %x, b = %x", y, r, g, b))
        if (found and (r ~= 0x56 or g ~= 0x78 or b ~= 0x90)) then
            maxY = y - 1
            break
        end
        if (r == 0x56 and g == 0x78 and b == 0x90) then
            found = true
        end
    end

    usePreviousSnap(false)
    setHighlightStyle(0xffff0000, false)
    local cHeight = maxY - testHeight - startY
    if (cHeight < 10) then cHeight = 0 end
    return (cHeight)
end

function loadStringsFunction()
    local language = getLanguage()
    if (language == "zh") then
        stringsZH()
    else
        stringsEN()
    end
end

function fileExists(name)
    local fName = localPath .. "luar/" .. name .. ".luar"
    local f=io.open(fName,"r")
    if f~=nil then io.close(f) return true else return false end
end

function fileCheck(name, text)
    overwrite = 0
    removePreference("overwriteFileName")
    local fName = string.gsub(name, ".luar$", "")
    name = fName
    fileName = preferenceGetString("fileName", "")

    while (overwrite == 0 and fileExists(fName)) do
        dialogInit()
        addTextView(text)
        newRow()
        addRadioGroup("overwrite", 0)
        addRadioButton(overWriteOriginalString .. name .. ".luar", 1)
        if (fName ~= "") then
            addRadioButton(overWriteNewString .. fileName .. ".luar", 2)
        end

        addRadioButton(storeNewString, 0)
        newRow()
        addEditText("fileName", "touch2")
        addTextView(".luar")
        dialogShowFullScreen(text)

--        if (overwrite == 1) then
--            fName = overwriteFileName
--        else
            fName = fileName
--        end
    end
    return localPath .. "luar/" .. fName .. ".luar"
end

function locationInRegion(loc, reg)
    local l = loc
    local x = l:getX()
    local y = l:getY()
    return (x > reg:getX() and x < (reg:getX() + reg:getW()) and
            y > reg:getY() and y < (reg:getY() + reg:getH()))
end

function locationToString(loc)
    return(string.format("Location(%d, %d)", loc:getX(), loc:getY()))
end

function fileHeader(fPointer)
    fPointer:write("----- created by AnkuLua record script ------\n")
    fPointer:write("immersive = " .. tostring(immersive) .. "\n")
    fPointer:write("setImmersiveMode(immersive)\n")
    fPointer:write("scriptDimension = " .. scriptDimension .. "\n")
    fPointer:write("Settings:setScriptDimension(true, scriptDimension)\n")
    fPointer:write("local index = 1\n")
    fPointer:write("touchList = {}\n")
    fPointer:write("waitList = {}\n")
    fPointer:write("\n")
end

function record()
    dialogInit()
    addCheckBox("immersive", immersiveString, false)
    newRow()
    newRow()

    addTextView(saveFileNameString)
    newRow()
    addEditText("fileName", "touch1")
    addTextView(".luar")
    newRow()
    newRow()
    addTextView(stopLocationString)
    local areaItems = {upperLeftString, upperRightString, lowerLeftString, lowerRightString }
    addSpinnerIndex("stopIndex", areaItems, areaItems[3])
    newRow()
    newRow()
    dialogShowFullScreen(settingsString)

    setImmersiveMode(immersive)
    if (immersive) then
        scriptDimension = getRealScreenSize():getX()
    else
        scriptDimension = getAppUsableScreenSize():getX()
    end
    Settings:setScriptDimension(true, scriptDimension)

    os.execute("mkdir " .. localPath .. "luar")

    fileName = fileCheck(fileName, fileExistsString)

    local width = getRealScreenSize():getX()
    local height = getRealScreenSize():getY()
    local stopWidth = width / 8
    local stopHeight = height / 8
    if (stopIndex == 1) then
        stopArea = Region(0, 0, stopWidth, stopHeight)
    elseif (stopIndex == 2) then
        stopArea = Region(width - stopWidth, 0, stopWidth, stopHeight)
    elseif (stopIndex == 3) then
        stopArea = Region(0, height - stopHeight, stopWidth, stopHeight)
    else
        stopArea = Region(width - stopWidth, height - stopHeight, stopWidth, stopHeight)
    end
    setHighlightStyle(0x80ff0000, true)
    setHighlightTextStyle(0x80ff0000, 0x80ffffff, 16)
    stopArea:highlight("Stop!")

    local fPointer = io.open(fileName, "w")
    if (not fileName) then
       scriptExit(fileName .. fileCreateFailString)
    end
    fileHeader(fPointer)


    local timer = Timer()
    local waitTime, text
    local index = 0
    while(true) do
        local action, locTable, touchTable = getTouchEvent()
        if (index ~= 0) then
            fPointer:write("------ " .. index .. " -----\n")
            fPointer:write(text .. "\n")
            print(index .. ": " .. text)
            waitTime = timer:check()
            fPointer:write(string.format("waitList[index] = %f\n", waitTime))
            fPointer:write("index = index + 1\n\n")
        end

        if (action == "click" or action == "longClick") then
            locTable = locTable:offset(0, cutoutHeightEvent)
            if (locationInRegion(locTable, stopArea)) then
                io.close(fPointer)
                scriptExit(stopRecordString)
            end
            _G[action](locTable)
            text = string.format('touchList[index] = {"%s", %s}', action, locationToString(locTable))
        end

        if (action == "swipe" or action == "dragDrop") then
            locTable[1] = locTable[1]:offset(0, cutoutHeightEvent)
            locTable[2] = locTable[2]:offset(0, cutoutHeightEvent)
            _G[action](locTable[1], locTable[2])
            text = string.format('touchList[index] = {"%s", %s, %s}', action,
                locationToString(locTable[1]), locationToString(locTable[2]))
        end

        timer:set()
        index = index + 1

    end

end

------------------ playback related functions -------------------

function scandir(directory)

    local command = "ls " .. directory .. " > /sdcard/__list"
    os.execute(command)

    local lines = {}
    local i = 1
    for line in io.lines("/sdcard/__list") do
        lines[#lines + 1] = line
    end

    return lines
end


function playback()

    local fileList = scandir(luarPath ..  "*.luar")
    dialogInit()
    addTextView(timesString)
    addEditNumber("times", 5)
    newRow()

    addTextView(gapString)
    addEditNumber("gap", 0.5)
    newRow()

    addTextView(scriptToPlayString)
    newRow()
    addRadioGroup("fileNum", 1)
    for i, f in ipairs(fileList) do
        local subString = localPath .. "luar/"
        local shortName = string.gsub(f, luarPath, "")
        addRadioButton(shortName, i)
        fileList[i] = shortName
    end
    newRow()
    dialogShowFullScreen(settingsString)

    fileName = fileList[fileNum]
    dofile (luarPath .. fileName)

    local totalAction = {"click", "longClick", "doubleClick", "continueClick", "swipe", "dragDrop" }
    local singleAction = {"click", "longClick", "doubleClick", "continueClick"}
    local twoAction = {"swipe", "dragDrop" }
    local screenWidth = getRealScreenSize():getX()
    dialogInit()
    for i, t in ipairs(touchList) do
        addTextView("    "..i..": ")
        local enableCheck = "enable" .. i
        removePreference(enableCheck)
        addCheckBox(enableCheck, " ", true)
        local actionVar = "action" .. i

        local actionFound = false
        for i, a in ipairs(totalAction) do
            local match = string.match(t[1], a)
            if (match) then t[1] = match; actionFound = true; break end
            --            if (a == action) then actionFound = true; break end
        end
        if (not actionFound) then scriptExit("touchList[" .. i .. "]: " .. touchList[i][1] .. " not supported") end

        local action = t[1]


        removePreference(actionVar)
        if (action == "swipe" or action == "dragDrop") then
            addSpinner(actionVar, totalAction, t[1])
        else
            addSpinner(actionVar, singleAction, t[1])
        end
        addTextView(t[2]:toString())
        if (action == "swipe" or action == "dragDrop") then
            addTextView("->" .. t[3]:toString())
        end
        if (screenWidth < 1000) then
            newRow()
            addTextView("        ")
        end
        addTextView(" wait: ")
        local waitVar = "wait" .. i
        removePreference(waitVar)
        local waitTime
        if (not waitList[i]) then waitList[i] = 0.0 end
        addEditNumber(waitVar, waitList[i])

        newRow()

    end
    dialogShowFullScreen(contentString)

    local modified = false
    for i, t in ipairs(touchList) do
        local actionVar = "action" .. i
        local waitVar = "wait" .. i
        local enableCheck = "enable" .. i
        if (not _G[enableCheck] or _G[actionVar] ~= t[1] or _G[waitVar] ~= waitList[i]) then
            modified = true
            break
        end
        t[1] = _G[actionVar]
        waitList[i] = _G[waitVar]
    end

    local newTouchList = {}
    if (modified) then
        local touchNum = #touchList
        local newFile = fileCheck(fileName, modifiedString)
        local fPointer = io.open(newFile, "w")
        fileHeader(fPointer)

        local index = 1
        for i, t in ipairs(touchList) do
            local enableCheck = "enable" .. i

            if (_G[enableCheck]) then
                local action = _G["action" .. i]
                local text
                local waitTime = _G["wait" .. i]

                if (action == "swipe" or action == "dragDrop") then
                    text = string.format('touchList[index] = {"%s", %s, %s}\n', action,
                        locationToString(t[2]), locationToString(t[2]))
                    fPointer:write(text)
                    newTouchList[index] = {action, t[2], t[3]}
                else
                    text = string.format('touchList[index] = {"%s", %s}\n', action, locationToString(t[2]))
                    fPointer:write(text)
                    newTouchList[index] = {action, t[2]}
                end
                fPointer:write(string.format("waitList[index] = %f\n", waitTime))
                index = index + 1

                fPointer:write("index = index + 1\n\n")
            end
        end
        io.close(fPointer)
    end

    if (modified) then
        touchList = newTouchList
    end

    local timer = Timer()
    for i = 1, times do
        for j, t in ipairs(touchList) do

                if (t[1] == "swipe" or t[1] == "dragDrop") then
                    _G[t[1]](t[2], t[3])
                elseif (t[1] == "continueClick") then
                    continueClick(t[2], 100)
                else
                    _G[t[1]](t[2])
                end
                if (i ~= times or j ~= #touchList) then
                    wait(waitList[j])
                end
--            end
        end
        if (i ~= times) then
            wait(gap)
        end
    end

end


localPath = scriptPath()
luarPath = localPath .. "luar/"
loadStringsFunction()

print ("Version: " .. version)

local width = getRealScreenSize():getX()
local height = getRealScreenSize():getY()
cutoutHeight = 0
detectCutout = false

dialogInit()
if (width  < height) then
    addCheckBox("detectCutout", cutoutString, false)
    newRow()
    addSeparator()
end

addTextView(chooseActionString)
newRow()
addRadioGroup("actionSelect", 1)
addRadioButton(recordString, 1)
addRadioButton(playString, 2)
dialogShowFullScreen(settingsString)

cutoutHeightEvent = 0
if (detectCutout) then
    cutoutHeightEvent = cutoutHeightMeasure(0)
    print("cutout height = " .. cutoutHeightEvent)
    cutoutHeight = cutoutHeightMeasure(cutoutHeightEvent * 2)
    print("cutut highlight offset = " .. cutoutHeight)

end


if (actionSelect == 1) then
    record()
else
    playback()
end