@echo off
chcp 65001 >nul 2>&1

REM 檢查 64 位系統路徑
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0

REM 確認是否有管理員權限
bcdedit >nul
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else (
    goto UACAdmin
)
:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit /B
:UACAdmin
cd /d "%~dp0"

REM 設定語言變數
setlocal enabledelayedexpansion
REM 預設語言為繁體中文
set Lang=TraditionalChinese

REM 根據系統語言設置 Lang 變數
if /I "%SystemLanguage%"=="zh-TW" (
    set Lang=TraditionalChinese
) else if /I "%SystemLanguage%"=="zh-CN" (
    set Lang=SimplifiedChinese
) else if /I "%SystemLanguage%"=="en-US" (
    set Lang=English
)

REM 根據語言選擇顯示訊息
if "%Lang%"=="TraditionalChinese" (
    echo 當前語言是繁體中文。
) else if "%Lang%"=="SimplifiedChinese" (
    echo 当前语言是简体中文。
) else (
    echo The current language is English.
)
timeout /t 2 >nul

REM 顯示退出提示並等待用戶輸入
REM echo.
REM if "%Lang%"=="TraditionalChinese" (
REM     echo.請按任意鍵退出。
REM ) else if "%Lang%"=="SimplifiedChinese" (
REM     echo.请按任意键退出。
REM ) else (
REM     echo.Press any key to exit.
REM )
REM pause >nul

REM 檢查是否在 CS2Konc_CFG 資料夾中
for %%I in (.) do set CurrDirName=%%~nxI
if /I not "%CurrDirName%"=="CS2Konc_CFG" (
    cls
    color 0C
    if "%Lang%"=="TraditionalChinese" (
        echo 請把此檔案放進 CS2Konc_CFG 資料夾中!!!
        echo 請把此檔案放進 CS2Konc_CFG 資料夾中!!!
        echo 請把此檔案放進 CS2Konc_CFG 資料夾中!!!
        echo 請確保此檔案在 *\Counter-Strike Global Offensive\game\csgo\cfg\CS2Konc_CFG 目錄當中
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo 请把此文件放进 CS2Konc_CFG 文件夹中!!!
        echo 请把此文件放进 CS2Konc_CFG 文件夹中!!!
        echo 请把此文件放进 CS2Konc_CFG 文件夹中!!!
        echo 请确保此文件在 *\Counter-Strike Global Offensive\game\csgo\cfg\CS2Konc_CFG 目录中
    ) else (
        echo Please place this file in the CS2Konc_CFG folder!!!
        echo Please place this file in the CS2Konc_CFG folder!!!
        echo Please place this file in the CS2Konc_CFG folder!!!
        echo Please ensure this file is located in *\Counter-Strike Global Offensive\game\csgo\cfg\CS2Konc_CFG folder.
    )
    echo.
    if "%Lang%"=="TraditionalChinese" (
        echo.請按任意鍵退出。
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo.请按任意键退出。
    ) else (
        echo. Press any key to exit.
    )
    pause >nul
    exit /b
)

cls
color 0A
call powershell.exe -ExecutionPolicy Bypass -File ".\install\CS2Konc_CFG_Uninstall_Resource.ps1"
