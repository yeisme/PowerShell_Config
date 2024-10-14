# 定义一个哈希表来存储配置文件路径
$ConfigFiles = @{
    "Theme"       = "$PROFILE/../Config/Theme.ps1"
    "Function"    = "$PROFILE/../Config/MyFunction.ps1"
    # "TabHelp"       = "$PROFILE/../Config/TabHelp.ps1"
    # "ModulesImport" = "$PROFILE/../Config/ModulesImport.ps1"
    "MyFuncAlias" = "$PROFILE/../Config/MyFuncAlias.ps1"
}

# 导入配置文件接口，Import-ConfigFiles

. $PROFILE/../PwshInterface.ps1 -ConfigFiles $ConfigFiles
