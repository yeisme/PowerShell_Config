# Theme.ps1

#! oh-my-posh 主题设置
function Set-MyPoshTheme {
    param (
        [string]$Theme = "powerline"
    )

    # For new oh-my-posh executable, use the config path or built-in themes
    # If $env:POSH_THEMES_PATH exists, use it; otherwise, assume themes are in default location
    if ($env:POSH_THEMES_PATH) {
        $configPath = "$env:POSH_THEMES_PATH/$Theme.omp.json"
    }
    else {
        # Use built-in themes or assume a default path
        $configPath = "$HOME/.config/oh-my-posh/themes/$Theme.omp.json"
    }

    oh-my-posh init pwsh --config $configPath | Invoke-Expression

    if ($Debug) {
        Write-Host "Theme $Theme loaded" -ForegroundColor Green
        Write-Host "oh-my-posh init pwsh --config $configPath" -ForegroundColor Green
    }
}


# 示例：设置默认主题
# Set-MyPoshTheme -Theme "dracula"

# 其他主题示例
# Set-MyPoshTheme -Theme ""
# Set-MyPoshTheme -Theme "mojada"
# Set-MyPoshTheme -Theme "jandedobbeleer"
# Set-MyPoshTheme -Theme "blueish"
# Set-MyPoshTheme -Theme "atomic"
# Set-MyPoshTheme -Theme "kali"
# Set-MyPoshTheme -Theme powerlevel10k_rainbow

# Get-PoshThemes # 查看所有主题

#! starship 主题设置
# Invoke-Expression (&starship init powershell)
