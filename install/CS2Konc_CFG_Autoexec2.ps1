# 設定文件路徑和新內容
$autoexecPath = Join-Path -Path $currentDirectory -ChildPath "..\autoexec.cfg"

# 定義要匹配的新指令的關鍵字（正則表達式用）
$patterns = @(
    ".*joy_response_move\s+\d+.*",
    ".*joy_side_sensitivity\s+[\d.]+.*",
    ".*joy_forward_sensitivity\s+[\d.]+.*",
    ".*cl_scoreboard_mouse_enable_binding\s+\+attack2.*",
    ".*cl_quickinventory_filename\s+radial_quickinventory\.txt.*",
    ".*exec\s+CS2Konc_CFG/CSKoncMod.*",
    ".*CS2Konc_CFG/CSKoncMod.*",
    ".*CSKoncMod.*",
    ".*CS2Konc_CFG.*"
)

# 定義要新增的內容
$newLines = @(
    "joy_response_move 1",
    "joy_side_sensitivity 1.000000",
    "joy_forward_sensitivity 1.000000",
    "cl_scoreboard_mouse_enable_binding +attack2",
    "cl_quickinventory_filename radial_quickinventory.txt"
)

# 檢查 autoexec.cfg 是否存在
if (Test-Path $autoexecPath) {
    # 讀取現有內容
    $existingContent = Get-Content -Path $autoexecPath

    # 移除包含任何定義關鍵字的行
    foreach ($pattern in $patterns) {
        $existingContent = $existingContent | Where-Object { $_ -notmatch $pattern }
    }

    # 將新內容插入現有內容的最前面
    $newContent = $newLines + $existingContent

    # 寫回文件
    Set-Content -Path $autoexecPath -Value $newContent -Force
} else {
    # 如果文件不存在，直接寫入新內容
    Set-Content -Path $autoexecPath -Value $newLines -Force
}
