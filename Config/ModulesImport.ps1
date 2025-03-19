# ModulesImport.ps1
# 引入模块，从 PSGallery 安装
# Install-Module -Name z -Scope CurrentUser -Force
# Install-Module -Name PSFzf -Scope CurrentUser -Force

# 定义要导入的模块列表
$modules = @(
    "z",
    "posh-git",
    "oh-my-posh",

    "PSFzf",
    "Microsoft.WinGet.Client"

    #f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module
    # "Microsoft.WinGet.CommandNotFound"
    #f45873b3-b655-43a6-b217-97c00aa0db58

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
