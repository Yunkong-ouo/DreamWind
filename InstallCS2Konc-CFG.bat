@echo off
chcp 65001 >nul 2>&1

REM 檢查系統是否為 64 位，並設置相應路徑
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0

REM 檢查是否在 CS2Konc-CFG 文件夾中
for %%I in (.) do set CurrDirName=%%~nxI
if /I not "%CurrDirName%"=="CS2Konc-CFG" (
    color 0C
    echo 請把此文件放進 CS2Konc-CFG 文件夾中!!!
    echo.請確保此文件在 *\Counter-Strike Global Offensive\game\csgo\cfg\CS2Konc-CFG 目錄當中
    echo.
    echo 請按任意鍵退出。
    pause >nul
    exit /b
)

REM 壓縮 resource 文件夾為 resource.zip
set zipFile=resource.zip
set folderToZip=%cd%\resource

REM 如果已經有同名的 zip 檔案，先刪除
if exist "%zipFile%" del "%zipFile%"
if exist "%folderToZip%" (
    echo 正在壓縮 resource 文件夾...
    powershell.exe -Command "Compress-Archive -Path '%folderToZip%\*' -DestinationPath '%zipFile%' -Force"
    REM "C:\Program Files\7-Zip\7z.exe" a "%zipFile%" -r "%folderToZip%\*"
    if errorlevel 1 (
        echo 壓縮失敗，停止腳本。
        echo 請按任意鍵退出。
        pause >nul
        exit /b
    ) else (
        echo 壓縮完成: %zipFile%
    )
) else (
    echo resource 文件夾不存在，無法壓縮。
    echo 請按任意鍵退出。
    pause >nul
    exit /b
)

REM 執行默認的 PowerShell 腳本
call powershell.exe -ExecutionPolicy Bypass -File ".\install\CS2Konc-CFG_install.ps1"

:: echo 請按任意鍵退出。
:: pause >nul
