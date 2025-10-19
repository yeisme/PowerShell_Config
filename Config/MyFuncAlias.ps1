# MyFuncAlias.ps1

function Invoke-GitCloneDepth1 {
    param(
        [Parameter(Mandatory = $true)]
        [string]$repositoryUrl,
        # submodule
        [switch]$submodule = $false
    )

    if ($submodule) {
        git clone --depth=1 --recurse-submodules $repositoryUrl
        return
    }
    git clone --depth=1 $repositoryUrl 
}

function Invoke-PWSH {
    pwsh -NoProfile -NoExit @args
}

### git
Set-Alias gc1 Invoke-GitCloneDepth1

# pwsh
Set-Alias pd -Description "PowerShell Without Profile" Invoke-PWSH

### neovim
Set-Alias vi nvim
Set-Alias vim nvim
Set-Alias nd neovide
Set-Alias nt nvim-qt
Set-Alias which Get-Command

Set-Alias qtc C:\Qt\Tools\QtCreator\bin\qtcreator.exe

Set-Alias vs22 "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\devenv.exe"
