

function slim {
    <#
    .SYNOPSIS
    运行 dslim/slim Docker 容器

    .DESCRIPTION
    该函数调用 Docker 命令运行 dslim/slim 容器，使用参数：
      -it：交互模式
      --rm：容器退出后自动删除
      -v "/var/run/docker.sock:/var/run/docker.sock"：挂载 Docker 套接字

    .EXAMPLE
    slim

    .NOTES
    请确保已安装 Docker 并且当前用户有访问 /var/run/docker.sock 的权限
    #>
    param(
        [string[]]$dockerArgs
    )

    docker run -it --rm -v "/var/run/docker.sock:/var/run/docker.sock" dslim/slim @dockerArgs
}