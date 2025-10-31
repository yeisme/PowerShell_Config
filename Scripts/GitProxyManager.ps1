#Requires -Version 7.0
<#
.SYNOPSIS
    Git 代理配置管理脚本

.DESCRIPTION
    方便地管理 Git 的 HTTP/HTTPS 代理配置，支持在家和公司环境之间快速切换

.EXAMPLE
    PS> .\GitProxyManager.ps1 -Action Set
    设置 Git 代理为 http://127.0.0.1:7897

.EXAMPLE
    PS> .\GitProxyManager.ps1 -Action Unset
    移除 Git 代理配置

.EXAMPLE
    PS> .\GitProxyManager.ps1 -Action Status
    显示当前 Git 代理配置状态

.NOTES
    使用 Git 命令行工具来管理配置
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [ValidateSet('Set', 'Unset', 'Status', 'Toggle')]
    [string]$Action = 'Status',
    
    [Parameter(Mandatory = $false)]
    [string]$ProxyUrl = 'http://127.0.0.1:7897',
    
    [Parameter(Mandatory = $false)]
    [switch]$Global
)

# 检查 Git 是否已安装
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git 未安装或不在 PATH 中"
    exit 1
}

<#
.INTERNAL
    获取当前的代理配置
#>
function Get-GitProxyConfig {
    param(
        [switch]$Global
    )
    
    $scope = if ($Global) { '--global' } else { '--local' }
    
    $httpProxy = git config $scope --get http.proxy 2>$null
    $httpsProxy = git config $scope --get https.proxy 2>$null
    
    return @{
        HTTP = $httpProxy
        HTTPS = $httpsProxy
        Scope = if ($Global) { 'Global' } else { 'Local' }
    }
}

<#
.INTERNAL
    设置代理配置
#>
function Set-GitProxyConfig {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProxyUrl,
        
        [switch]$Global
    )
    
    $scope = if ($Global) { '--global' } else { '--global' }
    
    try {
        git config $scope http.proxy $ProxyUrl
        git config $scope https.proxy $ProxyUrl
        
        Write-Host "✓ Git 代理已设置" -ForegroundColor Green
        Write-Host "  HTTP Proxy:  $ProxyUrl" -ForegroundColor Cyan
        Write-Host "  HTTPS Proxy: $ProxyUrl" -ForegroundColor Cyan
        Write-Host "  范围: $(if ($Global) { '全局' } else { '本地仓库' })" -ForegroundColor Yellow
    }
    catch {
        Write-Error "设置代理失败: $_"
    }
}

<#
.INTERNAL
    移除代理配置
#>
function Remove-GitProxyConfig {
    param(
        [switch]$Global
    )
    
    $scope = if ($Global) { '--global' } else { '--global' }
    
    try {
        git config $scope --unset http.proxy 2>$null
        git config $scope --unset https.proxy 2>$null
        
        Write-Host "✓ Git 代理已移除" -ForegroundColor Green
        Write-Host "  范围: $(if ($Global) { '全局' } else { '本地仓库' })" -ForegroundColor Yellow
    }
    catch {
        Write-Error "移除代理失败: $_"
    }
}

<#
.INTERNAL
    显示代理状态
#>
function Show-GitProxyStatus {
    param(
        [switch]$Global
    )
    
    $config = Get-GitProxyConfig -Global:$Global
    
    Write-Host "`nGit 代理配置状态" -ForegroundColor Cyan
    Write-Host "==================" -ForegroundColor Cyan
    Write-Host "范围: $($config.Scope)" -ForegroundColor Yellow
    
    if ($config.HTTP -or $config.HTTPS) {
        Write-Host "`n代理已启用:" -ForegroundColor Green
        if ($config.HTTP) {
            Write-Host "  HTTP:  $($config.HTTP)" -ForegroundColor White
        }
        if ($config.HTTPS) {
            Write-Host "  HTTPS: $($config.HTTPS)" -ForegroundColor White
        }
    }
    else {
        Write-Host "`n代理未设置" -ForegroundColor Yellow
    }
    Write-Host ""
}

<#
.INTERNAL
    切换代理状态
#>
function Toggle-GitProxyConfig {
    param(
        [Parameter(Mandatory = $true)]
        [string]$ProxyUrl,
        
        [switch]$Global
    )
    
    $config = Get-GitProxyConfig -Global:$Global
    
    if ($config.HTTP -or $config.HTTPS) {
        Write-Host "检测到代理已启用，正在移除..." -ForegroundColor Yellow
        Remove-GitProxyConfig -Global:$Global
    }
    else {
        Write-Host "检测到代理未设置，正在启用..." -ForegroundColor Yellow
        Set-GitProxyConfig -ProxyUrl $ProxyUrl -Global:$Global
    }
}

# 主逻辑
switch ($Action) {
    'Set' {
        Set-GitProxyConfig -ProxyUrl $ProxyUrl -Global:$Global
    }
    'Unset' {
        Remove-GitProxyConfig -Global:$Global
    }
    'Status' {
        Show-GitProxyStatus -Global:$Global
    }
    'Toggle' {
        Toggle-GitProxyConfig -ProxyUrl $ProxyUrl -Global:$Global
    }
}
