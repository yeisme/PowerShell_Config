# 定义一个哈希表来存储配置文件路径
$ConfigFiles = @{
    "Theme"         = "$PROFILE/../Config/Theme.ps1"
    "Function"      = "$PROFILE/../Config/MyFunction.ps1"
    "TabHelp"       = "$PROFILE/../Config/TabHelp.ps1"
    "ModulesImport" = "$PROFILE/../Config/ModulesImport.ps1"
    "MyFuncAlias"   = "$PROFILE/../Config/MyFuncAlias.ps1"
}

# 导入配置文件接口，Import-ConfigFiles

## 测试模块导入时间
# . $PROFILE/../PwshInterface.ps1 -ConfigFiles $ConfigFiles -Debug $true
. $PROFILE/../PwshInterface.ps1 -ConfigFiles $ConfigFiles

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }
