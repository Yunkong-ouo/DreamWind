@echo off
color 0a
title FOV Calculator
chcp 65001 >nul
mode con: cols=105 lines=30
cls

rem 提示用户输入

echo 在游戏内控制台 "~键" 输入 sensitivity，获取灵敏度数值，我们称之为 A
echo 在游戏内控制台 "~键" 输入 m_yaw 或 m_pitch 看作者要求获取哪个，获取鼠标比例数值，我们称之为 B
echo "公式： X ÷ (A × B)" X = 作者给你的第一个参数，也就是 "180 ÷ (A × B)" 中的 "180"
echo 然后修改 "yaw 11688.311688 1 1" 中的 "11688.311688"，将其替换为刚刚计算出来的值
echo.
echo 建议四舍五入至六位小数，但我已经帮你四舍五入了
echo.

rem 请输入 X, A, B 的值

:inputX
set /p X=请输入 X 的值:
if "%X%"=="" (
    echo X 的值不能为空！
    goto inputX
)

:inputA
set /p A=请输入 A 的值:
if "%A%"=="" (
    echo A 的值不能为空！
    goto inputA
)
if "%A%"=="0" (
    echo A 的值不能为 0！
    goto inputA
)

:inputB
set /p B=请输入 B 的值:
if "%B%"=="" (
    echo B 的值不能为空！
    goto inputB
)
if "%B%"=="0" (
    echo B 的值不能为 0！
    goto inputB
)

rem 使用 PowerShell 计算公式 X / (A * B) 并四舍五入到六位小数

for /f "tokens=*" %%R in ('powershell -command "[math]::Round((%X% / (%A% * %B%)), 6)"') do set result=%%R

rem 显示结果

echo 计算结果: %result%
echo.
echo 双击两下数字可以选中并用 ctrl+c 复制
echo.
echo 按任意键退出
pause >nul
