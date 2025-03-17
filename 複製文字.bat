@echo off
chcp 65001 >nul 2>&1
color 0a
mode con: cols=80 lines=25
setlocal enabledelayedexpansion

REM 檢查 64 位系統路徑
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0

REM 新增檔案複製操作
echo 正在複製檔案...

xcopy "%~dp0resource" "%~dp0..\..\resource\" /Y /E >nul 2>&1
echo 複製完成！

echo.
echo 請按任意鍵退出。

pause >nul
exit /b
