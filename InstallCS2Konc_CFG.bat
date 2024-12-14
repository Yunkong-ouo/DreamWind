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
timeout /t 1 >nul

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

cd ./cfg/CS2Konc_CFG/

REM 壓縮 resource 資料夾為 resource.zip
cls
color 0a
set zipFile=resource.zip
set folderToZip=%~dp0\resource
REM 如果已存在同名的 zip 檔案，先刪除
if exist "%zipFile%" del "%zipFile%"
if exist "%folderToZip%" (
    if "%Lang%"=="TraditionalChinese" (
        echo 正在壓縮 resource 資料夾...
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo 正在压缩 resource 文件夹...
    ) else (
        echo Compressing resource folder...
    )
    powershell.exe -Command "Compress-Archive -Path '%folderToZip%\*' -DestinationPath '%zipFile%' -Force"
    REM 檢查壓縮檔案是否存在
    if exist "%zipFile%" (
        if "%Lang%"=="TraditionalChinese" (
            echo 壓縮完成: %zipFile%
        ) else if "%Lang%"=="SimplifiedChinese" (
            echo 压缩完成: %zipFile%
        ) else (
            echo Compression complete: %zipFile%
        )
    ) else (
        if "%Lang%"=="TraditionalChinese" (
            echo 壓縮失敗，停止腳本。
        ) else if "%Lang%"=="SimplifiedChinese" (
            echo 压缩失败，停止脚本。
        ) else (
            echo Compression failed, stopping the script.
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
) else (
    if "%Lang%"=="TraditionalChinese" (
        echo resource 資料夾不存在，無法壓縮。
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo resource 文件夹不存在，无法压缩。
    ) else (
        echo resource folder does not exist, cannot compress.
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

REM 檢查 "完美世界竞技平台" 進程是否運行
tasklist /FI "IMAGENAME eq 完美世界竞技平台.exe" 2>nul | find /I /N "完美世界竞技平台.exe">nul
if "%ERRORLEVEL%"=="1" (
    cls
    color 0C
    if "%Lang%"=="TraditionalChinese" (
        echo 如果你玩完美平台，請按N退出程序，運行完美對戰平台後啟動此檔案!!!
        echo 如果你玩完美平台，請按N退出程序，運行完美對戰平台後啟動此檔案!!!
        echo 如果你玩完美平台，請按N退出程序，運行完美對戰平台後啟動此檔案!!!
        echo 再次確認
        echo 如果你確定不玩完美平台，按Y繼續
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo 如果你玩完美平台，请按N退出程序，运行完美对战平台后启动此文件!!!
        echo 如果你玩完美平台，请按N退出程序，运行完美对战平台后启动此文件!!!
        echo 如果你玩完美平台，请按N退出程序，运行完美对战平台后启动此文件!!!
        echo 再次确认
        echo 如果你确定不玩完美平台，按Y继续
    ) else (
        echo If you are using the Perfect World platform, press N to exit, and run the platform before restarting this script!!!
        echo If you are using the Perfect World platform, press N to exit, and run the platform before restarting this script!!!
        echo If you are using the Perfect World platform, press N to exit, and run the platform before restarting this script!!!
        echo Confirm again
        echo If you're sure you don't need the Perfect World platform, press Y to continue.
    )
    
    REM 根據語言變數動態更改 choice 提示
    if "%Lang%"=="TraditionalChinese" (
        choice /C YN /N /M "按 Y 繼續，按 N 退出"
    ) else if "%Lang%"=="SimplifiedChinese" (
        choice /C YN /N /M "按 Y 继续，按 N 退出"
    ) else (
        choice /C YN /N /M "Press Y to continue, press N to exit"
    )

    if errorlevel 2 (
        if "%Lang%"=="TraditionalChinese" (
            echo 你選擇了退出。
        ) else if "%Lang%"=="SimplifiedChinese" (
            echo 你选择了退出。
        ) else (
            echo You chose to exit.
        )
        timeout /t 1 >nul
        cls
        exit /b
    ) else (
        if "%Lang%"=="TraditionalChinese" (
            echo 你選擇了繼續。
        ) else if "%Lang%"=="SimplifiedChinese" (
            echo 你选择了继续。
        ) else (
            echo You chose to continue.
        )
        timeout /t 1 >nul
        cls
    )
    color 0A
    REM 運行 PowerShell 腳本並在完成後退出
    call powershell.exe -ExecutionPolicy Bypass -File ".\install\CS2Konc_CFG_Install_Resource.ps1"
    exit /b
)

cls
color 0A
REM 執行默認的 PowerShell 腳本
call powershell.exe -ExecutionPolicy Bypass -File ".\install\CS2Konc_CFG_Install_Resource_Perfect.ps1"
