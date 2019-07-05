@ECHO OFF
SET /p PHONE_TYPE="Enter the phone type/folder name of DLRaid: "
robocopy "..\Generic\DLRaid" "DLRaid-%PHONE_TYPE%" /e
robocopy "..\Phone Specific\%PHONE_TYPE%\DLRaid" "DLRaid-%PHONE_TYPE%" /e
PAUSE