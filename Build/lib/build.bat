@ECHO OFF

:: Fetch PHONE_MODEL
SET "PHONE_MODEL=%~1"
GOTO :PhoneModelCheck
:PhoneModelPrompt
SET /P "PHONE_MODEL=Enter phone model: "
:PhoneModelCheck
IF "%PHONE_MODEL%"=="" GOTO :PhoneModelPrompt

:: Fetch SCRIPT_NAME    
SET "SCRIPT_NAME=%~2"
GOTO :ScriptNameCheck
:ScriptNamePrompt
SET /P "SCRIPT_NAME=Enter script name: "
:ScriptNameCheck
if "%SCRIPT_NAME%"=="" GOTO :ScriptNamePrompt

:: Merge files to build
SET "OUTPUT_DIR=%SCRIPT_NAME%-%PHONE_MODEL%"

robocopy "..\Generic\%SCRIPT_NAME%" "%OUTPUT_DIR%" /e
robocopy "..\Phone Specific\%PHONE_MODEL%\%SCRIPT_NAME%" "%OUTPUT_DIR%" /e

FOR /f "tokens=2 delims==" %%a IN ('wmic OS Get localdatetime /value') DO SET "dt=%%a"
SET "YYYY=%dt:~0,4%" & SET "MM=%dt:~4,2%" & SET "DD=%dt:~6,2%"
SET "HH=%dt:~8,2%" & SET "Min=%dt:~10,2%" & SET "Sec=%dt:~12,2%"

COPY NUL "%OUTPUT_DIR%/%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"