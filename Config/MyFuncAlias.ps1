# MyFuncAlias.ps1

function Invoke-GitCloneDepth1 {

    git clone --depth=1 @args
}

## git
Set-Alias gc1 Invoke-GitCloneDepth1
