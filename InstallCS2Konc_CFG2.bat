@echo off
chcp 65001 >nul 2>&1

REM 檢查 64 位系統路徑
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0

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

REM 壓縮 resource 資料夾為 resource.zip
cls
color 0a
set zipFile=resource.zip
set folderToZip=%cd%\resource
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

cls
color 0A
call powershell.exe -ExecutionPolicy Bypass -File ".\install\CS2Konc_CFG_install_Resource.ps1"
