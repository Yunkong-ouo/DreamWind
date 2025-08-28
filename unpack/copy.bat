@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

rem ===== 路徑設定 =====
set "SRC=%~dp0.."
set "DEST=%~dp0DreamWind\DreamWind"

if not exist "%DEST%" mkdir "%DEST%"

echo 開始複製...

if not exist "%~dp0filelist.txt" (
    echo ❌ 找不到 filelist.txt
    pause
    exit
)

for /f "usebackq delims=" %%f in ("%~dp0filelist.txt") do (
    set "LINE=%%f"

    rem === 跳過空行 ===
    if not "!LINE!"=="" (
        rem === 跳過註解行 (以 // 開頭) ===
        if /i not "!LINE:~0,2!"=="//" (
            set "ITEM=%SRC%\%%f"

            if exist "!ITEM!\" (
                echo 正在複製資料夾： %%f ...
                robocopy "!ITEM!" "%DEST%\%%f" /E /R:0 /W:0 /NFL /NDL /NJH /NJS /nc /ns /np >nul
                echo ✅ 資料夾 %%f 複製完成
            ) else if exist "!ITEM!" (
                echo 正在複製檔案： %%f ...
                robocopy "%SRC%" "%DEST%" "%%f" /R:0 /W:0 /NFL /NDL /NJH /NJS /nc /ns /np >nul
                echo ✅ 檔案 %%f 複製完成
            ) else (
                echo [❌ 不存在] %%f
            )
        )
    )
)

echo.
echo ✅ 所有指定項目已複製完成！

echo 請按任意鍵退出...
pause >nul
exit