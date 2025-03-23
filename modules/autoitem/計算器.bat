@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion

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

for /f %%i in ('powershell -command "[math]::round((!pitchvalue! / (!sensitivityvalue! * !m_yaw_pitchvalue!)), 6)"') do set resultPitch=%%i
for /f %%i in ('powershell -command "[math]::round((-1 * (!yawvalue! / (!sensitivityvalue! * !m_yaw_pitchvalue!))), 6)"') do set resultYaw=%%i

echo.
echo 計算出 Pitch 的角度
echo pitch !resultPitch! 1 1
echo.
echo 計算出 Yaw 的角度
echo yaw !resultYaw! 1 1
echo.

echo 座標
echo.
echo !posang!

echo.
echo 請按任意鍵退出。
pause >nul
exit /b
