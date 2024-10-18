# 設置控制台編碼為 UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

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

# 定義解壓縮目標路徑
$zipFilePath2 = ".\resource.zip"
$destinationFolder2 = "..\..\resource"

# 檢查目標資料夾是否存在，若不存在則創建
if (-not (Test-Path $destinationFolder2)) {
    New-Item -Path $destinationFolder2 -ItemType Directory
}

# 解壓縮文件
Expand-Archive -Path $zipFilePath2 -DestinationPath $destinationFolder2 -Force

# 輸出安裝完成消息
Write-Verbose "安裝完成"

# 創建 autoexec.cfg 並在第一行寫入內容
$autoexecPath = Join-Path -Path $currentDirectory -ChildPath "..\autoexec.cfg"
$content = "exec CS2Konc-CFG/CSKoncMod"

# 檢查 autoexec.cfg 是否存在
if (Test-Path $autoexecPath) {
    # 讀取現有內容
    $existingContent = Get-Content -Path $autoexecPath
    
    # 移除重複的 exec CS2Konc-CFG/CSKoncMod
    $existingContent = $existingContent | Where-Object { $_ -ne $content }
    
    # 將新內容添加到現有內容的前面
    $newContent = @($content) + $existingContent
    
    # 寫回文件
    Set-Content -Path $autoexecPath -Value $newContent -Force
} else {
    # 如果文件不存在，直接寫入新內容
    Set-Content -Path $autoexecPath -Value $content -Force
}

# 最終提示
$finalMessage = "安裝完成，請重啟遊戲後測試。"
if ($feedbackMessage) {
    $finalMessage += "附註：n$feedbackMessage"
}

# 顯示安裝完成的消息框
$result = [System.Windows.Forms.MessageBox]::Show($finalMessage, "安裝完成", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)