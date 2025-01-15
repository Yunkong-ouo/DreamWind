@echo off
chcp 65001 >nul 2>&1
color 0a
mode con: cols=80 lines=25
setlocal enabledelayedexpansion

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

REM 取得系統語言設置（從註冊表中獲取）
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\International" /v LocaleName') do set SystemLanguage=%%a

REM 根據系統語言設置 Lang 變數
set Lang=TraditionalChinese
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
timeout /t 1 >nul

echo.

REM 檢查是否在 CS2Konc_CFG 資料夾中
for %%I in (.) do set CurrDirName=%%~nxI
if /I not "%CurrDirName%"=="CS2Konc_CFG" (
    cls
    color 0C
    if "%Lang%"=="TraditionalChinese" (
        echo 請把此資料夾放進 CS2Konc_CFG 資料夾中!!!
        echo 請把此資料夾放進 CS2Konc_CFG 資料夾中!!!
        echo 請把此資料夾放進 CS2Konc_CFG 資料夾中!!!
        echo 請確保此資料夾在 *\Counter-Strike Global Offensive\game\csgo\cfg\CS2Konc_CFG 目錄當中
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo 请把此文件夹放进 CS2Konc_CFG 文件夹中!!!
        echo 请把此文件夹放进 CS2Konc_CFG 文件夹中!!!
        echo 请把此文件夹放进 CS2Konc_CFG 文件夹中!!!
        echo 请确保此文件夹在 *\Counter-Strike Global Offensive\game\csgo\cfg\CS2Konc_CFG 目录當中
    ) else (
        echo Please place this folder into the CS2Konc_CFG folder!!!
        echo Please place this folder into the CS2Konc_CFG folder!!!
        echo Please place this folder into the CS2Konc_CFG folder!!!
        echo Please make sure this folder is in the *\Counter-Strike Global Offensive\game\csgo\cfg\CS2Konc_CFG directory.
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

REM 檢測 CS2Konc_CFG 放置位置
cd /d %~dp0
cd ../../
set "EXPECTED_FOLDER_NAME=csgo"
for %%F in (.) do set "CURRENT_FOLDER_NAME=%%~nxF"
if "%Lang%"=="TraditionalChinese" (
    echo 當前資料夾名稱: %CURRENT_FOLDER_NAME%
    echo 預期資料夾名稱: %EXPECTED_FOLDER_NAME%
) else if "%Lang%"=="SimplifiedChinese" (
    echo 当前文件夹名称: %CURRENT_FOLDER_NAME%
    echo 预期文件夹名称: %EXPECTED_FOLDER_NAME%
) else (
    echo Current folder name: %CURRENT_FOLDER_NAME%
    echo Expected folder name: %EXPECTED_FOLDER_NAME%
)
if /I "%CURRENT_FOLDER_NAME%" neq "%EXPECTED_FOLDER_NAME%" (
    cls
    color 0C
    if "%Lang%"=="TraditionalChinese" (
        echo 您的 CS2Konc_CFG 放置位置錯誤!!!，請重看使用說明
        echo 您的 CS2Konc_CFG 放置位置錯誤!!!，請重看使用說明
        echo 您的 CS2Konc_CFG 放置位置錯誤!!!，請重看使用說明
        echo 請確保此資料夾放在 *\Counter-Strike Global Offensive\game\csgo\cfg 目錄當中
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo 您的 CS2Konc_CFG 放置位置错误!!!，请重看使用说明
        echo 您的 CS2Konc_CFG 放置位置错误!!!，请重看使用说明
        echo 您的 CS2Konc_CFG 放置位置错误!!!，请重看使用说明
        echo 请确保此文件夹放在 *\Counter-Strike Global Offensive\game\csgo\cfg 目录当中
    ) else (
        echo Your CS2Konc_CFG placement is incorrect!!! Please refer to the instructions again.
        echo Your CS2Konc_CFG placement is incorrect!!! Please refer to the instructions again.
        echo Your CS2Konc_CFG placement is incorrect!!! Please refer to the instructions again.
        echo Please make sure this folder is placed in the *\Counter-Strike Global Offensive\game\csgo\cfg directory.
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

echo.

REM 解除安裝操作
if "%Lang%"=="TraditionalChinese" (
    echo 正在解除安裝...
) else if "%Lang%"=="SimplifiedChinese" (
    echo 正在卸载...
) else (
    echo Uninstalling...
)

REM 設置資源目錄路徑
set "RESOURCE_DIR=%~dp0..\..\resource"

REM 刪除資料夾內的所有文件，但保留 game-icon.bmp
for /r "%RESOURCE_DIR%" %%F in (*) do (
    if /i not "%%~nxF"=="game-icon.bmp" (
        del /f /q "%%F"
    )
)

cd "%~dp0.."

REM 設置要檢查的行
set "EXEC_COMMAND=CS2Konc_CFG/CSKoncMod"
set "AUTOEXEC_FILE=autoexec.cfg"

REM 設置要新增的內容，將所有命令合併為一行
set "ADDITIONAL_CONTENT=joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt"

REM 檢查 autoexec.cfg 文件是否存在
if not exist "%AUTOEXEC_FILE%" (
    if "%Lang%"=="TraditionalChinese" (
        echo %AUTOEXEC_FILE% 不存在。正在建立...
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo %AUTOEXEC_FILE% 不存在。正在建立...
    ) else (
        echo %AUTOEXEC_FILE% does not exist. Creating it...
    )
    type nul > "%AUTOEXEC_FILE%"
)

REM 檢查文件中是否包含 "%EXEC_COMMAND%"
findstr /i "%EXEC_COMMAND%" "%AUTOEXEC_FILE%" >nul
if %errorlevel% neq 0 (
    REM 如果找不到 "%EXEC_COMMAND%"，則不做任何操作
) else (
    REM 刪除文件中所有包含 "%EXEC_COMMAND%" 的行
    findstr /v /i "%EXEC_COMMAND%" "%AUTOEXEC_FILE%" > "%AUTOEXEC_FILE%.tmp" 2>nul
    move /Y "%AUTOEXEC_FILE%.tmp" "%AUTOEXEC_FILE%" >nul 2>&1
)

REM 檢查文件中是否包含 ADDITIONAL_CONTENT
findstr /i "%ADDITIONAL_CONTENT%" "%AUTOEXEC_FILE%" >nul
if %errorlevel% neq 0 (
    REM 刪除文件中所有包含 "%ADDITIONAL_CONTENT%" 的行
    findstr /v /i "%ADDITIONAL_CONTENT%" "%AUTOEXEC_FILE%" > "%AUTOEXEC_FILE%.tmp" 2>nul
    move /Y "%AUTOEXEC_FILE%.tmp" "%AUTOEXEC_FILE%" >nul 2>&1
    echo %ADDITIONAL_CONTENT% >> "%AUTOEXEC_FILE%"
) else (
    REM 如果已經存在，則不進行操作
)

echo.

if "%Lang%"=="TraditionalChinese" (
    echo 解除安裝完畢。
    echo.
    echo 請按任意鍵退出
) else if "%Lang%"=="SimplifiedChinese" (
    echo 卸载完成。
    echo.
    echo 请按任意键退出。
) else (
    echo Uninstallation completed.
    echo.
    echo Press any key to exit.
)

pause >nul
exit /b
