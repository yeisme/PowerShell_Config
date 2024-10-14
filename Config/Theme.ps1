# Theme.ps1

function Set-MyPoshTheme {
    param (
        [string]$Theme = "powerline"
    )

    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/$Theme.omp.json" | Invoke-Expression
}


# 示例：设置默认主题
Set-MyPoshTheme -Theme "mojada"

# 其他主题示例
# Set-MyPoshTheme -Theme ""
# Set-MyPoshTheme -Theme "jandedobbeleer"
# Set-MyPoshTheme -Theme "blueish"
# Set-MyPoshTheme -Theme "atomic"
# Set-MyPoshTheme -Theme "kali"

# Get-PoshThemes # 查看所有主题
