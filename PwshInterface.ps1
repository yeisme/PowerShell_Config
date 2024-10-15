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
    # 注册同名环境变量
    [System.Environment]::SetEnvironmentVariable($configName, $configPath, [System.EnvironmentVariableTarget]::Process)
}


# 循环遍历配置文件
foreach ($configName in $ConfigFiles.Keys) {
    $configPath = $ConfigFiles[$configName]
    if (Test-Path -Path $configPath) {

        if ($Debug) {
            $StartTime = Get-Date
        }

        # 调用函数注册环境变量
        Register-EnvironmentVariables -configName $configName -configPath $configPath
        . $configPath

        if ($Debug) {
            $EndTime = Get-Date
            $Duration = ($EndTime - $StartTime).TotalMilliseconds
            Write-Host "配置文件 $configName 加载时间: $Duration 毫秒" -ForegroundColor Red
        }

    }
    else {
        Write-Host "警告: 配置文件 '$configName' 不存在于路径 '$configPath'。" -ForegroundColor Yellow
    }
}
