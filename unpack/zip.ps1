# UTF-8 編碼
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding($true)

# -----------------------------
# 設定版本與名稱
$version = "v1.3.2"
$name = "DreamWind"
$namefile = "DreamWind"

# 壓縮來源資料夾與輸出檔案
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$sourceFolder = Join-Path $scriptDir $namefile
$zipName = Join-Path $scriptDir ("$name" + "_" + "$version" + ".zip")

# 刪除舊的壓縮檔
if (Test-Path $zipName) {
    Write-Host "[！] 發現舊的壓縮檔，刪除中..."
    Remove-Item $zipName -Force
}

#開始提示
Write-Host "=========================================="
Write-Host "開始壓縮 '$namefile' 資料夾，版本號：$version..."
Write-Host "=========================================="

# 執行壓縮
7z a "$zipName" "$sourceFolder\*" -mx=9 -mm=Deflate64

# 取得壓縮後檔案大小
$size = (Get-Item $zipName).Length
$sizeKB = [math]::Round($size / 1KB)
$sizeMB = [math]::Round($size / 1MB, 2)

#完成提示
Write-Host "=========================================="
Write-Host "[✔] 壓縮完成！"
Write-Host "檔案位置：$zipName"
Write-Host "壓縮後大小：$size bytes ($sizeKB KB, 約 $sizeMB MB)"
Write-Host "=========================================="

# 等待使用者按鍵
Write-Host "請按任意鍵退出..."
$x = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
