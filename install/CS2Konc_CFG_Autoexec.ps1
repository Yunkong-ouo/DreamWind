# 創建 autoexec.cfg 並在第一行寫入內容
$autoexecPath = Join-Path -Path $currentDirectory -ChildPath "..\autoexec.cfg"
$content = "exec CS2Konc_CFG/CSKoncMod"

# 檢查 autoexec.cfg 是否存在
if (Test-Path $autoexecPath) {
    # 讀取現有內容
    $existingContent = Get-Content -Path $autoexecPath
    
    # 使用正則表達式移除包含 exec CS2Konc_CFG/CSKoncMod 的行（不管前後有什麼）
    $existingContent = $existingContent | Where-Object { $_ -notmatch ".*exec\s+CS2Konc_CFG/CSKoncMod.*" }
    
    # 將新內容添加到現有內容的前面
    $newContent = @($content) + $existingContent
    
    # 寫回文件
    Set-Content -Path $autoexecPath -Value $newContent -Force
}
else {
    # 如果文件不存在，直接寫入新內容
    Set-Content -Path $autoexecPath -Value $content -Force
}
