
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'easytier-core' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'easytier-core'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'easytier-core' {
            [CompletionResult]::new('-w', '-w', [CompletionResultType]::ParameterName, '配置服务器地址。允许格式： 完整URL：--config-server udp://127.0.0.1:22020/admin 仅用户名：--config-server admin，将使用官方的服务器 ')
            [CompletionResult]::new('--config-server', '--config-server', [CompletionResultType]::ParameterName, '配置服务器地址。允许格式： 完整URL：--config-server udp://127.0.0.1:22020/admin 仅用户名：--config-server admin，将使用官方的服务器 ')
            [CompletionResult]::new('--machine-id', '--machine-id', [CompletionResultType]::ParameterName, 'Web 配置服务器通过 machine id 来识别机器，用于断线重连后的配置恢复，需要保证唯一且固定不变。默认从系统获得。 ')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, '配置文件路径，注意：命令行中的配置的选项会覆盖配置文件中的选项')
            [CompletionResult]::new('--config-file', '--config-file', [CompletionResultType]::ParameterName, '配置文件路径，注意：命令行中的配置的选项会覆盖配置文件中的选项')
            [CompletionResult]::new('--network-name', '--network-name', [CompletionResultType]::ParameterName, '用于标识此VPN网络的网络名称')
            [CompletionResult]::new('--network-secret', '--network-secret', [CompletionResultType]::ParameterName, '网络密钥，用于验证此节点属于VPN网络')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, '此VPN节点的IPv4地址，如果为空，则此节点将仅转发数据包，不会创建TUN设备')
            [CompletionResult]::new('--ipv4', '--ipv4', [CompletionResultType]::ParameterName, '此VPN节点的IPv4地址，如果为空，则此节点将仅转发数据包，不会创建TUN设备')
            [CompletionResult]::new('--ipv6', '--ipv6', [CompletionResultType]::ParameterName, '此VPN节点的IPv6地址，可与IPv4一起使用以进行双栈操作')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, '由Easytier自动确定并设置IP地址，默认从10.0.0.1开始。警告：在使用DHCP时，如果网络中出现IP冲突，IP将自动更改。')
            [CompletionResult]::new('--dhcp', '--dhcp', [CompletionResultType]::ParameterName, '由Easytier自动确定并设置IP地址，默认从10.0.0.1开始。警告：在使用DHCP时，如果网络中出现IP冲突，IP将自动更改。')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, '最初要连接的对等节点')
            [CompletionResult]::new('--peers', '--peers', [CompletionResultType]::ParameterName, '最初要连接的对等节点')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, '使用公共共享节点来发现对等节点')
            [CompletionResult]::new('--external-node', '--external-node', [CompletionResultType]::ParameterName, '使用公共共享节点来发现对等节点')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, '将本地网络导出到VPN中的其他对等节点，例如：10.0.0.0/24。 还支持将代理网络映射到其他CIDR，例如：10.0.0.0/24->192.168.0.0/24 其他对等节点可以通过 IP 192.168.0.1 来访问 10.0.0.1 ')
            [CompletionResult]::new('--proxy-networks', '--proxy-networks', [CompletionResultType]::ParameterName, '将本地网络导出到VPN中的其他对等节点，例如：10.0.0.0/24。 还支持将代理网络映射到其他CIDR，例如：10.0.0.0/24->192.168.0.0/24 其他对等节点可以通过 IP 192.168.0.1 来访问 10.0.0.1 ')
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, '用于管理的RPC门户地址。0表示随机端口，12345表示在localhost的12345上监听，0.0.0.0:12345表示在所有接口的12345上监听。默认是0，首先尝试15888')
            [CompletionResult]::new('--rpc-portal', '--rpc-portal', [CompletionResultType]::ParameterName, '用于管理的RPC门户地址。0表示随机端口，12345表示在localhost的12345上监听，0.0.0.0:12345表示在所有接口的12345上监听。默认是0，首先尝试15888')
            [CompletionResult]::new('--rpc-portal-whitelist', '--rpc-portal-whitelist', [CompletionResultType]::ParameterName, 'RPC门户白名单，仅允许这些地址访问RPC门户，例如：127.0.0.1/32,127.0.0.0/8,::1/128')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, '监听器用于接受连接，允许以下格式： 端口号：<11010>，意味着tcp/udp将在11010端口监听，ws/wss将在11010和11011端口监听，wg将在11011端口监听。 url：<tcp://0.0.0.0:11010>，其中tcp可以是tcp、udp、ring、wg、ws、wss协议。 协议和端口对：<proto:port>，例如wg:11011，表示使用WireGuard协议在11011端口监听。URL 和 协议端口对 可以多次出现。 ')
            [CompletionResult]::new('--listeners', '--listeners', [CompletionResultType]::ParameterName, '监听器用于接受连接，允许以下格式： 端口号：<11010>，意味着tcp/udp将在11010端口监听，ws/wss将在11010和11011端口监听，wg将在11011端口监听。 url：<tcp://0.0.0.0:11010>，其中tcp可以是tcp、udp、ring、wg、ws、wss协议。 协议和端口对：<proto:port>，例如wg:11011，表示使用WireGuard协议在11011端口监听。URL 和 协议端口对 可以多次出现。 ')
            [CompletionResult]::new('--mapped-listeners', '--mapped-listeners', [CompletionResultType]::ParameterName, '手动指定监听器的公网地址，其他节点可以使用该地址连接到本节点。例如：tcp://123.123.123.123:11223，可以指定多个。')
            [CompletionResult]::new('--hostname', '--hostname', [CompletionResultType]::ParameterName, '用于标识此设备的主机名')
            [CompletionResult]::new('-m', '-m', [CompletionResultType]::ParameterName, '实例名称，用于在同一台机器上标识此VPN节点')
            [CompletionResult]::new('--instance-name', '--instance-name', [CompletionResultType]::ParameterName, '实例名称，用于在同一台机器上标识此VPN节点')
            [CompletionResult]::new('--vpn-portal', '--vpn-portal', [CompletionResultType]::ParameterName, '定义VPN门户的URL，允许其他VPN客户端连接。示例：wg://0.0.0.0:11010/10.14.14.0/24，表示VPN门户是监听在vpn.example.com:11010的wireguard服务器，VPN客户端在10.14.14.0/24网络中')
            [CompletionResult]::new('--default-protocol', '--default-protocol', [CompletionResultType]::ParameterName, '连接到对等节点时使用的默认协议')
            [CompletionResult]::new('-u', '-u', [CompletionResultType]::ParameterName, '禁用对等节点通信的加密，默认为false，必须与对等节点相同')
            [CompletionResult]::new('--disable-encryption', '--disable-encryption', [CompletionResultType]::ParameterName, '禁用对等节点通信的加密，默认为false，必须与对等节点相同')
            [CompletionResult]::new('--encryption-algorithm', '--encryption-algorithm', [CompletionResultType]::ParameterName, '要使用的加密算法，支持：''''（默认aes-gcm）、''xor''、''chacha20''、''aes-gcm''、''aes-gcm-256''、''openssl-aes128-gcm''、''openssl-aes256-gcm''、''openssl-chacha20''')
            [CompletionResult]::new('--multi-thread', '--multi-thread', [CompletionResultType]::ParameterName, '使用多线程运行时，默认为单线程')
            [CompletionResult]::new('--multi-thread-count', '--multi-thread-count', [CompletionResultType]::ParameterName, '使用的线程数，默认为2，仅在多线程模式下有效。取值必须大于2')
            [CompletionResult]::new('--disable-ipv6', '--disable-ipv6', [CompletionResultType]::ParameterName, '不使用IPv6')
            [CompletionResult]::new('--dev-name', '--dev-name', [CompletionResultType]::ParameterName, '可选的TUN接口名称')
            [CompletionResult]::new('--mtu', '--mtu', [CompletionResultType]::ParameterName, 'TUN设备的MTU，默认为非加密时为1380，加密时为1360')
            [CompletionResult]::new('--latency-first', '--latency-first', [CompletionResultType]::ParameterName, '延迟优先模式，将尝试使用最低延迟路径转发流量，默认使用最短路径')
            [CompletionResult]::new('--exit-nodes', '--exit-nodes', [CompletionResultType]::ParameterName, '转发所有流量的出口节点，虚拟IPv4地址，优先级由列表顺序决定')
            [CompletionResult]::new('--enable-exit-node', '--enable-exit-node', [CompletionResultType]::ParameterName, '允许此节点成为出口节点')
            [CompletionResult]::new('--proxy-forward-by-system', '--proxy-forward-by-system', [CompletionResultType]::ParameterName, '通过系统内核转发子网代理数据包，禁用内置NAT')
            [CompletionResult]::new('--no-tun', '--no-tun', [CompletionResultType]::ParameterName, '不创建TUN设备，可以使用子网代理访问节点')
            [CompletionResult]::new('--use-smoltcp', '--use-smoltcp', [CompletionResultType]::ParameterName, '为子网代理和 KCP 代理启用smoltcp堆栈')
            [CompletionResult]::new('--manual-routes', '--manual-routes', [CompletionResultType]::ParameterName, '手动分配路由CIDR，将禁用子网代理和从对等节点传播的wireguard路由。例如：192.168.0.0/16')
            [CompletionResult]::new('--relay-network-whitelist', '--relay-network-whitelist', [CompletionResultType]::ParameterName, '仅转发白名单网络的流量，支持通配符字符串。多个网络名称间可以使用英文空格间隔。 如果本地网络（使用 network_name 分配）不在白名单中，如果没有其他路由路径可用，流量仍然可以转发。 如果该参数为空，则禁用转发。默认允许所有网络。 例如：''*''（所有网络），''def*''（以def为前缀的网络），''net1 net2''（只允许net1和net2）" ')
            [CompletionResult]::new('--disable-p2p', '--disable-p2p', [CompletionResultType]::ParameterName, '禁用P2P通信，只通过--peers指定的节点转发数据包')
            [CompletionResult]::new('--disable-udp-hole-punching', '--disable-udp-hole-punching', [CompletionResultType]::ParameterName, '禁用UDP打洞功能')
            [CompletionResult]::new('--disable-sym-hole-punching', '--disable-sym-hole-punching', [CompletionResultType]::ParameterName, '如果为true，则禁用基于生日攻击的对称NAT (NAT4) UDP 打洞功能，该打洞方式可能会被运营商封锁')
            [CompletionResult]::new('--relay-all-peer-rpc', '--relay-all-peer-rpc', [CompletionResultType]::ParameterName, '转发所有对等节点的RPC数据包，即使对等节点不在转发网络白名单中。这可以帮助白名单外网络中的对等节点建立P2P连接。')
            [CompletionResult]::new('--socks5', '--socks5', [CompletionResultType]::ParameterName, '启用 socks5 服务器，允许 socks5 客户端访问虚拟网络. 格式: <端口>，例如：1080')
            [CompletionResult]::new('--compression', '--compression', [CompletionResultType]::ParameterName, '要使用的压缩算法，支持 none、zstd。默认为 none')
            [CompletionResult]::new('--bind-device', '--bind-device', [CompletionResultType]::ParameterName, '将连接器的套接字绑定到物理设备以避免路由问题。比如子网代理网段与某节点的网段冲突，绑定物理设备后可以与该节点正常通信。')
            [CompletionResult]::new('--enable-kcp-proxy', '--enable-kcp-proxy', [CompletionResultType]::ParameterName, '使用 KCP 代理 TCP 流，提高在 UDP 丢包网络上的延迟和吞吐量。')
            [CompletionResult]::new('--disable-kcp-input', '--disable-kcp-input', [CompletionResultType]::ParameterName, '不允许其他节点使用 KCP 代理 TCP 流到此节点。开启 KCP 代理的节点访问此节点时，依然使用原始 TCP 连接。')
            [CompletionResult]::new('--enable-quic-proxy', '--enable-quic-proxy', [CompletionResultType]::ParameterName, '使用 QUIC 代理 TCP 流，提高在 UDP 丢包网络上的延迟和吞吐量。')
            [CompletionResult]::new('--disable-quic-input', '--disable-quic-input', [CompletionResultType]::ParameterName, '不允许其他节点使用 QUIC 代理 TCP 流到此节点。开启 QUIC 代理的节点访问此节点时，依然使用原始 TCP 连接。')
            [CompletionResult]::new('--port-forward', '--port-forward', [CompletionResultType]::ParameterName, '将本地端口转发到虚拟网络中的远程端口。例如：udp://0.0.0.0:12345/10.126.126.1:23456，表示将本地UDP端口12345转发到虚拟网络中的10.126.126.1:23456。可以指定多个。')
            [CompletionResult]::new('--accept-dns', '--accept-dns', [CompletionResultType]::ParameterName, '如果为true，则启用魔法DNS。使用魔法DNS，您可以使用域名访问其他节点，例如：<hostname>.et.net。魔法DNS将修改您的系统DNS设置，请谨慎启用。')
            [CompletionResult]::new('--private-mode', '--private-mode', [CompletionResultType]::ParameterName, '如果为true，则不允许使用了与本网络不相同的网络名称和密码的节点通过本节点进行握手或中转')
            [CompletionResult]::new('--foreign-relay-bps-limit', '--foreign-relay-bps-limit', [CompletionResultType]::ParameterName, '作为共享节点时，限制非本地网络的流量转发速率，默认无限制，单位 BPS （字节每秒）')
            [CompletionResult]::new('--tcp-whitelist', '--tcp-whitelist', [CompletionResultType]::ParameterName, 'TCP 端口白名单。支持单个端口（80）和范围（8000-9000）')
            [CompletionResult]::new('--udp-whitelist', '--udp-whitelist', [CompletionResultType]::ParameterName, 'UDP 端口白名单。支持单个端口（53）和范围（5000-6000）')
            [CompletionResult]::new('--disable-relay-kcp', '--disable-relay-kcp', [CompletionResultType]::ParameterName, '如果为true，则禁止节点转发 KCP 数据包，防止过度消耗流量。默认值为false')
            [CompletionResult]::new('--enable-relay-foreign-network-kcp', '--enable-relay-foreign-network-kcp', [CompletionResultType]::ParameterName, '如果为true，则作为共享节点时也可以转发其他网络的 KCP 数据包。默认值为false（不转发）')
            [CompletionResult]::new('--stun-servers', '--stun-servers', [CompletionResultType]::ParameterName, '覆盖内置的默认 STUN server 列表；如果设置了但是为空，则不使用 STUN servers；如果没设置，则使用默认 STUN server 列表')
            [CompletionResult]::new('--stun-servers-v6', '--stun-servers-v6', [CompletionResultType]::ParameterName, '覆盖内置的默认 IPv6 STUN server 列表；如果设置了但是为空，则不使用 IPv6 STUN servers；如果没设置，则使用默认 IPv6 STUN server 列表')
            [CompletionResult]::new('--console-log-level', '--console-log-level', [CompletionResultType]::ParameterName, '控制台日志级别')
            [CompletionResult]::new('--file-log-level', '--file-log-level', [CompletionResultType]::ParameterName, '文件日志级别')
            [CompletionResult]::new('--file-log-dir', '--file-log-dir', [CompletionResultType]::ParameterName, '存储日志文件的目录')
            [CompletionResult]::new('--file-log-size', '--file-log-size', [CompletionResultType]::ParameterName, '单个文件日志大小，单位 MB，默认值为 100MB')
            [CompletionResult]::new('--file-log-count', '--file-log-count', [CompletionResultType]::ParameterName, '最大文件日志数量，默认值为 10')
            [CompletionResult]::new('--gen-autocomplete', '--gen-autocomplete', [CompletionResultType]::ParameterName, '生成 shell 补全脚本')
            [CompletionResult]::new('--no-listener', '--no-listener', [CompletionResultType]::ParameterName, '不监听任何端口，只连接到对等节点')
            [CompletionResult]::new('--check-config', '--check-config', [CompletionResultType]::ParameterName, '检查配置文件的有效性并退出')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
