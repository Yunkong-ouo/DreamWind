@echo off
color 0a
title FOV Calculator
chcp 65001 >nul
mode con: cols=105 lines=30
cls

:: 提示用户输入
echo 在游戏内控制台 "~键" 输入 sensitivity，获取灵敏度数值，我们把这个数值记为 A
echo 在游戏内控制台 "~键" 输入 m_yaw 或 m_pitch 看作者要你获取那个，获取鼠标比例数值，我们把这个数值记为 B
echo "公式： X ÷ (A × B)" X = 作者给你的第一个参数，也就是 "180 ÷ (A × B)" 的 "180" 这个参数
echo 然后修改 "yaw 11688.311688 1 1" 的 "11688.311688" 这个参数，写上刚刚计算出来的值
echo.
echo 建议四舍五入至六位小数，但我帮你四舍五入好了
echo.

:input_x
set /p x=请输入 X 的值: 
if not defined x (
    echo 错误: X 不能为空
    goto input_x
)

:input_a
set /p a=请输入 A 的值: 
if not defined a (
    echo 错误: A 不能为空
    goto input_a
)
if "%a%"=="0" (
    echo 错误: A 不能为 0
    goto input_a
)

:input_b
set /p b=请输入 B 的值: 
if not defined b (
    echo 错误: B 不能为空
    goto input_b
)
if "%b%"=="0" (
    echo 错误: B 不能为 0
    goto input_b
)

:: 调用 PowerShell 进行小数计算并保留六位小数
for /f "delims=" %%i in ('powershell -Command "[math]::Round(%x% / (%a% * %b%), 6)"') do set result=%%i

:: 显示结果
echo.
echo 计算结果: %result%
echo.
echo 双击2下数字可以选取并用ctrl+c复制
echo.
echo 按任意键退出
pause >nul
