@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

REM -----------------------------
REM 設定版本與名稱
set "version=v1.3.2"
set "name=DreamWind"
set "namefile=DreamWind"

REM 壓縮來源資料夾與輸出檔案
set "SOURCE_FOLDER=%~dp0%namefile%"
set "ZIP_NAME=%~dp0%name%_%version%.zip"

REM 刪除舊的壓縮檔
if exist "%ZIP_NAME%" (
    echo [！] 發現舊的壓縮檔，刪除中...
    del /F /Q "%ZIP_NAME%"
)

echo.
echo ==========================================
echo 開始壓縮 "%namefile%" 資料夾，版本號：%version%...
echo ==========================================

REM 執行壓縮
7z a "%ZIP_NAME%" "%SOURCE_FOLDER%\*" -mx=9 -mm=Deflate64

REM 取得壓縮後檔案大小 (bytes)
for %%A in ("%ZIP_NAME%") do set size=%%~zA

REM 計算 KB 與 MB（整數顯示）
set /a sizeKB=!size!/1024
set /a sizeMBDec=(!size! * 100 / 1048576)
set /a sizeMB=!size!/1048576

echo.
echo ==========================================
echo [✔] 壓縮完成！
echo 檔案位置：%ZIP_NAME%
echo 壓縮後大小：!size! bytes (!sizeKB! KB, 約 !sizeMB!.!sizeMBDec! MB)
echo ==========================================

echo.
echo 請按任意鍵退出...
pause >nul
exit
