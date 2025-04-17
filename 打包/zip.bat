@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

@REM 設定版本與名稱
set version=v1.3.1
set name=DreamWind
set namefile=DreamWind

@REM 記錄檔
set namelog=compress_log.txt

@REM 7-Zip 可執行檔路徑
set ZIP_PATH="P:\Program Files\7-Zip\7z.exe"

@REM 壓縮目標
set SOURCE_FOLDER="%CD%\%namefile%"

@REM 壓縮輸出檔案
set ZIP_NAME="%CD%\%name%_%version%.zip"

@REM 先刪除舊的壓縮檔跟記錄檔
if exist %ZIP_NAME% (
    echo.
    @REM echo [！] 發現舊的壓縮檔跟記錄檔，刪除中...
    del /F /Q %ZIP_NAME%
    del /F /Q %namelog%
)

echo.
echo ==========================================
echo 開始壓縮 "%namefile%" 資料夾，版本號：%version%...
echo ==========================================
@REM %ZIP_PATH% a %ZIP_NAME% %SOURCE_FOLDER%\* -mx=9 -mm=Deflate64 > %namelog%
%ZIP_PATH% a %ZIP_NAME% %SOURCE_FOLDER%\* -mx=9 -mm=Deflate64

@REM 取得壓縮後的檔案大小
for %%A in (%ZIP_NAME%) do (
    set size=%%~zA
)

@REM 計算 MB，保留小數點
set /a sizeMB=!size!/1048576
set /a sizeMB_dec=!size! * 100 / 1048576
set /a sizeMB_final=!sizeMB! + !sizeMB_dec! / 100

echo.
echo ==========================================
echo [✔] 壓縮完成！檔案已存於：
echo %ZIP_NAME%
echo 壓縮後大小：!size! 位元組 (!size:~0,-3! KB, !sizeMB!.!sizeMB_dec! MB)
echo 詳細記錄請查看 compress_log.txt
echo ==========================================

echo.
echo 請按任意鍵退出...
pause >nul
exit /b
