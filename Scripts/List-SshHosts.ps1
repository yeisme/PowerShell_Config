<#
List-SshHosts.ps1
解析 ~/.ssh/config 并列出 Host 条目。

更新内容:
 - 将函数改为以 "ssh-" 前缀命名：`ssh-get-hosts`, `ssh-show-hosts`。
 - 增加过滤、JSON 输出、复制到剪贴板、生成 ssh 命令行、以及简单的 TCP 连通性检测。
 - 为 ssh.exe 命令提供自动补全支持（按 Tab 键补全主机名）。

示例:
    # 导入脚本
    . "c:\Users\ye\Documents\PowerShell\Scripts\List-SshHosts.ps1"
    
    # 列出所有主机
    ssh-get-hosts | ssh-show-hosts
    
    # 展开配置并输出 JSON
    ssh-get-hosts -SshExpand | ssh-show-hosts -Json
    
    # 按名称过滤并复制命令
    ssh-show-hosts -HostName s101 -AsCommand
    
    # 自动补全示例（直接使用 ssh 命令）
    ssh <Tab>  # 会显示所有可用的 Host 列表

参数说明（高层）:
 -Path: 指定 SSH config 文件路径 (默认: $env:USERPROFILE\.ssh\config)
 -SshExpand: 使用 `ssh -G <host>` 展开最终配置（要求系统 ssh 可用）
 -TestConnection: 对 HostName:Port 进行 TCP 检测并添加 Reachable 字段
 -Filter/-HostName/-Pattern: 显示/过滤特定条目
 -Json: 将输出转换为 JSON
 -AsCommand: 返回 ssh 命令字符串而不是表格
 -Copy: 将单条目标生成的 ssh 命令复制到剪贴板
#>

function ssh-get-hosts {
    <#
    .SYNOPSIS
    解析 SSH config 文件并返回所有主机配置信息
    
    .DESCRIPTION
    读取 ~/.ssh/config 文件，解析所有 Host 条目及其配置参数（HostName、Port、User、ProxyJump、IdentityFile 等）
    
    .PARAMETER Path
    SSH config 文件路径，默认为 $env:USERPROFILE\.ssh\config
    
    .PARAMETER SshExpand
    是否使用 ssh -G 命令展开最终配置（需要系统中有 ssh 可用）
    
    .PARAMETER TestConnection
    是否对每个主机进行 TCP 连通性测试
    
    .EXAMPLE
    ssh-get-hosts | ssh-show-hosts
    
    .EXAMPLE
    ssh-get-hosts -SshExpand -TestConnection
    #>
    
    [CmdletBinding()]
    param(
        [string]$Path = "$env:USERPROFILE\.ssh\config",
        [switch]$SshExpand,
        [switch]$TestConnection
    )

    # 检查 SSH config 文件是否存在
    if (-not (Test-Path $Path)) {
        Throw "SSH config not found: $Path"
    }

    # 读取 SSH config 文件内容
    $rawLines = Get-Content -Path $Path -ErrorAction Stop -Encoding utf8

    # 初始化变量：$groups 存储所有 Host 组，$currentGroup 存储当前处理的 Host 组
    $groups = @()
    $currentGroup = $null

    # 遍历每一行，解析 Host 配置
    foreach ($line in $rawLines) {
        if ($null -eq $line) { continue }
        $trim = $line.Trim()
        # 跳过空行和注释行
        if ($trim -eq '' -or $trim.StartsWith('#')) { continue }

        # 匹配 Host 行（可能有多个别名）
        if ($trim -match '^(?i)Host\s+(.*)$') {
            # 保存前一个 Host 组
            if ($currentGroup) { $groups += $currentGroup }
            # 解析 Host 后面的所有别名
            $names = $matches[1] -split '\s+' | Where-Object { $_ -ne '' }
            # 创建新的 Host 组
            $currentGroup = [ordered]@{ Names = $names; HostName = $null; Port = $null; User = $null; ProxyJump = $null; IdentityFile = $null; Raw = @() }
            continue
        }

        # 如果还没有遇到 Host 行，跳过
        if (-not $currentGroup) { continue }

        # 将原始行添加到 Raw 数组
        $currentGroup.Raw += $trim
        # 根据不同的配置项进行解析
        if ($trim -match '^(?i)HostName\s+(.*)$') { $currentGroup.HostName = $matches[1].Trim() }
        elseif ($trim -match '^(?i)Port\s+(\d+)$') { $currentGroup.Port = [int]$matches[1] }
        elseif ($trim -match '^(?i)User\s+(.*)$') { $currentGroup.User = $matches[1].Trim() }
        elseif ($trim -match '^(?i)ProxyJump\s+(.*)$') { $currentGroup.ProxyJump = $matches[1].Trim() }
        elseif ($trim -match '^(?i)IdentityFile\s+(.*)$') { $currentGroup.IdentityFile = $matches[1].Trim() }
    }

    # 保存最后一个 Host 组
    if ($currentGroup) { $groups += $currentGroup }

    # 将 Host 组展开为单个主机对象
    $hosts = foreach ($g in $groups) {
        foreach ($n in $g.Names) {
            # 为每个 Host 别名创建一个对象
            $h = [PSCustomObject]@{
                Host = $n
                HostName = if ($g.HostName) { $g.HostName } else { $n }
                Port = if ($g.Port) { $g.Port } else { 22 }
                User = $g.User
                ProxyJump = $g.ProxyJump
                IdentityFile = $g.IdentityFile
                Raw = $g.Raw
            }

            # 如果指定 -SshExpand，使用 ssh -G 展开最终配置
            if ($SshExpand) {
                try {
                    $expanded = & ssh -G $n 2>$null
                    if ($LASTEXITCODE -eq 0 -and $expanded) {
                        $h | Add-Member -NotePropertyName ExpandedConfig -NotePropertyValue ($expanded -join "`n") -Force
                    }
                } catch {
                    # 忽略展开错误
                }
            }

            # 如果指定 -TestConnection，进行 TCP 连通性测试
            if ($TestConnection) {
                try {
                    $tc = Test-NetConnection -ComputerName $h.HostName -Port $h.Port -WarningAction SilentlyContinue
                    if ($null -ne $tc) {
                        $h | Add-Member -NotePropertyName Reachable -NotePropertyValue ([bool]$tc.TcpTestSucceeded) -Force
                    } else {
                        $h | Add-Member -NotePropertyName Reachable -NotePropertyValue $false -Force
                    }
                } catch {
                    $h | Add-Member -NotePropertyName Reachable -NotePropertyValue $false -Force
                }
            }

            # 返回主机对象
            $h
        }
    }

    # 返回所有主机对象的数组
    return ,$hosts
}

function ssh-show-hosts {
    <#
    .SYNOPSIS
    显示和过滤 SSH 主机信息
    
    .DESCRIPTION
    以表格、JSON 或其他格式显示主机配置。支持按名称、通配符或正则表达式过滤
    
    .PARAMETER InputObject
    接收管道输入的主机对象
    
    .PARAMETER HostName
    精确匹配的主机名称（不区分大小写）
    
    .PARAMETER Filter
    通配符过滤（*Filter*）
    
    .PARAMETER Pattern
    正则表达式模式过滤
    
    .PARAMETER Json
    输出为 JSON 格式
    
    .PARAMETER Copy
    将生成的 ssh 命令复制到剪贴板
    
    .PARAMETER AsCommand
    返回 ssh 命令行而不是表格
    
    .EXAMPLE
    ssh-get-hosts | ssh-show-hosts
    
    .EXAMPLE
    ssh-show-hosts -Filter dev
    #>
    
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        $InputObject,
        [string]$HostName,
        [string]$Filter,
        [string]$Pattern,
        [switch]$Json,
        [switch]$Copy,
        [switch]$AsCommand
    )

    # 初始化集合变量以收集管道输入
    begin { $collected = @() }
    process {
        if ($PSBoundParameters.ContainsKey('InputObject') -or $null -ne $InputObject) {
            $collected += $InputObject
        }
    }
    end {
        # 如果没有管道输入，则获取所有主机
        if ($collected.Count -eq 0) {
            $collected = ssh-get-hosts
        }

        # 应用简单的过滤条件
        if ($HostName) { $collected = $collected | Where-Object { $_.Host -ieq $HostName } }
        if ($Filter) { $collected = $collected | Where-Object { $_.Host -like "*$Filter*" -or $_.HostName -like "*$Filter*" } }
        if ($Pattern) { $collected = $collected | Where-Object { $_.Host -match $Pattern -or $_.HostName -match $Pattern } }

        # 如果只有一个对象且要求生成/复制命令
        if ($collected.Count -eq 1 -and ($Copy -or $AsCommand)) {
            $h = $collected[0]
            # 构建 ssh 命令行
            $cmd = "ssh"
            if ($h.IdentityFile) { $cmd += " -i `"$($h.IdentityFile)`"" }
            if ($h.Port -and $h.Port -ne 22) { $cmd += " -p $($h.Port)" }
            if ($h.User) { $cmd += " $($h.User)@$($h.HostName)" } else { $cmd += " $($h.HostName)" }

            # 复制到剪贴板
            if ($Copy) {
                try { $cmd | Set-Clipboard; Write-Verbose "已复制到剪贴板" -Verbose } catch { Write-Warning "无法复制到剪贴板: $_" }
            }

            # 返回命令
            if ($AsCommand) { Write-Output $cmd; return }
        }

        # 输出为 JSON 格式
        if ($Json) {
            $collected | ConvertTo-Json -Depth 5
            return
        }

        # 默认表格视图：定义要显示的列
        $cols = @{Expression={$_.Host};Label='Host';Width=20}, `
                @{Expression={$_.HostName};Label='HostName';Width=25}, `
                @{Expression={$_.Port};Label='Port'}, `
                @{Expression={$_.User};Label='User'}, `
                @{Expression={$_.ProxyJump};Label='ProxyJump'}, `
                @{Expression={$_.IdentityFile};Label='IdentityFile';Width=40}
        $collected | Format-Table $cols -AutoSize
    }
}

# 导出函数以便点源时可用
try {
    if ($null -ne $PSModuleInfo) {
        Export-ModuleMember -Function ssh-get-hosts, ssh-show-hosts -ErrorAction SilentlyContinue
    }
} catch {
    # ignore in non-module context
}

# ===============================================================================
# SSH 命令自动补全注册器
# 为 ssh.exe 和 ssh 命令提供主机名自动补全支持
# ===============================================================================

$sshCompleterScriptBlock = {
    param($wordToComplete, $commandAst, $cursorPosition)
    
    # 获取命令行中的所有元素
    $ast = $commandAst.CommandElements
    
    # 检查是否为第一个参数（ssh 命令本身 + 要补全的参数）
    # ssh <cursor> 或 ssh dev<cursor> 等情况
    if ($ast.Count -le 1) {
        # 只有命令本身，没有参数
    } else {
        # 检查倒数第二个元素是否是选项（以 - 开头）
        # 如果不是选项，说明我们在补全主机名
        $lastElement = $ast[-1].Extent.Text
        $secondLast = $ast[-2].Extent.Text
        
        # 如果最后一个参数是选项（如 -p, -l 等），不补全主机名
        if ($lastElement -match '^-') {
            return
        }
        
        # 检查是否已经有非选项参数了
        $hasHostAlready = $false
        for ($i = 1; $i -lt $ast.Count - 1; $i++) {
            $elem = $ast[$i].Extent.Text
            if ($elem -notmatch '^-' -and $elem -ne '') {
                $hasHostAlready = $true
                break
            }
        }
        
        # 如果已经有主机参数了，不再补全
        if ($hasHostAlready) {
            return
        }
    }
    
    # 获取所有主机名：直接解析 SSH config 文件
    try {
        $sshConfigPath = "$env:USERPROFILE\.ssh\config"
        if (Test-Path $sshConfigPath) {
            $allHosts = @()
            # 读取 SSH config 文件
            $rawLines = Get-Content -Path $sshConfigPath -Encoding utf8 -ErrorAction SilentlyContinue
            
            foreach ($line in $rawLines) {
                if ($null -eq $line) { continue }
                $trim = $line.Trim()
                # 匹配 Host 行并提取所有别名
                if ($trim -match '^(?i)Host\s+(.*)$') {
                    $names = $matches[1] -split '\s+' | Where-Object { $_ -ne '' -and $_ -ne '*' }
                    $allHosts += $names
                }
            }
            
            # 过滤并返回补全结果
            $allHosts | Sort-Object -Unique | Where-Object { $_ -like "$wordToComplete*" } | ForEach-Object {
                [System.Management.Automation.CompletionResult]::new(
                    $_,
                    $_,
                    'ParameterValue',
                    "SSH Host: $_"
                )
            }
        }
    } catch {
        # 补全器失败时忽略，不显示错误
    }
}

# 注册 ssh 和 ssh.exe 的参数补全器
if ($PSVersionTable.PSVersion.Major -ge 5) {
    try {
        # 为 ssh 命令注册补全器
        Register-ArgumentCompleter -CommandName ssh -ScriptBlock $sshCompleterScriptBlock -ErrorAction SilentlyContinue
        # 为 ssh.exe 命令注册补全器
        Register-ArgumentCompleter -CommandName ssh.exe -ScriptBlock $sshCompleterScriptBlock -ErrorAction SilentlyContinue
    } catch {
        Write-Warning "Failed to register ssh completer: $_"
    }
}

# End of file
