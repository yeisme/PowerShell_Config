# ModulesImport.ps1
# 引入模块，从 PSGallery 安装
# Install-Module -Name PSFzf -Scope CurrentUser -Force

# 定义要导入的模块列表
$modules = @(
    "posh-git",
    "PSFzf"
)

# 循环遍历并导入模块
foreach ($module in $modules) {

    if ($debug) {
        $startTime = Get-Date
    }

    Import-Module -Name $module -ErrorAction SilentlyContinue

    if ($debug) {
        $endTime = Get-Date
        $duration = ($endTime - $startTime).TotalMilliseconds
        Write-Host "模块 $module 加载时间: $duration 毫秒" -ForegroundColor Green
    }

}

# 模块配置
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PsFzfOption -EnableFd
Set-PsFzfOption -FdCommand 'fd --type f --hidden --follow --exclude .git'

fnm env --use-on-cd | Out-String | Invoke-Expression
