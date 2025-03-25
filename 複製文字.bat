@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion

xcopy "%~dp0resource" "%~dp0..\..\resource\" /Y /E

echo.
echo 請按任意鍵退出。
pause >nul
exit /b
