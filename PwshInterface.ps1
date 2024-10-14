param (
    [hashtable]$ConfigFiles
)

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

        # 记录开始时间
        $startTime = Get-Date

        # 调用函数注册环境变量
        Register-EnvironmentVariables -configName $configName -configPath $configPath
        . $configPath

        # 记录结束时间
        $endTime = Get-Date
        $duration = ($endTime - $startTime).TotalMilliseconds

        # Write-Host "配置文件 '$configName' 加载时间: $duration" -ForegroundColor Green

    }
    else {
        Write-Host "警告: 配置文件 '$configName' 不存在于路径 '$configPath'。" -ForegroundColor Yellow
    }
}
