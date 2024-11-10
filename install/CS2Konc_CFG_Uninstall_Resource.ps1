# 設置控制台編碼為 UTF-8 BOM
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding($true)

# 啟用日誌
$VerbosePreference = "Continue"

# 導入必要的程序集並初始化窗口
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# 添加鍵盤輔助程序類
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class KeyboardHelper {
    [DllImport("user32.dll")]
    public static extern short GetKeyState(int nVirtKey);
}
"@

# 添加 Win32 類以處理窗口
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Win32 {
    [DllImport("kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();

    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
}
"@

# 全局變量
$script:isBinding = $false
$script:currentBindingButton = $null

# 按鍵綁定控件 UI 參數
$script:bindingControlHeight = 28
$script:bindingControlWidth = 110
$script:bindingControlHorizontalSpacing = 5
$script:bindingControlVerticalSpacing = 5

# 獲取當前目錄
$currentDirectory = Get-Location

# 定義目標資料夾
$destinationFolder2 = "..\..\resource"

# 檢查目標資料夾是否存在，若不存在則創建
if (-not (Test-Path $destinationFolder2)) {
    New-Item -Path $destinationFolder2 -ItemType Directory
}
else {
    # 刪除目標資料夾中的所有檔案，保留名為 game-icon.bmp 的檔案
    Get-ChildItem -Path $destinationFolder2 -Recurse | ForEach-Object {
        if ($_.Name -ne "game-icon.bmp") {
            try {
                Remove-Item -Path $_.FullName -Recurse -Force -ErrorAction Stop
            }
            catch {
                Write-Host "無法刪除項目：$($_.FullName) - $_"
            }
        }
    }
}

# 創建Autoexec
& ".\install\CS2Konc_CFG_Autoexec2.ps1"

# 設定系統語言
$systemLanguage = [System.Globalization.CultureInfo]::CurrentCulture.Name

# 根據語言設置顯示不同的提示信息
if ($systemLanguage -eq "zh-CN") {
    # 簡體中文提示
    $finalMessage = "解除安装完成，请重启游戏后测试。`n`n"
    Write-Host "$systemLanguage"
    $verboseMessage = "解除安装完成"
    Write-Host $verboseMessage
    # 顯示安裝的消息框（簡體中文）
    $result = [System.Windows.Forms.MessageBox]::Show($finalMessage, "解除安装完成", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
} elseif ($systemLanguage -eq "zh-TW") {
    # 繁體中文提示
    $finalMessage = "解除安裝完成，請重啟遊戲後測試。`n`n"
    Write-Host "$systemLanguage"
    $verboseMessage = "解除安裝完成"
    Write-Host $verboseMessage
    # 顯示安裝的消息框（繁體中文）
    $result = [System.Windows.Forms.MessageBox]::Show($finalMessage, "解除安裝完成", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
} elseif ($systemLanguage -eq "en-US") {
    # 英文提示
    $finalMessage = "Uninstallation complete. Please restart the game and test. `n`n"
    Write-Host "$systemLanguage"
    $verboseMessage = "Uninstallation completed."
    Write-Host $verboseMessage
    # 顯示安裝的消息框（英文）
    $result = [System.Windows.Forms.MessageBox]::Show($finalMessage, "Uninstallation completed.", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
} else {
    # 預設語言提示（繁體中文）
    $finalMessage = "安裝完成，請重啟遊戲後測試。`n`n"
    Write-Host "$systemLanguage"
    $verboseMessage = "安裝完成"
    Write-Host $verboseMessage
    # 顯示安裝的消息框（預設，繁體中文）
    $result = [System.Windows.Forms.MessageBox]::Show($finalMessage, "安裝完成", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
}
