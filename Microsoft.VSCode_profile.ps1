# VSCode PowerShell Extension 配置文件
# 注意: 此文件在 PowerShell Extension LSP 启动时也会被加载

# 检测是否在 PowerShell Editor Services 环境中运行
# $InPSEditorServices = $null -ne $psEditor

# 如果不在编辑器服务环境中,加载完整配置
# if (-not $InPSEditorServices) {
#     # 定义一个哈希表来存储配置文件路径
#     $ConfigFiles = @{
#         "Env"            = "$PROFILE/../Config/Env.ps1"
#         # "Theme"          = "$PROFILE/../Config/Theme.ps1"
#         "Function"       = "$PROFILE/../Config/MyFunction.ps1"
#         "TabHelp"        = "$PROFILE/../Config/TabHelp.ps1"
#         # "ModulesImport"  = "$PROFILE/../Config/ModulesImport.ps1"
#         "MyFuncAlias"    = "$PROFILE/../Config/MyFuncAlias.ps1"
#         "DockerFunction" = "$PROFILE/../Config/DockerFunction.ps1"
#     }

#     # 导入配置文件接口，Import-ConfigFiles
#     # 添加错误处理以防止 LSP 启动失败
#     try {
#         if (Test-Path "$PROFILE/../PwshInterface.ps1") {
#             . "$PROFILE/../PwshInterface.ps1" -ConfigFiles $ConfigFiles -ErrorAction Stop
#         }
#     } catch {
#         # 静默处理错误，防止影响 PowerShell Extension LSP 启动
#         Write-Warning "配置文件加载失败: $_"
#     }
# }
# else {
#     # 在编辑器服务环境中,只加载必要的最小配置
#     Write-Verbose "运行在 PowerShell Editor Services 环境中,跳过自定义配置加载"
# }
