@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion

:: 設定來源資料夾
set source_folder=..\..\
:: 設定目標資料夾
set target_folder=.\CS2Konc_CFG\CS2Konc_CFG
:: 輸出設定訊息
echo 設定來源資料夾: %source_folder%
echo 設定目標資料夾: %target_folder%

:: 刪除目標資料夾內的檔案和資料夾
echo.
echo 正在刪除目標資料夾中的檔案和資料夾...
echo.
del /q /f "%target_folder%\*.*" >nul
for /d %%d in ("%target_folder%\*") do rd /s /q "%%d"

:: 檢查目標資料夾是否存在，若不存在則創建
if not exist "%target_folder%" mkdir "%target_folder%"

:: 讀取文件清單，複製檔案和資料夾
for /f "delims=" %%i in (FilesCopy.txt) do (
    set item=%%i

    :: 如果是資料夾
    if exist "%source_folder%!item!\" (
        echo 正在複製資料夾: !item!
        xcopy /e /i /h "%source_folder%!item!\" "%target_folder%\!item!\"
    ) else (
        :: 如果是檔案，直接複製
        if exist "%source_folder%!item!" (
            echo 正在複製檔案: !item!
            copy "%source_folder%!item!" "%target_folder%\" >nul
        )
    )
)

echo 所有檔案和資料夾複製完成。
pause
