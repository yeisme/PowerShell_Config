
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'easytier-cli' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'easytier-cli'
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
        'easytier-cli' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'the instance name')
            [CompletionResult]::new('--rpc-portal', '--rpc-portal', [CompletionResultType]::ParameterName, 'the instance name')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'output format')
            [CompletionResult]::new('--output', '--output', [CompletionResultType]::ParameterName, 'output format')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'verbose output')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'verbose output')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('peer', 'peer', [CompletionResultType]::ParameterValue, 'show peers info')
            [CompletionResult]::new('connector', 'connector', [CompletionResultType]::ParameterValue, 'manage connectors')
            [CompletionResult]::new('mapped-listener', 'mapped-listener', [CompletionResultType]::ParameterValue, 'manage mapped listeners')
            [CompletionResult]::new('stun', 'stun', [CompletionResultType]::ParameterValue, 'do stun test')
            [CompletionResult]::new('route', 'route', [CompletionResultType]::ParameterValue, 'show route info')
            [CompletionResult]::new('peer-center', 'peer-center', [CompletionResultType]::ParameterValue, 'show global peers info')
            [CompletionResult]::new('vpn-portal', 'vpn-portal', [CompletionResultType]::ParameterValue, 'show vpn portal (wireguard) info')
            [CompletionResult]::new('node', 'node', [CompletionResultType]::ParameterValue, 'inspect self easytier-core status')
            [CompletionResult]::new('service', 'service', [CompletionResultType]::ParameterValue, 'manage easytier-core as a system service')
            [CompletionResult]::new('proxy', 'proxy', [CompletionResultType]::ParameterValue, 'show tcp/kcp proxy status')
            [CompletionResult]::new('acl', 'acl', [CompletionResultType]::ParameterValue, 'show ACL rules statistics')
            [CompletionResult]::new('port-forward', 'port-forward', [CompletionResultType]::ParameterValue, 'manage port forwarding')
            [CompletionResult]::new('whitelist', 'whitelist', [CompletionResultType]::ParameterValue, 'manage TCP/UDP whitelist')
            [CompletionResult]::new('stats', 'stats', [CompletionResultType]::ParameterValue, 'show statistics information')
            [CompletionResult]::new('logger', 'logger', [CompletionResultType]::ParameterValue, 'manage logger configuration')
            [CompletionResult]::new('gen-autocomplete', 'gen-autocomplete', [CompletionResultType]::ParameterValue, '生成 shell 补全脚本')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;peer' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'remove')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list')
            [CompletionResult]::new('list-foreign', 'list-foreign', [CompletionResultType]::ParameterValue, 'list-foreign')
            [CompletionResult]::new('list-global-foreign', 'list-global-foreign', [CompletionResultType]::ParameterValue, 'list-global-foreign')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;peer;add' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;peer;remove' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;peer;list' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;peer;list-foreign' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;peer;list-global-foreign' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;peer;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'remove')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list')
            [CompletionResult]::new('list-foreign', 'list-foreign', [CompletionResultType]::ParameterValue, 'list-foreign')
            [CompletionResult]::new('list-global-foreign', 'list-global-foreign', [CompletionResultType]::ParameterValue, 'list-global-foreign')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;peer;help;add' {
            break
        }
        'easytier-cli;peer;help;remove' {
            break
        }
        'easytier-cli;peer;help;list' {
            break
        }
        'easytier-cli;peer;help;list-foreign' {
            break
        }
        'easytier-cli;peer;help;list-global-foreign' {
            break
        }
        'easytier-cli;peer;help;help' {
            break
        }
        'easytier-cli;connector' {
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'i')
            [CompletionResult]::new('--ipv4', '--ipv4', [CompletionResultType]::ParameterName, 'ipv4')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'p')
            [CompletionResult]::new('--peers', '--peers', [CompletionResultType]::ParameterName, 'peers')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'remove')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;connector;add' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;connector;remove' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;connector;list' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;connector;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'remove')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;connector;help;add' {
            break
        }
        'easytier-cli;connector;help;remove' {
            break
        }
        'easytier-cli;connector;help;list' {
            break
        }
        'easytier-cli;connector;help;help' {
            break
        }
        'easytier-cli;mapped-listener' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add Mapped Listerner')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove Mapped Listener')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List Existing Mapped Listener')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;mapped-listener;add' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;mapped-listener;remove' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;mapped-listener;list' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;mapped-listener;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add Mapped Listerner')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove Mapped Listener')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List Existing Mapped Listener')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;mapped-listener;help;add' {
            break
        }
        'easytier-cli;mapped-listener;help;remove' {
            break
        }
        'easytier-cli;mapped-listener;help;list' {
            break
        }
        'easytier-cli;mapped-listener;help;help' {
            break
        }
        'easytier-cli;stun' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;route' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list')
            [CompletionResult]::new('dump', 'dump', [CompletionResultType]::ParameterValue, 'dump')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;route;list' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;route;dump' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;route;help' {
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list')
            [CompletionResult]::new('dump', 'dump', [CompletionResultType]::ParameterValue, 'dump')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;route;help;list' {
            break
        }
        'easytier-cli;route;help;dump' {
            break
        }
        'easytier-cli;route;help;help' {
            break
        }
        'easytier-cli;peer-center' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;vpn-portal' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;node' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'show node info')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'show node config')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;node;info' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;node;config' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;node;help' {
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'show node info')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'show node config')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;node;help;info' {
            break
        }
        'easytier-cli;node;help;config' {
            break
        }
        'easytier-cli;node;help;help' {
            break
        }
        'easytier-cli;service' {
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'service name')
            [CompletionResult]::new('--name', '--name', [CompletionResultType]::ParameterName, 'service name')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'register easytier-core as a system service')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'unregister easytier-core system service')
            [CompletionResult]::new('status', 'status', [CompletionResultType]::ParameterValue, 'check easytier-core system service status')
            [CompletionResult]::new('start', 'start', [CompletionResultType]::ParameterValue, 'start easytier-core system service')
            [CompletionResult]::new('stop', 'stop', [CompletionResultType]::ParameterValue, 'stop easytier-core system service')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;service;install' {
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'service description')
            [CompletionResult]::new('--display-name', '--display-name', [CompletionResultType]::ParameterName, 'display-name')
            [CompletionResult]::new('--disable-autostart', '--disable-autostart', [CompletionResultType]::ParameterName, 'disable-autostart')
            [CompletionResult]::new('--disable-restart-on-failure', '--disable-restart-on-failure', [CompletionResultType]::ParameterName, 'disable-restart-on-failure')
            [CompletionResult]::new('--core-path', '--core-path', [CompletionResultType]::ParameterName, 'path to easytier-core binary')
            [CompletionResult]::new('--service-work-dir', '--service-work-dir', [CompletionResultType]::ParameterName, 'service-work-dir')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;service;uninstall' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;service;status' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;service;start' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;service;stop' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;service;help' {
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'register easytier-core as a system service')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'unregister easytier-core system service')
            [CompletionResult]::new('status', 'status', [CompletionResultType]::ParameterValue, 'check easytier-core system service status')
            [CompletionResult]::new('start', 'start', [CompletionResultType]::ParameterValue, 'start easytier-core system service')
            [CompletionResult]::new('stop', 'stop', [CompletionResultType]::ParameterValue, 'stop easytier-core system service')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;service;help;install' {
            break
        }
        'easytier-cli;service;help;uninstall' {
            break
        }
        'easytier-cli;service;help;status' {
            break
        }
        'easytier-cli;service;help;start' {
            break
        }
        'easytier-cli;service;help;stop' {
            break
        }
        'easytier-cli;service;help;help' {
            break
        }
        'easytier-cli;proxy' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;acl' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('stats', 'stats', [CompletionResultType]::ParameterValue, 'stats')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;acl;stats' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;acl;help' {
            [CompletionResult]::new('stats', 'stats', [CompletionResultType]::ParameterValue, 'stats')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;acl;help;stats' {
            break
        }
        'easytier-cli;acl;help;help' {
            break
        }
        'easytier-cli;port-forward' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add port forward rule')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove port forward rule')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List port forward rules')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;port-forward;add' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;port-forward;remove' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;port-forward;list' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;port-forward;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add port forward rule')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove port forward rule')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List port forward rules')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;port-forward;help;add' {
            break
        }
        'easytier-cli;port-forward;help;remove' {
            break
        }
        'easytier-cli;port-forward;help;list' {
            break
        }
        'easytier-cli;port-forward;help;help' {
            break
        }
        'easytier-cli;whitelist' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('set-tcp', 'set-tcp', [CompletionResultType]::ParameterValue, 'Set TCP port whitelist')
            [CompletionResult]::new('set-udp', 'set-udp', [CompletionResultType]::ParameterValue, 'Set UDP port whitelist')
            [CompletionResult]::new('clear-tcp', 'clear-tcp', [CompletionResultType]::ParameterValue, 'Clear TCP whitelist')
            [CompletionResult]::new('clear-udp', 'clear-udp', [CompletionResultType]::ParameterValue, 'Clear UDP whitelist')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show current whitelist configuration')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;whitelist;set-tcp' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;whitelist;set-udp' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;whitelist;clear-tcp' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;whitelist;clear-udp' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;whitelist;show' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;whitelist;help' {
            [CompletionResult]::new('set-tcp', 'set-tcp', [CompletionResultType]::ParameterValue, 'Set TCP port whitelist')
            [CompletionResult]::new('set-udp', 'set-udp', [CompletionResultType]::ParameterValue, 'Set UDP port whitelist')
            [CompletionResult]::new('clear-tcp', 'clear-tcp', [CompletionResultType]::ParameterValue, 'Clear TCP whitelist')
            [CompletionResult]::new('clear-udp', 'clear-udp', [CompletionResultType]::ParameterValue, 'Clear UDP whitelist')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show current whitelist configuration')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;whitelist;help;set-tcp' {
            break
        }
        'easytier-cli;whitelist;help;set-udp' {
            break
        }
        'easytier-cli;whitelist;help;clear-tcp' {
            break
        }
        'easytier-cli;whitelist;help;clear-udp' {
            break
        }
        'easytier-cli;whitelist;help;show' {
            break
        }
        'easytier-cli;whitelist;help;help' {
            break
        }
        'easytier-cli;stats' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show general statistics')
            [CompletionResult]::new('prometheus', 'prometheus', [CompletionResultType]::ParameterValue, 'Show statistics in Prometheus format')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;stats;show' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;stats;prometheus' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;stats;help' {
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show general statistics')
            [CompletionResult]::new('prometheus', 'prometheus', [CompletionResultType]::ParameterValue, 'Show statistics in Prometheus format')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;stats;help;show' {
            break
        }
        'easytier-cli;stats;help;prometheus' {
            break
        }
        'easytier-cli;stats;help;help' {
            break
        }
        'easytier-cli;logger' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get current logger configuration')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set logger level')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;logger;get' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;logger;set' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;logger;help' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get current logger configuration')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set logger level')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;logger;help;get' {
            break
        }
        'easytier-cli;logger;help;set' {
            break
        }
        'easytier-cli;logger;help;help' {
            break
        }
        'easytier-cli;gen-autocomplete' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'easytier-cli;help' {
            [CompletionResult]::new('peer', 'peer', [CompletionResultType]::ParameterValue, 'show peers info')
            [CompletionResult]::new('connector', 'connector', [CompletionResultType]::ParameterValue, 'manage connectors')
            [CompletionResult]::new('mapped-listener', 'mapped-listener', [CompletionResultType]::ParameterValue, 'manage mapped listeners')
            [CompletionResult]::new('stun', 'stun', [CompletionResultType]::ParameterValue, 'do stun test')
            [CompletionResult]::new('route', 'route', [CompletionResultType]::ParameterValue, 'show route info')
            [CompletionResult]::new('peer-center', 'peer-center', [CompletionResultType]::ParameterValue, 'show global peers info')
            [CompletionResult]::new('vpn-portal', 'vpn-portal', [CompletionResultType]::ParameterValue, 'show vpn portal (wireguard) info')
            [CompletionResult]::new('node', 'node', [CompletionResultType]::ParameterValue, 'inspect self easytier-core status')
            [CompletionResult]::new('service', 'service', [CompletionResultType]::ParameterValue, 'manage easytier-core as a system service')
            [CompletionResult]::new('proxy', 'proxy', [CompletionResultType]::ParameterValue, 'show tcp/kcp proxy status')
            [CompletionResult]::new('acl', 'acl', [CompletionResultType]::ParameterValue, 'show ACL rules statistics')
            [CompletionResult]::new('port-forward', 'port-forward', [CompletionResultType]::ParameterValue, 'manage port forwarding')
            [CompletionResult]::new('whitelist', 'whitelist', [CompletionResultType]::ParameterValue, 'manage TCP/UDP whitelist')
            [CompletionResult]::new('stats', 'stats', [CompletionResultType]::ParameterValue, 'show statistics information')
            [CompletionResult]::new('logger', 'logger', [CompletionResultType]::ParameterValue, 'manage logger configuration')
            [CompletionResult]::new('gen-autocomplete', 'gen-autocomplete', [CompletionResultType]::ParameterValue, '生成 shell 补全脚本')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'easytier-cli;help;peer' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'remove')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list')
            [CompletionResult]::new('list-foreign', 'list-foreign', [CompletionResultType]::ParameterValue, 'list-foreign')
            [CompletionResult]::new('list-global-foreign', 'list-global-foreign', [CompletionResultType]::ParameterValue, 'list-global-foreign')
            break
        }
        'easytier-cli;help;peer;add' {
            break
        }
        'easytier-cli;help;peer;remove' {
            break
        }
        'easytier-cli;help;peer;list' {
            break
        }
        'easytier-cli;help;peer;list-foreign' {
            break
        }
        'easytier-cli;help;peer;list-global-foreign' {
            break
        }
        'easytier-cli;help;connector' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'remove')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list')
            break
        }
        'easytier-cli;help;connector;add' {
            break
        }
        'easytier-cli;help;connector;remove' {
            break
        }
        'easytier-cli;help;connector;list' {
            break
        }
        'easytier-cli;help;mapped-listener' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add Mapped Listerner')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove Mapped Listener')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List Existing Mapped Listener')
            break
        }
        'easytier-cli;help;mapped-listener;add' {
            break
        }
        'easytier-cli;help;mapped-listener;remove' {
            break
        }
        'easytier-cli;help;mapped-listener;list' {
            break
        }
        'easytier-cli;help;stun' {
            break
        }
        'easytier-cli;help;route' {
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'list')
            [CompletionResult]::new('dump', 'dump', [CompletionResultType]::ParameterValue, 'dump')
            break
        }
        'easytier-cli;help;route;list' {
            break
        }
        'easytier-cli;help;route;dump' {
            break
        }
        'easytier-cli;help;peer-center' {
            break
        }
        'easytier-cli;help;vpn-portal' {
            break
        }
        'easytier-cli;help;node' {
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'show node info')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'show node config')
            break
        }
        'easytier-cli;help;node;info' {
            break
        }
        'easytier-cli;help;node;config' {
            break
        }
        'easytier-cli;help;service' {
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'register easytier-core as a system service')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'unregister easytier-core system service')
            [CompletionResult]::new('status', 'status', [CompletionResultType]::ParameterValue, 'check easytier-core system service status')
            [CompletionResult]::new('start', 'start', [CompletionResultType]::ParameterValue, 'start easytier-core system service')
            [CompletionResult]::new('stop', 'stop', [CompletionResultType]::ParameterValue, 'stop easytier-core system service')
            break
        }
        'easytier-cli;help;service;install' {
            break
        }
        'easytier-cli;help;service;uninstall' {
            break
        }
        'easytier-cli;help;service;status' {
            break
        }
        'easytier-cli;help;service;start' {
            break
        }
        'easytier-cli;help;service;stop' {
            break
        }
        'easytier-cli;help;proxy' {
            break
        }
        'easytier-cli;help;acl' {
            [CompletionResult]::new('stats', 'stats', [CompletionResultType]::ParameterValue, 'stats')
            break
        }
        'easytier-cli;help;acl;stats' {
            break
        }
        'easytier-cli;help;port-forward' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add port forward rule')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove port forward rule')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List port forward rules')
            break
        }
        'easytier-cli;help;port-forward;add' {
            break
        }
        'easytier-cli;help;port-forward;remove' {
            break
        }
        'easytier-cli;help;port-forward;list' {
            break
        }
        'easytier-cli;help;whitelist' {
            [CompletionResult]::new('set-tcp', 'set-tcp', [CompletionResultType]::ParameterValue, 'Set TCP port whitelist')
            [CompletionResult]::new('set-udp', 'set-udp', [CompletionResultType]::ParameterValue, 'Set UDP port whitelist')
            [CompletionResult]::new('clear-tcp', 'clear-tcp', [CompletionResultType]::ParameterValue, 'Clear TCP whitelist')
            [CompletionResult]::new('clear-udp', 'clear-udp', [CompletionResultType]::ParameterValue, 'Clear UDP whitelist')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show current whitelist configuration')
            break
        }
        'easytier-cli;help;whitelist;set-tcp' {
            break
        }
        'easytier-cli;help;whitelist;set-udp' {
            break
        }
        'easytier-cli;help;whitelist;clear-tcp' {
            break
        }
        'easytier-cli;help;whitelist;clear-udp' {
            break
        }
        'easytier-cli;help;whitelist;show' {
            break
        }
        'easytier-cli;help;stats' {
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show general statistics')
            [CompletionResult]::new('prometheus', 'prometheus', [CompletionResultType]::ParameterValue, 'Show statistics in Prometheus format')
            break
        }
        'easytier-cli;help;stats;show' {
            break
        }
        'easytier-cli;help;stats;prometheus' {
            break
        }
        'easytier-cli;help;logger' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get current logger configuration')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set logger level')
            break
        }
        'easytier-cli;help;logger;get' {
            break
        }
        'easytier-cli;help;logger;set' {
            break
        }
        'easytier-cli;help;gen-autocomplete' {
            break
        }
        'easytier-cli;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
