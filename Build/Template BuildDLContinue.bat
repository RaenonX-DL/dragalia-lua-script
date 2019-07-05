@ECHO OFF
SET /p PHONE_TYPE="Enter the phone type/folder name of DLContinue: "
robocopy "..\Generic\DLContinue" "DLContinue-%PHONE_TYPE%" /e
robocopy "..\Phone Specific\%PHONE_TYPE%\DLContinue" "DLContinue-%PHONE_TYPE%" /e
PAUSE