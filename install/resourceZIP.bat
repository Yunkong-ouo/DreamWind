@echo off
chcp 65001 >nul 2>&1

set zipFile=resource.zip
set folderToZip=%cd%\resource

:: 如果已經有同名的 zip 檔案，先刪除
if exist "%zipFile%" del "%zipFile%"

:: 使用 7-Zip 進行壓縮，完全確保路徑正確處理
"C:\Program Files\7-Zip\7z.exe" a "%zipFile%" -r "%folderToZip%\*"

echo 壓縮完成: %zipFile%
