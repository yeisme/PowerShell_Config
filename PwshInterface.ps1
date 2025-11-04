param (
    [hashtable]$ConfigFiles,
    [bool]$Debug = $false
)

# 注册环境变量
function Register-EnvironmentVariables {
    param (
        [string]$configName,
        [string]$configPath
    )
    try {
        # 注册同名环境变量
        [System.Environment]::SetEnvironmentVariable($configName, $configPath, [System.EnvironmentVariableTarget]::Process)
    } catch {
        Write-Warning "无法注册环境变量 '$configName': $_"
    }
}


# 循环遍历配置文件
foreach ($configName in $ConfigFiles.Keys) {
    $configPath = $ConfigFiles[$configName]
    if (Test-Path -Path $configPath) {

        if ($Debug) {
            $StartTime = Get-Date
        }

        try {
            # 调用函数注册环境变量
            Register-EnvironmentVariables -configName $configName -configPath $configPath
            . $configPath

            if ($Debug) {
                $EndTime = Get-Date
                $Duration = ($EndTime - $StartTime).TotalMilliseconds
                Write-Host "配置文件 $configName 加载时间: $Duration 毫秒" -ForegroundColor Green
            }
        } catch {
            Write-Warning "配置文件 '$configName' 加载失败: $_"
            if ($Debug) {
                Write-Error $_.Exception.Message
            }
        }

    }
    else {
        if ($Debug) {
            Write-Host "警告: 配置文件 '$configName' 不存在于路径 '$configPath'。" -ForegroundColor Yellow
        }
    }
}
