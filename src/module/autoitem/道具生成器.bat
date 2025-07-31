@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion

@REM 檔名

set "NAME=PropParameters.cfg"

if exist !NAME! (
    echo !NAME! 已存在，正在刪除...
    del /f /q !NAME!
) else (
    echo !NAME! 不存在，將自動創建新文件。
)
echo.

@REM 輸入 setpos 和 setang 指令

set /p input=請輸入 setpos 和 setang 的指令:

@REM 解析 setpos 和 setang

for /f "tokens=1-8" %%a in ("%input%") do set posang=%%a %%b %%c %%d %%e %%f %%g

@REM 提取 setang的 pitch, yaw

for /f "tokens=5-7" %%a in ("%input%") do (
    set pitchvalue=%%a
    set yawvalue=%%b
)

echo.
echo 提取的 Pitch 角度 = !pitchvalue!
echo 提取的 Yaw 角度 = !yawvalue!

set sensitivityvalue=2.520000
set m_yaw_pitchvalue=0.022

@REM 計算

for /f %%i in ('powershell -command "[math]::Round((!pitchvalue! - 89.0) / (!sensitivityvalue! * !m_yaw_pitchvalue!), 6)"') do set resultPitch=%%i
for /f %%i in ('powershell -command "[math]::round((-1 * (!yawvalue! / (!sensitivityvalue! * !m_yaw_pitchvalue!))), 6)"') do set resultYaw=%%i

echo.
echo 計算出 Pitch 的角度
echo alias ItemAngle_Pitch "pitch !resultPitch! 1 1"
echo.
echo 計算出 Yaw 的角度
echo alias ItemAngle_Yaw "yaw !resultYaw! 1 1"
>>!NAME! echo alias ItemAngle_Pitch "pitch !resultPitch! 1 1"
>>!NAME! echo alias ItemAngle_Yaw "yaw !resultYaw! 1 1"

@REM 選擇道具

echo.
echo 請選擇道具 (輸入數字 1~5):
echo.
echo 1 - 高爆手榴彈
echo.
echo 2 - 閃光彈
echo.
echo 3 - 煙霧彈
echo.
echo 4 - 誘魅彈
echo.
echo 5 - 燃燒彈
echo.
choice /c 12345 /n /m "選擇："
set "option1=%errorlevel%"
if "%option1%"=="1" set slot=slot6
if "%option1%"=="2" set slot=slot7
if "%option1%"=="3" set slot=slot8
if "%option1%"=="4" set slot=slot9
if "%option1%"=="5" set slot=slot10
echo alias TakeOutProp "!slot!"
>>!NAME! echo alias TakeOutProp "!slot!"

@REM 選擇投擲方式

echo.
echo 請選擇投擲方式 (輸入數字 1~2):
echo.
echo 1 - 普通跳投
echo.
echo 2 - 前跳投
echo.
echo 3 - 普通投
echo.
echo 4 - 雙鍵投
echo.
echo 5 - 右鍵投
echo.
choice /c 12345 /n /m "選擇："
set "option2=%errorlevel%"
if "%option2%"=="1" set throw=PropJumpThrowEvent
if "%option2%"=="2" set throw=PropForwardJumpThrowEvent
if "%option2%"=="3" set throw=PropNormalThrowEvent
if "%option2%"=="4" set throw=PropDoubleThrowEvent
if "%option2%"=="5" set throw=PropRightThrowEvent
echo alias PropThrow "!throw!"
>>!NAME! echo alias PropThrow "!throw!"

@REM 是否加入傳送指令

echo.
choice /c yn /n /m "是否需要加入傳送指令？(y/n)："
if errorlevel 2 (
    echo 不填加傳送指令。
) else (
    set teleportCmd=alias Teleport "!posang!"
    echo !teleportCmd!
    >>!NAME! echo !teleportCmd!
)

echo.
echo 所有指令已寫入 !NAME! 文件中。
echo.
echo 請按任意鍵退出。
pause >nul
exit /b
