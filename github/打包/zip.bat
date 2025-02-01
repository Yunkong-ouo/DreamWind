@echo off
chcp 65001 >nul 2>&1
cls
color 0a

set version=v1.2.8
set zipFile=DreamWind_%version%.zip
REM set zipFile=DreamWind_%version%.7z
set folderToZip=DreamWind

REM 如果已存在同名的壓縮檔案，先刪除
if exist "%zipFile%" del "%zipFile%"

if exist "%folderToZip%" (
    echo 正在壓縮 %folderToZip% 資料夾為版本 %version% ...
    REM 使用 7-Zip 壓縮資料夾
    REM "C:\Program Files\7-Zip\7z.exe" a -t7z "%zipFile%" "%folderToZip%\*" -mx9 -m0=LZMA -md=256m -ms=on -mfb=273
    "C:\Program Files\7-Zip\7z.exe" a -tzip "%zipFile%" "%folderToZip%\*" -mx9 -mm=Deflate64

    REM 檢查壓縮檔案是否存在
    if exist "%zipFile%" (
        echo 壓縮完成: %zipFile%
    ) else (
        echo 壓縮失敗，停止腳本。
        pause >nul
        exit /b
    )
) else (
    echo %folderToZip% 資料夾不存在，無法壓縮。
    pause >nul
    exit /b
)
pause
exit /b
