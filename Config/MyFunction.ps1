# MyFunction.ps1

# Conda 初始化
function cda {
    param (
        [string]$CondaPath = "G:\CodeDev\conda\Scripts\conda.exe"
    )

    If (Test-Path $CondaPath) {
        # 设置环境变量以隐藏 Conda 环境提示
        [System.Environment]::SetEnvironmentVariable('CONDA_CHANGEPS1', 'false', [System.EnvironmentVariableTarget]::Process)

        # 执行 Conda 初始化
        (& $CondaPath "shell.powershell" "hook") | Out-String | ? { $_ } | Invoke-Expression
    }
    else {
        Write-Host "Conda executable not found at: $CondaPath" -ForegroundColor Red
    }

}
