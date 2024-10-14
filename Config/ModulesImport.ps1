# ModulesImport.ps1
# 引入模块，从 PSGallery 安装

# 定义要导入的模块列表
$modules = @(
    "posh-git",
    "oh-my-posh",
    "z",

    "PSFzf",

    #f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module
    "Microsoft.WinGet.CommandNotFound"
    #f45873b3-b655-43a6-b217-97c00aa0db58

)

# 循环遍历并导入模块
foreach ($module in $modules) {
    Import-Module -Name $module -ErrorAction SilentlyContinue
}

# 模块配置

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PsFzfOption -EnableFd
Set-PsFzfOption -FdCommand 'fd --type f --hidden --follow --exclude .git'
