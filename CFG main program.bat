@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
title DreamWind
mode con: cols=80 lines=25
color 0a
cls

REM 確認是否有管理員權限
bcdedit >nul
if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else (
    goto UACAdmin
)
:UACPrompt
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
exit /B
:UACAdmin
cd /d "%~dp0"

REM 取得系統語言設置（從註冊表中獲取）
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\International" /v LocaleName') do set SystemLanguage=%%a
REM 根據系統語言設置 Lang 變數
set Lang=TraditionalChinese
if /I "%SystemLanguage%"=="zh-TW" (
    set Lang=TraditionalChinese
) else if /I "%SystemLanguage%"=="zh-CN" (
    set Lang=SimplifiedChinese
) else if /I "%SystemLanguage%"=="en-US" (
    set Lang=English
)

REM 設定多語言內容
if "%Lang%"=="TraditionalChinese" (
    set Msg_CurrentLang=當前語言是繁體中文
    set Msg_MenuTitle=選單
    set Msg_Option1=安裝
    set Msg_Option2=解除安裝
    set Msg_Option3=設定
    set Msg_Option4=旋轉視角數值自動計算
    set Msg_Option5=離開

    set Msg_Choose=請按下 1~5 選擇功能:
    set Msg_ChoicePrompt=選擇:
    set Msg_ConfirmEnter=是否進入? "("是按Y/否按N")"
    set Msg_Youchoose=你選擇了
) else if "%Lang%"=="SimplifiedChinese" (
    set Msg_CurrentLang=当前语言是简体中文
    set Msg_MenuTitle=菜单
    set Msg_Option1=安装
    set Msg_Option2=卸载
    set Msg_Option3=设置
    set Msg_Option4=旋转视角数值自动计算
    set Msg_Option5=離開

    set Msg_Choose=请按下 1~5 选择功能:
    set Msg_ChoicePrompt=选择:
    set Msg_ConfirmEnter=是否进入? "("是按Y/否按N")"
    set Msg_Youchoose=你选择了
) else (
    set Msg_CurrentLang=The current language is English
    set Msg_MenuTitle=Menu
    set Msg_Option1=Install
    set Msg_Option2=Uninstall
    set Msg_Option3=Settings
    set Msg_Option4=Automatic calculation of rotation angle values
    set Msg_Option5=Exit

    set Msg_Choose=Please press 1~5 to select an option:
    set Msg_ChoicePrompt=Choose:
    set Msg_ConfirmEnter=Do you want to proceed? "("Press Y for Yes / N for No")"
    set Msg_Youchoose=You choose
)
goto MainMenu

:ErrorGeneral
color 0c
mode con: COLS=50 LINES=5
cls
if "%Lang%"=="TraditionalChinese" (
    set Msg_ErrorGeneral=操作失敗，按下任意鍵返回主選單
) else if "%Lang%"=="SimplifiedChinese" (
    set Msg_ErrorGeneral=操作失败，按下任意键返回主菜单
) else (
    set Msg_ErrorGeneral=Operation failed, press any key to return to the main menu
)
echo.
echo %Msg_ErrorGeneral%
pause >nul
goto MainMenu


:PauseGeneral
if "%Lang%"=="TraditionalChinese" (
    set Msg_PauseGeneral=請按任意鍵退出
) else if "%Lang%"=="SimplifiedChinese" (
    set Msg_PauseGeneral=请按任意键退出
) else (
    set Msg_PauseGeneral=Press any key to exit
)
echo %Msg_PauseGeneral%
pause >nul
exit /b

:examine
color 0a
mode con: cols=80 lines=25
cls
REM 檢查是否在 %NAME% 資料夾中
cd /d %~dp0
set "NAME=DreamWind"
for %%I in (.) do set CurrDirName=%%~nxI
if /I not "%CurrDirName%"=="!NAME!" (
    cls
    color 0C
    if "%Lang%"=="TraditionalChinese" (
        echo 請把此資料夾放進 %NAME% 資料夾中!!!
        echo 請把此資料夾放進 %NAME% 資料夾中!!!
        echo 請把此資料夾放進 %NAME% 資料夾中!!!
        echo 請確保此資料夾在 *\Counter-Strike Global Offensive\game\csgo\cfg\%NAME% 目錄當中
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo 请把此文件夹放进 %NAME% 文件夹中!!!
        echo 请把此文件夹放进 %NAME% 文件夹中!!!
        echo 请把此文件夹放进 %NAME% 文件夹中!!!
        echo 请确保此文件夹在 *\Counter-Strike Global Offensive\game\csgo\cfg\%NAME% 目录當中
    ) else (
        echo Please place this folder into the %NAME% folder!!!
        echo Please place this folder into the %NAME% folder!!!
        echo Please place this folder into the %NAME% folder!!!
        echo Please make sure this folder is in the *\Counter-Strike Global Offensive\game\csgo\cfg\%NAME% directory.
    )
    echo.
    goto PauseGeneral
)

REM 檢測放置位置
cd /d %~dp0
cd ../../
set "EXPECTED_FOLDER_NAME=csgo"
for %%F in (.) do set "CURRENT_FOLDER_NAME=%%~nxF"
if "%Lang%"=="TraditionalChinese" (
    echo 當前資料夾名稱: %CURRENT_FOLDER_NAME%
    echo 預期資料夾名稱: %EXPECTED_FOLDER_NAME%
) else if "%Lang%"=="SimplifiedChinese" (
    echo 当前文件夹名称: %CURRENT_FOLDER_NAME%
    echo 预期文件夹名称: %EXPECTED_FOLDER_NAME%
) else (
    echo Current folder name: %CURRENT_FOLDER_NAME%
    echo Expected folder name: %EXPECTED_FOLDER_NAME%
)
if /I "%CURRENT_FOLDER_NAME%" neq "%EXPECTED_FOLDER_NAME%" (
    color 0C
    if "%Lang%"=="TraditionalChinese" (
        echo 您的 %NAME% 放置位置錯誤!!!，請重看使用說明
        echo 您的 %NAME% 放置位置錯誤!!!，請重看使用說明
        echo 您的 %NAME% 放置位置錯誤!!!，請重看使用說明
        echo 請確保此資料夾放在 *\Counter-Strike Global Offensive\game\csgo\cfg 目錄當中
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo 您的 %NAME% 放置位置错误!!!，请重看使用说明
        echo 您的 %NAME% 放置位置错误!!!，请重看使用说明
        echo 您的 %NAME% 放置位置错误!!!，请重看使用说明
        echo 请确保此文件夹放在 *\Counter-Strike Global Offensive\game\csgo\cfg 目录当中
    ) else (
        echo Your %NAME% placement is incorrect!!! Please refer to the instructions again.
        echo Your %NAME% placement is incorrect!!! Please refer to the instructions again.
        echo Your %NAME% placement is incorrect!!! Please refer to the instructions again.
        echo Please make sure this folder is placed in the *\Counter-Strike Global Offensive\game\csgo\cfg directory.
    )
    echo.
    goto PauseGeneral
)
goto !returnTo!

:MainMenu
mode con: cols=40 lines=15
color 0a
cls

echo ===============================
echo    %Msg_CurrentLang%
echo ===============================
echo          %Msg_MenuTitle%
echo ===============================
echo 1. %Msg_Option1%
echo 2. %Msg_Option2%
echo 3. %Msg_Option3%
echo 4. %Msg_Option4%
echo 5. %Msg_Option5%
echo ===============================
echo %Msg_Choose%

choice /c 12345 /n /m "%Msg_ChoicePrompt%"

set "option1=%errorlevel%"
if "%option1%"=="5" goto leave
if "%option1%"=="4" goto FOVCalculatorVerify
if "%option1%"=="3" goto settingsVerify
if "%option1%"=="2" goto UninstallVerify
if "%option1%"=="1" goto InstallVerify

:leave
if "%Lang%"=="TraditionalChinese" (
    cls
    echo 感謝使用
    echo.
    goto PauseGeneral
) else if "%Lang%"=="SimplifiedChinese" (
    cls
    echo 感谢使用
    echo.
    goto PauseGeneral
) else (
    cls
    echo Thanks for using
    echo.
    goto PauseGeneral
)

@REM settings============================================================

:settingsVerify
cls
echo %Msg_Youchoose% [%Msg_Option3%]
choice /c YN /n /m "%Msg_ConfirmEnter%"
if errorlevel 2 goto MainMenu
if errorlevel 1 goto settings

:settings
if "%Lang%"=="TraditionalChinese" (
    set Msg_CFG_MenuTitle=CFG初始設定
    set Msg_CFG_Option1=按鍵綁定
    set Msg_CFG_Option2=功能設定
    set Msg_CFG_Option3=個人設定
    set Msg_CFG_Option4=設定目錄
    set Msg_CFG_Option5=返回主菜單

    set Msg_CFG_Choose=請按下 1~5 選擇功能:
) else if "%Lang%"=="SimplifiedChinese" (
    set Msg_CFG_MenuTitle=CFG初始设置
    set Msg_CFG_Option1=按键绑定
    set Msg_CFG_Option2=功能设置
    set Msg_CFG_Option3=个人设置
    set Msg_CFG_Option4=设置目录
    set Msg_CFG_Option5=返回主菜单

    set Msg_CFG_Choose=请按下 1~5 选择功能:
) else (
    set Msg_CFG_MenuTitle=CFG Initial Settings
    set Msg_CFG_Option1=Key Bindings
    set Msg_CFG_Option2=Function Settings
    set Msg_CFG_Option3=Personal Settings
    set Msg_CFG_Option4=Settings Directory
    set Msg_CFG_Option5=Return to Main Menu

    set Msg_CFG_Choose=Please press 1~5 to select a function:
)

mode con: cols=40 lines=15
color 0a
cls

echo ===============================
echo          %Msg_CFG_MenuTitle%
echo ===============================
echo 1. %Msg_CFG_Option1%
echo 2. %Msg_CFG_Option2%
echo 3. %Msg_CFG_Option3%
echo 4. %Msg_CFG_Option4%
echo 5. %Msg_CFG_Option5%
echo ===============================
echo %Msg_CFG_Choose%

choice /c 12345 /n /m "%Msg_ChoicePrompt%"

set "option2=%errorlevel%"
if "%option2%"=="5" goto leave
if "%option2%"=="4" goto OpenConfigFolder
if "%option2%"=="3" goto PersonalSettings
if "%option2%"=="2" goto OptPreference
if "%option2%"=="1" goto KeyPreference

:KeyPreference
start config\KeyPreference.cfg
goto settings
:OptPreference
start config\OptPreference.cfg
goto settings
:PersonalSettings
start config\PersonalSettings.cfg
goto settings
:OpenConfigFolder
start config
goto settings
:leave
goto MainMenu

@REM ============================================================


@REM Install============================================================
:InstallVerify
cls
echo %Msg_Youchoose% [%Msg_Option1%]
choice /c YN /n /m "%Msg_ConfirmEnter%"
if errorlevel 2 goto MainMenu
if errorlevel 1 goto InstallExamine

:InstallExamine
set returnTo=Install
goto examine
:Install

echo.

REM 新增檔案複製操作
if "%Lang%"=="TraditionalChinese" (
    echo 正在複製檔案...
) else if "%Lang%"=="SimplifiedChinese" (
    echo 正在复制文件...
) else (
    echo Copying file...
)

xcopy "%~dp0resource" "%~dp0..\..\resource\" /Y /E >nul 2>&1

if "%Lang%"=="TraditionalChinese" (
    echo 複製完成！
) else if "%Lang%"=="SimplifiedChinese" (
    echo 文件复制完成！
) else (
    echo File copied successfully!
)

cd "%~dp0.."

echo.

REM 設置要檢查的行
set "ADDITIONAL_CONTENT=joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt"
set "EXEC_COMMAND=DreamWind/DreamWindMod"

REM 設置 autoexec.cfg 文件路徑
set "AUTOEXEC_FILE=autoexec.cfg"

REM 檢查 autoexec.cfg 文件是否存在
if not exist "%AUTOEXEC_FILE%" (
    if "%Lang%"=="TraditionalChinese" (
        echo %AUTOEXEC_FILE% 不存在。正在建立...
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo %AUTOEXEC_FILE% 不存在。正在建立...
    ) else (
        echo %AUTOEXEC_FILE% does not exist. Creating it...
    )
    type nul > "%AUTOEXEC_FILE%"
)

REM 检查文件中是否包含 ADDITIONAL_CONTENT
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
REM 輸出最後一行內容，用於除錯
if "%Lang%"=="TraditionalChinese" (
    echo 最後一行內容: !LAST_LINE_CONTENT!
) else if "%Lang%"=="SimplifiedChinese" (
    echo 最后一行内容: !LAST_LINE_CONTENT!
) else (
    echo The last line content: !LAST_LINE_CONTENT!
)

REM 檢查最後一行是否為 "%EXEC_COMMAND%"
if /i not "!LAST_LINE_CONTENT!"=="!EXEC_COMMAND!" (
    if /i not "!LAST_LINE_CONTENT!"=="!EXEC_COMMAND! " (
        if "%Lang%"=="TraditionalChinese" (
            echo 最後一行不是 "%EXEC_COMMAND%"。正在新增到文件...
        ) else if "%Lang%"=="SimplifiedChinese" (
            echo 最后一行不是 "%EXEC_COMMAND%"。正在新增到文件...
        ) else (
            echo The last line is not "%EXEC_COMMAND%". Adding it to the file...
        )
        echo.  >> "%AUTOEXEC_FILE%" 
        echo %EXEC_COMMAND% >> "%AUTOEXEC_FILE%"
    ) else (
        if "%Lang%"=="TraditionalChinese" (
            echo 最後一行已經是 "%EXEC_COMMAND%"。未進行修改。
        ) else if "%Lang%"=="SimplifiedChinese" (
            echo 最后一行已经是 "%EXEC_COMMAND%"。未进行修改。
        ) else (
            echo The last line is already "%EXEC_COMMAND%". No changes made.
        )
    )
)

echo.

if "%Lang%"=="TraditionalChinese" (
    echo 安裝完成。
    echo.
    goto PauseGeneral
) else if "%Lang%"=="SimplifiedChinese" (
    echo 安装完成。
    echo.
    goto PauseGeneral
) else (
    echo Installation completed.
    echo.
    goto PauseGeneral
)
@REM ============================================================

@REM Uninstall============================================================
:UninstallVerify
cls
echo %Msg_Youchoose% [%Msg_Option2%]
choice /c YN /n /m "%Msg_ConfirmEnter%"
if errorlevel 2 goto MainMenu
if errorlevel 1 goto UninstallExamine

:UninstallExamine
set returnTo=Uninstall
goto examine
:Uninstall

echo.

REM 解除安裝操作
if "%Lang%"=="TraditionalChinese" (
    echo 正在解除安裝...
) else if "%Lang%"=="SimplifiedChinese" (
    echo 正在卸载...
) else (
    echo Uninstalling...
)

REM 設置資源目錄路徑
set "RESOURCE_DIR=%~dp0..\..\resource"

REM 刪除資料夾內的所有文件，但保留 game-icon.bmp
for /r "%RESOURCE_DIR%" %%F in (*) do (
    if /i not "%%~nxF"=="game-icon.bmp" (
        del /f /q "%%F"
    )
)

cd "%~dp0.."

REM 設置要檢查的行
set "EXEC_COMMAND=DreamWind/DreamWindMod"
set "AUTOEXEC_FILE=autoexec.cfg"

REM 設置要新增的內容，將所有命令合併為一行
set "ADDITIONAL_CONTENT=joy_response_move 1;joy_side_sensitivity 1.000000;joy_forward_sensitivity 1.000000;cl_scoreboard_mouse_enable_binding +attack2;cl_quickinventory_filename radial_quickinventory.txt"

REM 檢查 autoexec.cfg 文件是否存在
if not exist "%AUTOEXEC_FILE%" (
    if "%Lang%"=="TraditionalChinese" (
        echo %AUTOEXEC_FILE% 不存在。正在建立...
    ) else if "%Lang%"=="SimplifiedChinese" (
        echo %AUTOEXEC_FILE% 不存在。正在建立...
    ) else (
        echo %AUTOEXEC_FILE% does not exist. Creating it...
    )
    type nul > "%AUTOEXEC_FILE%"
)

REM 檢查文件中是否包含 "%EXEC_COMMAND%"
findstr /i "%EXEC_COMMAND%" "%AUTOEXEC_FILE%" >nul
if %errorlevel% neq 0 (
    REM 如果找不到 "%EXEC_COMMAND%"，則不做任何操作
) else (
    REM 刪除文件中所有包含 "%EXEC_COMMAND%" 的行
    findstr /v /i "%EXEC_COMMAND%" "%AUTOEXEC_FILE%" > "%AUTOEXEC_FILE%.tmp" 2>nul
    move /Y "%AUTOEXEC_FILE%.tmp" "%AUTOEXEC_FILE%" >nul 2>&1
)

REM 檢查文件中是否包含 ADDITIONAL_CONTENT
findstr /i "%ADDITIONAL_CONTENT%" "%AUTOEXEC_FILE%" >nul
if %errorlevel% neq 0 (
    REM 刪除文件中所有包含 "%ADDITIONAL_CONTENT%" 的行
    findstr /v /i "%ADDITIONAL_CONTENT%" "%AUTOEXEC_FILE%" > "%AUTOEXEC_FILE%.tmp" 2>nul
    move /Y "%AUTOEXEC_FILE%.tmp" "%AUTOEXEC_FILE%" >nul 2>&1
    echo %ADDITIONAL_CONTENT% >> "%AUTOEXEC_FILE%"
) else (
    REM 如果已經存在，則不進行操作
)

echo.

if "%Lang%"=="TraditionalChinese" (
    echo 解除安裝完畢。
    echo.
    goto PauseGeneral
) else if "%Lang%"=="SimplifiedChinese" (
    echo 卸载完成。
    echo.
    goto PauseGeneral
) else (
    echo Uninstallation completed.
    echo.
    goto PauseGeneral
)
@REM ============================================================

@REM FOVCalculator============================================================
:FOVCalculatorVerify
cls
echo %Msg_Youchoose% [%Msg_Option4%]
choice /c YN /n /m "%Msg_ConfirmEnter%"
if errorlevel 2 goto MainMenu
if errorlevel 1 goto FOVCalculator

:FOVCalculator
color 0a
mode con: cols=105 lines=30
cls

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
goto PauseGeneral
