# TabHelp.ps1

# 这个模块负责补全和历史记录，所以放在 TabHelp.ps1 中
Import-Module -Name PSReadLine -ErrorAction SilentlyContinue


## 自动加载 Config/TabHelpFile 的配置文件
$TabHelpConfig = Join-Path $PROFILE "..\Config\TabHelpFile"


$TabHelpConfigFile = Get-ChildItem -Path $TabHelpConfig -Filter *.ps1
foreach ($file in $TabHelpConfigFile) {

    . $file.FullName
    # Write-Host $file.FullName
}


# 修改配置策略
Set-PSReadLineOption -PredictionSource History # 设置预测源为历史记录

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete # 设置 Tab 为菜单补全和 Intellisense
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo # 设置 Ctrl+z 为撤销
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward # 设置向上键为后向搜索历史记录
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward # 设置向下键为前向搜索历史纪录
