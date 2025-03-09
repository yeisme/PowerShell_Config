# MyFuncAlias.ps1

function Invoke-GitCloneDepth1 {

    git clone --depth=1 @args
}

function Invoke-Eza {
    eza @args
}

function Invoke-PWSH {
    pwsh -NoProfile -NoExit @args
}

### git
Set-Alias gc1 Invoke-GitCloneDepth1

# eza
Set-Alias e Invoke-Eza

# pwsh
Set-Alias pd -Description "PowerShell Without Profile" Invoke-PWSH

### neovim

Set-Alias vi nvim
Set-Alias vim nvim
Set-Alias nd neovide
Set-Alias nt nvim-qt
