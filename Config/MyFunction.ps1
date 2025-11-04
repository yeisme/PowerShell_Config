# MyFunction.ps1

### Github Copilot alias
function ghcs {
    # Debug support provided by common PowerShell function parameters, which is natively aliased as -d or -db
    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-7.4#-debug
    param(
        [Parameter()]
        [string]$Hostname,

        [ValidateSet('gh', 'git', 'shell')]
        [Alias('t')]
        [String]$Target = 'shell',

        [Parameter(Position = 0, ValueFromRemainingArguments)]
        [string]$Prompt
    )
    begin {
        # Create temporary file to store potential command user wants to execute when exiting
        $executeCommandFile = New-TemporaryFile

        # Store original value of GH_* environment variable
        $envGhDebug = $Env:GH_DEBUG
        $envGhHost = $Env:GH_HOST
    }
    process {
        if ($PSBoundParameters['Debug']) {
            $Env:GH_DEBUG = 'api'
        }

        $Env:GH_HOST = $Hostname

        gh copilot suggest -t $Target -s "$executeCommandFile" $Prompt
    }
    end {
        # Execute command contained within temporary file if it is not empty
        if ($executeCommandFile.Length -gt 0) {
            # Extract command to execute from temporary file
            $executeCommand = (Get-Content -Path $executeCommandFile -Raw).Trim()

            # Insert command into PowerShell up/down arrow key history
            [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($executeCommand)

            # Insert command into PowerShell history
            $now = Get-Date
            $executeCommandHistoryItem = [PSCustomObject]@{
                CommandLine        = $executeCommand
                ExecutionStatus    = [Management.Automation.Runspaces.PipelineState]::NotStarted
                StartExecutionTime = $now
                EndExecutionTime   = $now.AddSeconds(1)
            }
            Add-History -InputObject $executeCommandHistoryItem

            # Execute command
            Write-Host "`n"
            Invoke-Expression $executeCommand
        }
    }
    clean {
        # Clean up temporary file used to store potential command user wants to execute when exiting
        Remove-Item -Path $executeCommandFile

        # Restore GH_* environment variables to their original value
        $Env:GH_DEBUG = $envGhDebug
    }
}

function ghce {
    # Debug support provided by common PowerShell function parameters, which is natively aliased as -d or -db
    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-7.4#-debug
    param(
        [Parameter()]
        [string]$Hostname,

        [Parameter(Position = 0, ValueFromRemainingArguments)]
        [string[]]$Prompt
    )
    begin {
        # Store original value of GH_* environment variables
        $envGhDebug = $Env:GH_DEBUG
        $envGhHost = $Env:GH_HOST
    }
    process {
        if ($PSBoundParameters['Debug']) {
            $Env:GH_DEBUG = 'api'
        }

        $Env:GH_HOST = $Hostname

        gh copilot explain $Prompt
    }
    clean {
        # Restore GH_* environment variables to their original value
        $Env:GH_DEBUG = $envGhDebug
        $Env:GH_HOST = $envGhHost
    }
}

function msvc {
    Import-Module "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
    Enter-VsDevShell e427f47a -SkipAutomaticLocation -DevCmdArguments "-arch=x64 -host_arch=x64"
}

function emv {
    # Check if Emscripten is installed
    if (-not (Get-Command emcc -ErrorAction SilentlyContinue)) {
        Write-Host "Emscripten is not installed. Please install it first."
        return
    }

    # Activate Emscripten environment
    & emsdk activate latest
    & emcc --version
}

function cda {
#region mamba initialize
# !! Contents within this block are managed by 'mamba shell init' !!
$Env:MAMBA_ROOT_PREFIX = "C:\Users\ye\miniforge3"
$Env:MAMBA_EXE = "C:\Users\ye\miniforge3\Library\bin\mamba.exe"
(& $Env:MAMBA_EXE 'shell' 'hook' -s 'powershell' -r $Env:MAMBA_ROOT_PREFIX) | Out-String | Invoke-Expression
#endregion

}

function QT-VS {
    $env:QT_DIR="$QT\msvc2022_64"
    $env:QT6_DIR="$QT\msvc2022_64"
    $env:PATH = "$env:QT_DIR\bin;$env:PATH"
}

# 移除 QT-VS 设置的环境变量
function QT-RVS {
    $env:PATH = $env:PATH -replace [regex]::Escape("$QT\msvc2022_64\bin;"), ""
    $env:QT_DIR = $null
    $env:QT6_DIR = $null
}

function QT-MinGW {
    $env:QT_DIR="$QT\mingw_64"
    $env:QT6_DIR="$QT\mingw_64"
    $env:PATH = "$env:QT_DIR\bin;C:\Qt\Tools\mingw1310_64\bin\;$env:PATH"
}

function QT-RMinGW {
    $env:PATH = $env:PATH -replace [regex]::Escape("$QT\mingw_64\bin;C:\Qt\Tools\mingw1310_64\bin;"), ""
    $env:QT_DIR = $null
    $env:QT6_DIR = $null
}

function QT-LLVM {
    $env:QT_DIR="$QT\mingw1706_64"
    $env:QT6_DIR="$QT\mingw1706_64"
    $env:PATH = "$env:QT_DIR\bin;C:\Qt\Tools\llvm-mingw1706_64\bin;$env:PATH"
}

function QT-RLLVM {
    $env:PATH = $env:PATH -replace [regex]::Escape("$QT\mingw1706_64\bin;C:\Qt\Tools\llvm-mingw1706_64\bin;"), ""
    $env:QT_DIR = $null
    $env:QT6_DIR = $null
}

function cudnn-129 {
    $env:PATH = "C:\Program Files\NVIDIA\CUDNN\v9.13\bin\12.9\;$env:PATH"
}

function rcuda-129 {
    $env:PATH = $env:PATH -replace [regex]::Escape("C:\Program Files\NVIDIA\CUDNN\v9.13\bin\12.9;"), ""
}

function cudnn-130 {
    $env:PATH = "C:\Program Files\NVIDIA\CUDNN\v10.0\bin\13.0\;$env:PATH"
}

function rcuda-130 {
    $env:PATH = $env:PATH -replace [regex]::Escape("C:\Program Files\NVIDIA\CUDNN\v10.0\bin\13.0;"), ""
}

<#
.SYNOPSIS
    执行配置文件备份

.DESCRIPTION
    运行 BackupConfig.ps1 脚本，将定义的配置文件备份到 Backup 目录

.EXAMPLE
    PS> backup-config
    开始备份配置文件...
    ✓ 成功备份文件: ~/.wezterm.lua -> wezterm.lua
    ...
    备份完成!
    成功: 6 | 失败: 0

.NOTES
    此函数依赖 Scripts/BackupConfig.ps1 脚本的存在和可执行权限
#>
function backup-config {
    [CmdletBinding()]
    param()
    
    # PowerShell 配置目录位于 Documents\PowerShell
    $ProjectRoot = "$HOME\Documents\PowerShell"
    $BackupScript = Join-Path -Path $ProjectRoot -ChildPath "Scripts\BackupConfig.ps1"
    
    # 验证脚本是否存在
    if (-not (Test-Path -Path $BackupScript)) {
        Write-Error "备份脚本不存在: $BackupScript"
        return
    }
    
    try {
        Write-Host "执行配置备份..." -ForegroundColor Cyan
        & $BackupScript -Force
    }
    catch {
        Write-Error "执行备份脚本失败: $_"
    }
}

# 别名：bc 用于快速调用备份
Set-Alias -Name bc -Value backup-config -Scope Global -Option AllScope

<#
.SYNOPSIS
    Git 代理管理函数集

.DESCRIPTION
    提供便捷的函数来管理 Git 的 HTTP/HTTPS 代理配置
    - git-proxy-on: 启用代理（在家使用）
    - git-proxy-off: 禁用代理（在公司使用）
    - git-proxy-status: 查看当前代理状态
    - git-proxy-toggle: 切换代理状态

.EXAMPLE
    PS> git-proxy-on
    启用 Git 代理

.EXAMPLE
    PS> git-proxy-off
    禁用 Git 代理

.EXAMPLE
    PS> git-proxy-status
    查看当前代理配置

.EXAMPLE
    PS> git-proxy-toggle
    自动切换代理状态
#>

# 启用 Git 代理（在家使用）
function git-proxy-on {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$ProxyUrl = 'http://127.0.0.1:7897'
    )
    
    $ProjectRoot = "$HOME\Documents\PowerShell"
    $ProxyScript = Join-Path -Path $ProjectRoot -ChildPath "Scripts\GitProxyManager.ps1"
    
    if (Test-Path -Path $ProxyScript) {
        & $ProxyScript -Action Set -ProxyUrl $ProxyUrl -Global
    }
    else {
        Write-Warning "未找到 GitProxyManager.ps1 脚本，使用 Git 命令直接设置"
        git config --global http.proxy $ProxyUrl
        git config --global https.proxy $ProxyUrl
        Write-Host "✓ Git 代理已启用: $ProxyUrl" -ForegroundColor Green
    }
}

# 禁用 Git 代理（在公司使用）
function git-proxy-off {
    [CmdletBinding()]
    param()
    
    $ProjectRoot = "$HOME\Documents\PowerShell"
    $ProxyScript = Join-Path -Path $ProjectRoot -ChildPath "Scripts\GitProxyManager.ps1"
    
    if (Test-Path -Path $ProxyScript) {
        & $ProxyScript -Action Unset -Global
    }
    else {
        Write-Warning "未找到 GitProxyManager.ps1 脚本，使用 Git 命令直接移除"
        git config --global --unset http.proxy 2>$null
        git config --global --unset https.proxy 2>$null
        Write-Host "✓ Git 代理已禁用" -ForegroundColor Green
    }
}

# 查看 Git 代理状态
function git-proxy-status {
    [CmdletBinding()]
    param()
    
    $ProjectRoot = "$HOME\Documents\PowerShell"
    $ProxyScript = Join-Path -Path $ProjectRoot -ChildPath "Scripts\GitProxyManager.ps1"
    
    if (Test-Path -Path $ProxyScript) {
        & $ProxyScript -Action Status -Global
    }
    else {
        Write-Warning "未找到 GitProxyManager.ps1 脚本，使用 Git 命令直接查询"
        $httpProxy = git config --global --get http.proxy
        $httpsProxy = git config --global --get https.proxy
        
        Write-Host "`nGit 代理配置状态" -ForegroundColor Cyan
        Write-Host "==================" -ForegroundColor Cyan
        if ($httpProxy -or $httpsProxy) {
            Write-Host "代理已启用:" -ForegroundColor Green
            if ($httpProxy) { Write-Host "  HTTP:  $httpProxy" }
            if ($httpsProxy) { Write-Host "  HTTPS: $httpsProxy" }
        }
        else {
            Write-Host "代理未设置" -ForegroundColor Yellow
        }
        Write-Host ""
    }
}

# 切换 Git 代理状态
function git-proxy-toggle {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$ProxyUrl = 'http://127.0.0.1:7897'
    )
    
    $ProjectRoot = "$HOME\Documents\PowerShell"
    $ProxyScript = Join-Path -Path $ProjectRoot -ChildPath "Scripts\GitProxyManager.ps1"
    
    if (Test-Path -Path $ProxyScript) {
        & $ProxyScript -Action Toggle -ProxyUrl $ProxyUrl -Global
    }
    else {
        Write-Warning "未找到 GitProxyManager.ps1 脚本，使用 Git 命令直接切换"
        $httpProxy = git config --global --get http.proxy
        if ($httpProxy) {
            git config --global --unset http.proxy 2>$null
            git config --global --unset https.proxy 2>$null
            Write-Host "✓ Git 代理已禁用" -ForegroundColor Green
        }
        else {
            git config --global http.proxy $ProxyUrl
            git config --global https.proxy $ProxyUrl
            Write-Host "✓ Git 代理已启用: $ProxyUrl" -ForegroundColor Green
        }
    }
}

# 设置别名
Set-Alias -Name gpon -Value git-proxy-on -Scope Global -Option AllScope
Set-Alias -Name gpoff -Value git-proxy-off -Scope Global -Option AllScope
Set-Alias -Name gpst -Value git-proxy-status -Scope Global -Option AllScope
Set-Alias -Name gptg -Value git-proxy-toggle -Scope Global -Option AllScope

# 自动加载：如果未定义 Get-SshHosts 则尝试点源 Scripts\List-SshHosts.ps1
try {
    if (-not (Get-Command -Name Get-SshHosts -ErrorAction SilentlyContinue)) {
        $scriptPath = Join-Path -Path $PSScriptRoot -ChildPath "..\Scripts\List-SshHosts.ps1"
        $scriptPath = [System.IO.Path]::GetFullPath($scriptPath)
        if (Test-Path $scriptPath) {
            try {
                . $scriptPath
            } catch {
                Write-Verbose "Failed to source List-SshHosts.ps1: $_"
            }
        }
    }
} catch {
    # 安全降级：不要抛出错误以免破坏配置加载
}
