@ECHO OFF
SET /p PHONE_TYPE="Enter the phone type/folder name of DL: "
robocopy "..\Generic\DL" "DL-%PHONE_TYPE%" /e
robocopy "..\Phone Specific\%PHONE_TYPE%\DL" "DL-%PHONE_TYPE%" /e
PAUSE