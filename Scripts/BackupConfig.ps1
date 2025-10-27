#Requires -Version 7.0
<#
.SYNOPSIS
    备份配置文件到 Backup 目录

.DESCRIPTION
    将定义在哈希表中的配置文件复制到 Backup 目录中，
    支持单个文件和文件夹的备份

.EXAMPLE
    PS> .\BackupConfig.ps1
    开始备份配置文件...

.NOTES
    脚本会在 Backup 目录中创建时间戳文件夹以组织备份
#>

# 获取脚本所在目录
$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectRoot = Split-Path -Parent $ScriptRoot
$BackupDir = Join-Path -Path $ProjectRoot -ChildPath "Backup"

# 定义要备份的文件哈希表
# Key: 文件源路径（支持 ~ 符号）
# Value: 备份时使用的新名称
$FilesToBackup = @{
    "~\.wezterm.lua"          = "wezterm.lua"
    "~\.gitconfig"            = "gitconfig"
}

# 也可以使用数组来定义备份文件（备注：数组版本）
$FilesToBackupArray = @(
    # @{
    #     Source = "~\.wezterm.lua"
    #     Destination = "wezterm.lua"
    # },
    # @{
    #     Source = "~\.config\nvim"
    #     Destination = "nvim"
    # },
    # @{
    #     Source = "~\.gitconfig"
    #     Destination = "gitconfig"
    # }
)

<#
.INTERNAL
    备份单个文件或文件夹的函数
#>
function Backup-Item {
    param(
        [Parameter(Mandatory = $true)]
        [string]$SourcePath,
        
        [Parameter(Mandatory = $true)]
        [string]$DestinationName,
        
        [Parameter(Mandatory = $true)]
        [string]$BackupDirectory
    )
    
    # 展开 ~ 符号为用户主目录
    $ExpandedSource = $SourcePath -replace '^~', $HOME
    
    # 检查源是否存在
    if (-not (Test-Path -Path $ExpandedSource)) {
        Write-Warning "源文件不存在: $SourcePath ($ExpandedSource)"
        return $false
    }
    
    # 构建目标路径
    $DestinationPath = Join-Path -Path $BackupDirectory -ChildPath $DestinationName
    
    try {
        # 如果目标已存在，创建备份
        if (Test-Path -Path $DestinationPath) {
            $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
            $backupName = "$DestinationName.$timestamp"
            $backupPath = Join-Path -Path $BackupDirectory -ChildPath $backupName
            
            Write-Host "目标已存在，移动旧备份: $DestinationName -> $backupName" -ForegroundColor Yellow
            
            if ((Get-Item -Path $ExpandedSource) -is [System.IO.DirectoryInfo]) {
                Move-Item -Path $DestinationPath -Destination $backupPath -Force -Verbose
            } else {
                Move-Item -Path $DestinationPath -Destination $backupPath -Force -Verbose
            }
        }
        
        # 复制文件或文件夹
        $item = Get-Item -Path $ExpandedSource
        if ($item -is [System.IO.DirectoryInfo]) {
            # 复制文件夹
            Copy-Item -Path $ExpandedSource -Destination $DestinationPath -Recurse -Force -Verbose
            Write-Host "✓ 成功备份文件夹: $SourcePath -> $DestinationName" -ForegroundColor Green
        } else {
            # 复制文件
            Copy-Item -Path $ExpandedSource -Destination $DestinationPath -Force -Verbose
            Write-Host "✓ 成功备份文件: $SourcePath -> $DestinationName" -ForegroundColor Green
        }
        
        return $true
    }
    catch {
        Write-Error "备份失败: $SourcePath`n错误: $_"
        return $false
    }
}

<#
.INTERNAL
    主备份函数
#>
function Invoke-ConfigBackup {
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]$BackupMap,
        
        [Parameter(Mandatory = $true)]
        [string]$TargetDirectory,
        
        [switch]$UseArray
    )
    
    # 创建 Backup 目录（如果不存在）
    if (-not (Test-Path -Path $TargetDirectory)) {
        New-Item -ItemType Directory -Path $TargetDirectory -Force | Out-Null
        Write-Host "✓ 创建 Backup 目录: $TargetDirectory" -ForegroundColor Green
    }
    
    $successCount = 0
    $failureCount = 0
    
    Write-Host "`n开始备份配置文件...`n" -ForegroundColor Cyan
    
    if ($UseArray) {
        # 使用数组备份
        foreach ($item in $BackupMap) {
            if (Backup-Item -SourcePath $item.Source -DestinationName $item.Destination -BackupDirectory $TargetDirectory) {
                $successCount++
            } else {
                $failureCount++
            }
        }
    } else {
        # 使用哈希表备份
        foreach ($source in $BackupMap.Keys) {
            $destination = $BackupMap[$source]
            if (Backup-Item -SourcePath $source -DestinationName $destination -BackupDirectory $TargetDirectory) {
                $successCount++
            } else {
                $failureCount++
            }
        }
    }
    
    Write-Host "`n备份完成!" -ForegroundColor Cyan
    Write-Host "成功: $successCount | 失败: $failureCount`n" -ForegroundColor Yellow
}

# 执行备份（使用哈希表）
Invoke-ConfigBackup -BackupMap $FilesToBackup -TargetDirectory $BackupDir

# 如果需要使用数组版本，取消下面的注释
# Invoke-ConfigBackup -BackupMap $FilesToBackupArray -TargetDirectory $BackupDir -UseArray
