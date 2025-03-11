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

cd "%~dp0.."

echo.

REM 設置要檢查的行
set "ADDITIONAL_CONTENT=joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt"
set "EXEC_COMMAND=DreamWind/DreamWindMod"

REM 設置 autoexec.cfg 文件路徑
set "AUTOEXEC_FILE=autoexec.cfg"

REM 檢查 autoexec.cfg 文件是否存在
if not exist "%AUTOEXEC_FILE%" (
    echo %AUTOEXEC_FILE% 不存在。正在建立...
    type nul > "%AUTOEXEC_FILE%"
)

REM 檢查文件中是否包含 ADDITIONAL_CONTENT
findstr /i "%ADDITIONAL_CONTENT%" "%AUTOEXEC_FILE%" >nul
if %errorlevel% neq 0 (
    REM 如果没有找到该行内容，什么也不做
) else (
    REM 如果找到，删除该行
    findstr /v /i "%ADDITIONAL_CONTENT%" "%AUTOEXEC_FILE%" > "%AUTOEXEC_FILE%.tmp" 2>nul
    move /Y "%AUTOEXEC_FILE%.tmp" "%AUTOEXEC_FILE%" >nul 2>&1
)

REM 取得文件的最後一行
set "LAST_LINE="
for /f "tokens=* delims=" %%A in ('type "%AUTOEXEC_FILE%" ^| findstr /r /n ".*"') do (
    set "LAST_LINE=%%A"
)
REM 提取文件最後一行內容
for /f "tokens=2 delims=:" %%B in ("!LAST_LINE!") do set "LAST_LINE_CONTENT=%%B"
echo 最後一行內容: !LAST_LINE_CONTENT!

REM 檢查最後一行是否為 "%EXEC_COMMAND%"
if /i not "!LAST_LINE_CONTENT!"=="!EXEC_COMMAND!" (
    if /i not "!LAST_LINE_CONTENT!"=="!EXEC_COMMAND! " (
        echo 最後一行不是 "%EXEC_COMMAND%"。正在新增到文件...
        echo.  >> "%AUTOEXEC_FILE%"
        echo %EXEC_COMMAND% >> "%AUTOEXEC_FILE%"
    ) else (
        echo 最後一行已經是 "%EXEC_COMMAND%"。未進行修改。
    )
)

echo.
echo 安裝完成。
echo.
echo 請按任意鍵退出。

pause >nul
exit /b
