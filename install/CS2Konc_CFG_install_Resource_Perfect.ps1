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
$sourceFile = Join-Path -Path $currentDirectory -ChildPath "resource.zip"
# 檢查 resource.zip 是否存在，並使用消息框顯示結果
if (-Not (Test-Path -Path $sourceFile)) {
    [System.Windows.Forms.MessageBox]::Show("當前目錄下未找到 resource.zip 文件", "錯誤", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    exit
}

# 查找完美世界競技平台
$process = Get-Process -Name "完美世界競技平台" -ErrorAction Stop
$processPath = ($process | Select-Object -First 1).Path
$directory = Split-Path $processPath -Parent
# 複製 resource.zip
$targetFile = Join-Path -Path $directory -ChildPath "plugin\resource\resource.zip"
$targetDirectory = Split-Path $targetFile -Parent
if (-Not (Test-Path -Path $targetDirectory)) {
    New-Item -Path $targetDirectory -ItemType Directory -Force
}
Copy-Item -Path $sourceFile -Destination $targetFile -Force
if (-Not (Test-Path -Path $targetFile)) {
    throw "文件複製失敗: $targetFile"
}

# 定義解壓縮目標路徑
$zipFilePath2 = ".\resource.zip"
$destinationFolder2 = "..\..\resource"
# 檢查目標資料夾是否存在，若不存在則創建
if (-not (Test-Path $destinationFolder2)) {
    New-Item -Path $destinationFolder2 -ItemType Directory
}
else {
    # 刪除檔案，保留名為 game-icon.bmp 的檔案
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
# 解壓縮文件
Expand-Archive -Path $zipFilePath2 -DestinationPath $destinationFolder2 -Force

# 創建Autoexec
& ".\install\CS2Konc_CFG_Autoexec.ps1"

# 輸出安裝完成消息
Write-Verbose "安裝完成"
# 最終提示
$finalMessage = "安裝完成，請重啟遊戲後測試。`n`n"
if ($feedbackMessage) {
    $finalMessage += "附註：`n$feedbackMessage"
}
# 顯示安裝完成的消息框
$result = [System.Windows.Forms.MessageBox]::Show($finalMessage, "安裝完成", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
