
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'pixi' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'pixi'
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
        'pixi' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('--list', '--list', [CompletionResultType]::ParameterName, 'List all installed commands (built-in and extensions)')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds dependencies to the workspace')
            [CompletionResult]::new('a', 'a', [CompletionResultType]::ParameterValue, 'Adds dependencies to the workspace')
            [CompletionResult]::new('auth', 'auth', [CompletionResultType]::ParameterValue, 'Login to prefix.dev or anaconda.org servers to access private channels')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Workspace configuration')
            [CompletionResult]::new('clean', 'clean', [CompletionResultType]::ParameterValue, 'Cleanup the environments')
            [CompletionResult]::new('completion', 'completion', [CompletionResultType]::ParameterValue, 'Generates a completion script for a shell')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'Configuration management')
            [CompletionResult]::new('exec', 'exec', [CompletionResultType]::ParameterValue, 'Run a command and install it in a temporary environment')
            [CompletionResult]::new('x', 'x', [CompletionResultType]::ParameterValue, 'Run a command and install it in a temporary environment')
            [CompletionResult]::new('global', 'global', [CompletionResultType]::ParameterValue, 'Subcommand for global package management actions')
            [CompletionResult]::new('g', 'g', [CompletionResultType]::ParameterValue, 'Subcommand for global package management actions')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Information about the system, workspace and environments for the current machine')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Creates a new workspace')
            [CompletionResult]::new('import', 'import', [CompletionResultType]::ParameterValue, 'Imports a file into an environment in an existing workspace.')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Install an environment, both updating the lockfile and installing the environment')
            [CompletionResult]::new('i', 'i', [CompletionResultType]::ParameterValue, 'Install an environment, both updating the lockfile and installing the environment')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List workspace''s packages')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List workspace''s packages')
            [CompletionResult]::new('lock', 'lock', [CompletionResultType]::ParameterValue, 'Solve environment and update the lock file without installing the environments')
            [CompletionResult]::new('reinstall', 'reinstall', [CompletionResultType]::ParameterValue, 'Re-install an environment, both updating the lockfile and re-installing the environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Removes dependencies from the workspace')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Removes dependencies from the workspace')
            [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, 'Runs task in the pixi environment')
            [CompletionResult]::new('r', 'r', [CompletionResultType]::ParameterValue, 'Runs task in the pixi environment')
            [CompletionResult]::new('search', 'search', [CompletionResultType]::ParameterValue, 'Search a conda package')
            [CompletionResult]::new('self-update', 'self-update', [CompletionResultType]::ParameterValue, 'Update pixi to the latest version or a specific version')
            [CompletionResult]::new('shell', 'shell', [CompletionResultType]::ParameterValue, 'Start a shell in a pixi environment, run `exit` to leave the shell')
            [CompletionResult]::new('s', 's', [CompletionResultType]::ParameterValue, 'Start a shell in a pixi environment, run `exit` to leave the shell')
            [CompletionResult]::new('shell-hook', 'shell-hook', [CompletionResultType]::ParameterValue, 'Print the pixi environment activation script')
            [CompletionResult]::new('task', 'task', [CompletionResultType]::ParameterValue, 'Interact with tasks in the workspace')
            [CompletionResult]::new('tree', 'tree', [CompletionResultType]::ParameterValue, 'Show a tree of workspace dependencies')
            [CompletionResult]::new('t', 't', [CompletionResultType]::ParameterValue, 'Show a tree of workspace dependencies')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'The `update` command checks if there are newer versions of the dependencies and updates the `pixi.lock` file and environments accordingly')
            [CompletionResult]::new('upgrade', 'upgrade', [CompletionResultType]::ParameterValue, 'Checks if there are newer versions of the dependencies and upgrades them in the lockfile and manifest file')
            [CompletionResult]::new('upload', 'upload', [CompletionResultType]::ParameterValue, 'Upload a conda package')
            [CompletionResult]::new('workspace', 'workspace', [CompletionResultType]::ParameterValue, 'Modify the workspace configuration file through the command line')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;add' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform for which the dependency should be modified')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform for which the dependency should be modified')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The feature for which the dependency should be modified')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The feature for which the dependency should be modified')
            [CompletionResult]::new('-g', '-g', [CompletionResultType]::ParameterName, 'The git url to use when adding a git dependency')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url to use when adding a git dependency')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'The subdirectory of the git repository to use')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory of the git repository to use')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--host', '--host', [CompletionResultType]::ParameterName, 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`')
            [CompletionResult]::new('--build', '--build', [CompletionResultType]::ParameterName, 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`')
            [CompletionResult]::new('--pypi', '--pypi', [CompletionResultType]::ParameterName, 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--editable', '--editable', [CompletionResultType]::ParameterName, 'Whether the pypi requirement should be editable')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;a' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform for which the dependency should be modified')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform for which the dependency should be modified')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The feature for which the dependency should be modified')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The feature for which the dependency should be modified')
            [CompletionResult]::new('-g', '-g', [CompletionResultType]::ParameterName, 'The git url to use when adding a git dependency')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url to use when adding a git dependency')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'The subdirectory of the git repository to use')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory of the git repository to use')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--host', '--host', [CompletionResultType]::ParameterName, 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`')
            [CompletionResult]::new('--build', '--build', [CompletionResultType]::ParameterName, 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`')
            [CompletionResult]::new('--pypi', '--pypi', [CompletionResultType]::ParameterName, 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--editable', '--editable', [CompletionResultType]::ParameterName, 'Whether the pypi requirement should be editable')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;auth' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('login', 'login', [CompletionResultType]::ParameterValue, 'Store authentication information for a given host')
            [CompletionResult]::new('logout', 'logout', [CompletionResultType]::ParameterValue, 'Remove authentication information for a given host')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;auth;login' {
            [CompletionResult]::new('--token', '--token', [CompletionResultType]::ParameterName, 'The token to use (for authentication with prefix.dev)')
            [CompletionResult]::new('--username', '--username', [CompletionResultType]::ParameterName, 'The username to use (for basic HTTP authentication)')
            [CompletionResult]::new('--password', '--password', [CompletionResultType]::ParameterName, 'The password to use (for basic HTTP authentication)')
            [CompletionResult]::new('--conda-token', '--conda-token', [CompletionResultType]::ParameterName, 'The token to use on anaconda.org / quetz authentication')
            [CompletionResult]::new('--s3-access-key-id', '--s3-access-key-id', [CompletionResultType]::ParameterName, 'The S3 access key ID')
            [CompletionResult]::new('--s3-secret-access-key', '--s3-secret-access-key', [CompletionResultType]::ParameterName, 'The S3 secret access key')
            [CompletionResult]::new('--s3-session-token', '--s3-session-token', [CompletionResultType]::ParameterName, 'The S3 session token')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;auth;logout' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;auth;help' {
            [CompletionResult]::new('login', 'login', [CompletionResultType]::ParameterValue, 'Store authentication information for a given host')
            [CompletionResult]::new('logout', 'logout', [CompletionResultType]::ParameterValue, 'Remove authentication information for a given host')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;auth;help;login' {
            break
        }
        'pixi;auth;help;logout' {
            break
        }
        'pixi;auth;help;help' {
            break
        }
        'pixi;build' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-t', '-t', [CompletionResultType]::ParameterName, 'The target platform to build for (defaults to the current platform)')
            [CompletionResult]::new('--target-platform', '--target-platform', [CompletionResultType]::ParameterName, 'The target platform to build for (defaults to the current platform)')
            [CompletionResult]::new('--build-platform', '--build-platform', [CompletionResultType]::ParameterName, 'The build platform to use for building (defaults to the current platform)')
            [CompletionResult]::new('-o', '-o', [CompletionResultType]::ParameterName, 'The output directory to place the built artifacts')
            [CompletionResult]::new('--output-dir', '--output-dir', [CompletionResultType]::ParameterName, 'The output directory to place the built artifacts')
            [CompletionResult]::new('-b', '-b', [CompletionResultType]::ParameterName, 'The directory to use for incremental builds artifacts')
            [CompletionResult]::new('--build-dir', '--build-dir', [CompletionResultType]::ParameterName, 'The directory to use for incremental builds artifacts')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Whether to clean the build directory before building')
            [CompletionResult]::new('--clean', '--clean', [CompletionResultType]::ParameterName, 'Whether to clean the build directory before building')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;clean' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment directory to remove')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment directory to remove')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--activation-cache', '--activation-cache', [CompletionResultType]::ParameterName, 'Only remove the activation cache')
            [CompletionResult]::new('--build', '--build', [CompletionResultType]::ParameterName, 'Only remove the pixi-build cache')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('cache', 'cache', [CompletionResultType]::ParameterValue, 'Clean the cache of your system which are touched by pixi')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;clean;cache' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--pypi', '--pypi', [CompletionResultType]::ParameterName, 'Clean only the pypi related cache')
            [CompletionResult]::new('--conda', '--conda', [CompletionResultType]::ParameterName, 'Clean only the conda related cache')
            [CompletionResult]::new('--mapping', '--mapping', [CompletionResultType]::ParameterName, 'Clean only the mapping cache')
            [CompletionResult]::new('--exec', '--exec', [CompletionResultType]::ParameterName, 'Clean only `exec` cache')
            [CompletionResult]::new('--repodata', '--repodata', [CompletionResultType]::ParameterName, 'Clean only the repodata cache')
            [CompletionResult]::new('--build-backends', '--build-backends', [CompletionResultType]::ParameterName, 'Clean only the build backends environments cache')
            [CompletionResult]::new('--build', '--build', [CompletionResultType]::ParameterName, 'Clean only the build related cache')
            [CompletionResult]::new('-y', '-y', [CompletionResultType]::ParameterName, 'Answer yes to all questions')
            [CompletionResult]::new('--yes', '--yes', [CompletionResultType]::ParameterName, 'Answer yes to all questions')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;clean;help' {
            [CompletionResult]::new('cache', 'cache', [CompletionResultType]::ParameterValue, 'Clean the cache of your system which are touched by pixi')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;clean;help;cache' {
            break
        }
        'pixi;clean;help;help' {
            break
        }
        'pixi;completion' {
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'The shell to generate a completion script for')
            [CompletionResult]::new('--shell', '--shell', [CompletionResultType]::ParameterName, 'The shell to generate a completion script for')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;config' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Edit the configuration file')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List configuration values')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List configuration values')
            [CompletionResult]::new('prepend', 'prepend', [CompletionResultType]::ParameterValue, 'Prepend a value to a list configuration key')
            [CompletionResult]::new('append', 'append', [CompletionResultType]::ParameterValue, 'Append a value to a list configuration key')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set a configuration value')
            [CompletionResult]::new('unset', 'unset', [CompletionResultType]::ParameterValue, 'Unset a configuration value')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;config;edit' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('--local', '--local', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('-g', '-g', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('--global', '--global', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('--system', '--system', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;config;list' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'Output in JSON format')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('--local', '--local', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('-g', '-g', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('--global', '--global', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('--system', '--system', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;config;ls' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'Output in JSON format')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('--local', '--local', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('-g', '-g', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('--global', '--global', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('--system', '--system', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;config;prepend' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('--local', '--local', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('-g', '-g', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('--global', '--global', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('--system', '--system', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;config;append' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('--local', '--local', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('-g', '-g', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('--global', '--global', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('--system', '--system', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;config;set' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('--local', '--local', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('-g', '-g', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('--global', '--global', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('--system', '--system', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;config;unset' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('--local', '--local', [CompletionResultType]::ParameterName, 'Operation on project-local configuration')
            [CompletionResult]::new('-g', '-g', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('--global', '--global', [CompletionResultType]::ParameterName, 'Operation on global configuration')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('--system', '--system', [CompletionResultType]::ParameterName, 'Operation on system configuration')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;config;help' {
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Edit the configuration file')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List configuration values')
            [CompletionResult]::new('prepend', 'prepend', [CompletionResultType]::ParameterValue, 'Prepend a value to a list configuration key')
            [CompletionResult]::new('append', 'append', [CompletionResultType]::ParameterValue, 'Append a value to a list configuration key')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set a configuration value')
            [CompletionResult]::new('unset', 'unset', [CompletionResultType]::ParameterValue, 'Unset a configuration value')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;config;help;edit' {
            break
        }
        'pixi;config;help;list' {
            break
        }
        'pixi;config;help;prepend' {
            break
        }
        'pixi;config;help;append' {
            break
        }
        'pixi;config;help;set' {
            break
        }
        'pixi;config;help;unset' {
            break
        }
        'pixi;config;help;help' {
            break
        }
        'pixi;exec' {
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Matchspecs of package to install. If this is not provided, the package is guessed from the command')
            [CompletionResult]::new('--spec', '--spec', [CompletionResultType]::ParameterName, 'Matchspecs of package to install. If this is not provided, the package is guessed from the command')
            [CompletionResult]::new('-w', '-w', [CompletionResultType]::ParameterName, 'Matchspecs of package to install, while also guessing a package from the command')
            [CompletionResult]::new('--with', '--with', [CompletionResultType]::ParameterName, 'Matchspecs of package to install, while also guessing a package from the command')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to create the environment for')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to create the environment for')
            [CompletionResult]::new('--list', '--list', [CompletionResultType]::ParameterName, 'Before executing the command, list packages in the environment Specify `--list=some_regex` to filter the shown packages')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--force-reinstall', '--force-reinstall', [CompletionResultType]::ParameterName, 'If specified a new environment is always created even if one already exists')
            [CompletionResult]::new('--no-modify-ps1', '--no-modify-ps1', [CompletionResultType]::ParameterName, 'Disable modification of the PS1 prompt to indicate the temporary environment')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;x' {
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Matchspecs of package to install. If this is not provided, the package is guessed from the command')
            [CompletionResult]::new('--spec', '--spec', [CompletionResultType]::ParameterName, 'Matchspecs of package to install. If this is not provided, the package is guessed from the command')
            [CompletionResult]::new('-w', '-w', [CompletionResultType]::ParameterName, 'Matchspecs of package to install, while also guessing a package from the command')
            [CompletionResult]::new('--with', '--with', [CompletionResultType]::ParameterName, 'Matchspecs of package to install, while also guessing a package from the command')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to create the environment for')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to create the environment for')
            [CompletionResult]::new('--list', '--list', [CompletionResultType]::ParameterName, 'Before executing the command, list packages in the environment Specify `--list=some_regex` to filter the shown packages')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--force-reinstall', '--force-reinstall', [CompletionResultType]::ParameterName, 'If specified a new environment is always created even if one already exists')
            [CompletionResult]::new('--no-modify-ps1', '--no-modify-ps1', [CompletionResultType]::ParameterName, 'Disable modification of the PS1 prompt to indicate the temporary environment')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds dependencies to an environment')
            [CompletionResult]::new('a', 'a', [CompletionResultType]::ParameterValue, 'Adds dependencies to an environment')
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Edit the global manifest file')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Installs the defined packages in a globally accessible location and exposes their command line applications.')
            [CompletionResult]::new('i', 'i', [CompletionResultType]::ParameterValue, 'Installs the defined packages in a globally accessible location and exposes their command line applications.')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstalls environments from the global environment.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Removes dependencies from an environment')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Removes dependencies from an environment')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Sync global manifest with installed environments')
            [CompletionResult]::new('s', 's', [CompletionResultType]::ParameterValue, 'Sync global manifest with installed environments')
            [CompletionResult]::new('expose', 'expose', [CompletionResultType]::ParameterValue, 'Interact with the exposure of binaries in the global environment')
            [CompletionResult]::new('e', 'e', [CompletionResultType]::ParameterValue, 'Interact with the exposure of binaries in the global environment')
            [CompletionResult]::new('shortcut', 'shortcut', [CompletionResultType]::ParameterValue, 'Interact with the shortcuts on your machine')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Updates environments in the global environment')
            [CompletionResult]::new('upgrade', 'upgrade', [CompletionResultType]::ParameterValue, 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead')
            [CompletionResult]::new('upgrade-all', 'upgrade-all', [CompletionResultType]::ParameterValue, 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead')
            [CompletionResult]::new('tree', 'tree', [CompletionResultType]::ParameterValue, 'Show a tree of dependencies for a specific global environment')
            [CompletionResult]::new('t', 't', [CompletionResultType]::ParameterValue, 'Show a tree of dependencies for a specific global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;g' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds dependencies to an environment')
            [CompletionResult]::new('a', 'a', [CompletionResultType]::ParameterValue, 'Adds dependencies to an environment')
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Edit the global manifest file')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Installs the defined packages in a globally accessible location and exposes their command line applications.')
            [CompletionResult]::new('i', 'i', [CompletionResultType]::ParameterValue, 'Installs the defined packages in a globally accessible location and exposes their command line applications.')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstalls environments from the global environment.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Removes dependencies from an environment')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Removes dependencies from an environment')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Sync global manifest with installed environments')
            [CompletionResult]::new('s', 's', [CompletionResultType]::ParameterValue, 'Sync global manifest with installed environments')
            [CompletionResult]::new('expose', 'expose', [CompletionResultType]::ParameterValue, 'Interact with the exposure of binaries in the global environment')
            [CompletionResult]::new('e', 'e', [CompletionResultType]::ParameterValue, 'Interact with the exposure of binaries in the global environment')
            [CompletionResult]::new('shortcut', 'shortcut', [CompletionResultType]::ParameterValue, 'Interact with the shortcuts on your machine')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Updates environments in the global environment')
            [CompletionResult]::new('upgrade', 'upgrade', [CompletionResultType]::ParameterValue, 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead')
            [CompletionResult]::new('upgrade-all', 'upgrade-all', [CompletionResultType]::ParameterValue, 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead')
            [CompletionResult]::new('tree', 'tree', [CompletionResultType]::ParameterValue, 'Show a tree of dependencies for a specific global environment')
            [CompletionResult]::new('t', 't', [CompletionResultType]::ParameterValue, 'Show a tree of dependencies for a specific global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;global;add' {
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url, e.g. `https://github.com/user/repo.git`')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory within the git repository')
            [CompletionResult]::new('--path', '--path', [CompletionResultType]::ParameterName, 'The path to the local package')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be added to')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be added to')
            [CompletionResult]::new('--expose', '--expose', [CompletionResultType]::ParameterName, 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;a' {
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url, e.g. `https://github.com/user/repo.git`')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory within the git repository')
            [CompletionResult]::new('--path', '--path', [CompletionResultType]::ParameterName, 'The path to the local package')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be added to')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be added to')
            [CompletionResult]::new('--expose', '--expose', [CompletionResultType]::ParameterName, 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;add' {
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url, e.g. `https://github.com/user/repo.git`')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory within the git repository')
            [CompletionResult]::new('--path', '--path', [CompletionResultType]::ParameterName, 'The path to the local package')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be added to')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be added to')
            [CompletionResult]::new('--expose', '--expose', [CompletionResultType]::ParameterName, 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;a' {
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url, e.g. `https://github.com/user/repo.git`')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory within the git repository')
            [CompletionResult]::new('--path', '--path', [CompletionResultType]::ParameterName, 'The path to the local package')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be added to')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be added to')
            [CompletionResult]::new('--expose', '--expose', [CompletionResultType]::ParameterName, 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;edit' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;edit' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;install' {
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url, e.g. `https://github.com/user/repo.git`')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory within the git repository')
            [CompletionResult]::new('--path', '--path', [CompletionResultType]::ParameterName, 'The path to the local package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to install the packages for')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to install the packages for')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Ensures that all packages will be installed in the same environment')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Ensures that all packages will be installed in the same environment')
            [CompletionResult]::new('--expose', '--expose', [CompletionResultType]::ParameterName, 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed')
            [CompletionResult]::new('--with', '--with', [CompletionResultType]::ParameterName, 'Add additional dependencies to the environment. Their executables will not be exposed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--force-reinstall', '--force-reinstall', [CompletionResultType]::ParameterName, 'Specifies that the environment should be reinstalled')
            [CompletionResult]::new('--no-shortcuts', '--no-shortcuts', [CompletionResultType]::ParameterName, 'Specifies that no shortcuts should be created for the installed packages')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;i' {
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url, e.g. `https://github.com/user/repo.git`')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory within the git repository')
            [CompletionResult]::new('--path', '--path', [CompletionResultType]::ParameterName, 'The path to the local package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to install the packages for')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to install the packages for')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Ensures that all packages will be installed in the same environment')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Ensures that all packages will be installed in the same environment')
            [CompletionResult]::new('--expose', '--expose', [CompletionResultType]::ParameterName, 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed')
            [CompletionResult]::new('--with', '--with', [CompletionResultType]::ParameterName, 'Add additional dependencies to the environment. Their executables will not be exposed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--force-reinstall', '--force-reinstall', [CompletionResultType]::ParameterName, 'Specifies that the environment should be reinstalled')
            [CompletionResult]::new('--no-shortcuts', '--no-shortcuts', [CompletionResultType]::ParameterName, 'Specifies that no shortcuts should be created for the installed packages')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;install' {
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url, e.g. `https://github.com/user/repo.git`')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory within the git repository')
            [CompletionResult]::new('--path', '--path', [CompletionResultType]::ParameterName, 'The path to the local package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to install the packages for')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to install the packages for')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Ensures that all packages will be installed in the same environment')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Ensures that all packages will be installed in the same environment')
            [CompletionResult]::new('--expose', '--expose', [CompletionResultType]::ParameterName, 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed')
            [CompletionResult]::new('--with', '--with', [CompletionResultType]::ParameterName, 'Add additional dependencies to the environment. Their executables will not be exposed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--force-reinstall', '--force-reinstall', [CompletionResultType]::ParameterName, 'Specifies that the environment should be reinstalled')
            [CompletionResult]::new('--no-shortcuts', '--no-shortcuts', [CompletionResultType]::ParameterName, 'Specifies that no shortcuts should be created for the installed packages')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;i' {
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url, e.g. `https://github.com/user/repo.git`')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory within the git repository')
            [CompletionResult]::new('--path', '--path', [CompletionResultType]::ParameterName, 'The path to the local package')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to install the packages for')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to install the packages for')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Ensures that all packages will be installed in the same environment')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Ensures that all packages will be installed in the same environment')
            [CompletionResult]::new('--expose', '--expose', [CompletionResultType]::ParameterName, 'Add one or more mapping which describe which executables are exposed. The syntax is `exposed_name=executable_name`, so for example `python3.10=python`. Alternatively, you can input only an executable_name and `executable_name=executable_name` is assumed')
            [CompletionResult]::new('--with', '--with', [CompletionResultType]::ParameterName, 'Add additional dependencies to the environment. Their executables will not be exposed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--force-reinstall', '--force-reinstall', [CompletionResultType]::ParameterName, 'Specifies that the environment should be reinstalled')
            [CompletionResult]::new('--no-shortcuts', '--no-shortcuts', [CompletionResultType]::ParameterName, 'Specifies that no shortcuts should be created for the installed packages')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;uninstall' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;uninstall' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;remove' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be removed from')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be removed from')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;rm' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be removed from')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be removed from')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;remove' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be removed from')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be removed from')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;rm' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be removed from')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Specifies the environment that the dependencies need to be removed from')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;list' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`')
            [CompletionResult]::new('--sort-by', '--sort-by', [CompletionResultType]::ParameterName, 'Sorting strategy for the package table of an environment')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;ls' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`')
            [CompletionResult]::new('--sort-by', '--sort-by', [CompletionResultType]::ParameterName, 'Sorting strategy for the package table of an environment')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;list' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`')
            [CompletionResult]::new('--sort-by', '--sort-by', [CompletionResultType]::ParameterName, 'Sorting strategy for the package table of an environment')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;ls' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'Allows listing all the packages installed in a specific environment, with an output similar to `pixi list`')
            [CompletionResult]::new('--sort-by', '--sort-by', [CompletionResultType]::ParameterName, 'Sorting strategy for the package table of an environment')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;sync' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;s' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;sync' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;s' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;expose' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add exposed binaries from an environment to your global environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove exposed binaries from the global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;global;e' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add exposed binaries from an environment to your global environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove exposed binaries from the global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;global;expose;add' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to which the binaries should be exposed')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to which the binaries should be exposed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;e;add' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to which the binaries should be exposed')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to which the binaries should be exposed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;expose;remove' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;e;remove' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;expose;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add exposed binaries from an environment to your global environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove exposed binaries from the global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;global;expose;help;add' {
            break
        }
        'pixi;global;expose;help;remove' {
            break
        }
        'pixi;global;expose;help;help' {
            break
        }
        'pixi;global;e;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add exposed binaries from an environment to your global environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove exposed binaries from the global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;global;e;help;add' {
            break
        }
        'pixi;global;e;help;remove' {
            break
        }
        'pixi;global;e;help;help' {
            break
        }
        'pixi;g;expose' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add exposed binaries from an environment to your global environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove exposed binaries from the global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;g;e' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add exposed binaries from an environment to your global environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove exposed binaries from the global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;g;expose;add' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to which the binaries should be exposed')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to which the binaries should be exposed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;e;add' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to which the binaries should be exposed')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to which the binaries should be exposed')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;expose;remove' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;e;remove' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;expose;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add exposed binaries from an environment to your global environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove exposed binaries from the global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;g;expose;help;add' {
            break
        }
        'pixi;g;expose;help;remove' {
            break
        }
        'pixi;g;expose;help;help' {
            break
        }
        'pixi;g;e;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add exposed binaries from an environment to your global environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove exposed binaries from the global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;g;e;help;add' {
            break
        }
        'pixi;g;e;help;remove' {
            break
        }
        'pixi;g;e;help;help' {
            break
        }
        'pixi;global;shortcut' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a shortcut from an environment to your machine.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove shortcuts from your machine')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;global;shortcut;add' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment from which the shortcut should be added')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment from which the shortcut should be added')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;shortcut;remove' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;shortcut;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a shortcut from an environment to your machine.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove shortcuts from your machine')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;global;shortcut;help;add' {
            break
        }
        'pixi;global;shortcut;help;remove' {
            break
        }
        'pixi;global;shortcut;help;help' {
            break
        }
        'pixi;g;shortcut' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a shortcut from an environment to your machine.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove shortcuts from your machine')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;g;shortcut;add' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment from which the shortcut should be added')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment from which the shortcut should be added')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;shortcut;remove' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;shortcut;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a shortcut from an environment to your machine.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove shortcuts from your machine')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;g;shortcut;help;add' {
            break
        }
        'pixi;g;shortcut;help;remove' {
            break
        }
        'pixi;g;shortcut;help;help' {
            break
        }
        'pixi;global;update' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;update' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;upgrade' {
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to install the package for')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;upgrade' {
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to install the package for')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;upgrade-all' {
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to install the package for')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;upgrade-all' {
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to install the package for')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;tree' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to list packages for')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to list packages for')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on a given package in the regex argument')
            [CompletionResult]::new('--invert', '--invert', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on a given package in the regex argument')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;t' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to list packages for')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to list packages for')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on a given package in the regex argument')
            [CompletionResult]::new('--invert', '--invert', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on a given package in the regex argument')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;tree' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to list packages for')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to list packages for')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on a given package in the regex argument')
            [CompletionResult]::new('--invert', '--invert', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on a given package in the regex argument')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;g;t' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to list packages for')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to list packages for')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on a given package in the regex argument')
            [CompletionResult]::new('--invert', '--invert', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on a given package in the regex argument')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;global;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds dependencies to an environment')
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Edit the global manifest file')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Installs the defined packages in a globally accessible location and exposes their command line applications.')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstalls environments from the global environment.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Removes dependencies from an environment')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Sync global manifest with installed environments')
            [CompletionResult]::new('expose', 'expose', [CompletionResultType]::ParameterValue, 'Interact with the exposure of binaries in the global environment')
            [CompletionResult]::new('shortcut', 'shortcut', [CompletionResultType]::ParameterValue, 'Interact with the shortcuts on your machine')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Updates environments in the global environment')
            [CompletionResult]::new('upgrade', 'upgrade', [CompletionResultType]::ParameterValue, 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead')
            [CompletionResult]::new('upgrade-all', 'upgrade-all', [CompletionResultType]::ParameterValue, 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead')
            [CompletionResult]::new('tree', 'tree', [CompletionResultType]::ParameterValue, 'Show a tree of dependencies for a specific global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;global;help;add' {
            break
        }
        'pixi;global;help;edit' {
            break
        }
        'pixi;global;help;install' {
            break
        }
        'pixi;global;help;uninstall' {
            break
        }
        'pixi;global;help;remove' {
            break
        }
        'pixi;global;help;list' {
            break
        }
        'pixi;global;help;sync' {
            break
        }
        'pixi;global;help;expose' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add exposed binaries from an environment to your global environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove exposed binaries from the global environment')
            break
        }
        'pixi;global;help;expose;add' {
            break
        }
        'pixi;global;help;expose;remove' {
            break
        }
        'pixi;global;help;shortcut' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a shortcut from an environment to your machine.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove shortcuts from your machine')
            break
        }
        'pixi;global;help;shortcut;add' {
            break
        }
        'pixi;global;help;shortcut;remove' {
            break
        }
        'pixi;global;help;update' {
            break
        }
        'pixi;global;help;upgrade' {
            break
        }
        'pixi;global;help;upgrade-all' {
            break
        }
        'pixi;global;help;tree' {
            break
        }
        'pixi;global;help;help' {
            break
        }
        'pixi;g;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds dependencies to an environment')
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Edit the global manifest file')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Installs the defined packages in a globally accessible location and exposes their command line applications.')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstalls environments from the global environment.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Removes dependencies from an environment')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Sync global manifest with installed environments')
            [CompletionResult]::new('expose', 'expose', [CompletionResultType]::ParameterValue, 'Interact with the exposure of binaries in the global environment')
            [CompletionResult]::new('shortcut', 'shortcut', [CompletionResultType]::ParameterValue, 'Interact with the shortcuts on your machine')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Updates environments in the global environment')
            [CompletionResult]::new('upgrade', 'upgrade', [CompletionResultType]::ParameterValue, 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead')
            [CompletionResult]::new('upgrade-all', 'upgrade-all', [CompletionResultType]::ParameterValue, 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead')
            [CompletionResult]::new('tree', 'tree', [CompletionResultType]::ParameterValue, 'Show a tree of dependencies for a specific global environment')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;g;help;add' {
            break
        }
        'pixi;g;help;edit' {
            break
        }
        'pixi;g;help;install' {
            break
        }
        'pixi;g;help;uninstall' {
            break
        }
        'pixi;g;help;remove' {
            break
        }
        'pixi;g;help;list' {
            break
        }
        'pixi;g;help;sync' {
            break
        }
        'pixi;g;help;expose' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add exposed binaries from an environment to your global environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove exposed binaries from the global environment')
            break
        }
        'pixi;g;help;expose;add' {
            break
        }
        'pixi;g;help;expose;remove' {
            break
        }
        'pixi;g;help;shortcut' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a shortcut from an environment to your machine.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove shortcuts from your machine')
            break
        }
        'pixi;g;help;shortcut;add' {
            break
        }
        'pixi;g;help;shortcut;remove' {
            break
        }
        'pixi;g;help;update' {
            break
        }
        'pixi;g;help;upgrade' {
            break
        }
        'pixi;g;help;upgrade-all' {
            break
        }
        'pixi;g;help;tree' {
            break
        }
        'pixi;g;help;help' {
            break
        }
        'pixi;info' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--extended', '--extended', [CompletionResultType]::ParameterName, 'Show cache and environment size')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'Whether to show the output as JSON or not')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;init' {
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Channel to use in the workspace')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'Channel to use in the workspace')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Platforms that the workspace supports')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'Platforms that the workspace supports')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Environment.yml file to bootstrap the workspace')
            [CompletionResult]::new('--import', '--import', [CompletionResultType]::ParameterName, 'Environment.yml file to bootstrap the workspace')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'The manifest format to create')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Source Control Management used for this workspace')
            [CompletionResult]::new('--scm', '--scm', [CompletionResultType]::ParameterName, 'Source Control Management used for this workspace')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--pyproject-toml', '--pyproject-toml', [CompletionResultType]::ParameterName, 'Create a pyproject.toml manifest instead of a pixi.toml manifest')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;import' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--format', '--format', [CompletionResultType]::ParameterName, 'Which format to interpret the file as')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platforms for the imported environment')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platforms for the imported environment')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'A name for the created environment')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'A name for the created environment')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'A name for the created feature')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'A name for the created feature')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;install' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to install')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to install')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--skip', '--skip', [CompletionResultType]::ParameterName, 'Skip installation of specific packages present in the lockfile. This uses a soft exclusion: the package will be skipped but its dependencies are installed')
            [CompletionResult]::new('--skip-with-deps', '--skip-with-deps', [CompletionResultType]::ParameterName, 'Skip a package and its entire dependency subtree. This performs a hard exclusion: the package and its dependencies are not installed unless reachable from another non-skipped root')
            [CompletionResult]::new('--only', '--only', [CompletionResultType]::ParameterName, 'Install and build only these package(s) and their dependencies. Can be passed multiple times')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Install all environments')
            [CompletionResult]::new('--all', '--all', [CompletionResultType]::ParameterName, 'Install all environments')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;i' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to install')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to install')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--skip', '--skip', [CompletionResultType]::ParameterName, 'Skip installation of specific packages present in the lockfile. This uses a soft exclusion: the package will be skipped but its dependencies are installed')
            [CompletionResult]::new('--skip-with-deps', '--skip-with-deps', [CompletionResultType]::ParameterName, 'Skip a package and its entire dependency subtree. This performs a hard exclusion: the package and its dependencies are not installed unless reachable from another non-skipped root')
            [CompletionResult]::new('--only', '--only', [CompletionResultType]::ParameterName, 'Install and build only these package(s) and their dependencies. Can be passed multiple times')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Install all environments')
            [CompletionResult]::new('--all', '--all', [CompletionResultType]::ParameterName, 'Install all environments')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;list' {
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to list packages for. Defaults to the current platform')
            [CompletionResult]::new('--sort-by', '--sort-by', [CompletionResultType]::ParameterName, 'Sorting strategy')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to list packages for. Defaults to the default environment')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to list packages for. Defaults to the default environment')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'Whether to output in json format')
            [CompletionResult]::new('--json-pretty', '--json-pretty', [CompletionResultType]::ParameterName, 'Whether to output in pretty json format')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('-x', '-x', [CompletionResultType]::ParameterName, 'Only list packages that are explicitly defined in the workspace')
            [CompletionResult]::new('--explicit', '--explicit', [CompletionResultType]::ParameterName, 'Only list packages that are explicitly defined in the workspace')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;ls' {
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to list packages for. Defaults to the current platform')
            [CompletionResult]::new('--sort-by', '--sort-by', [CompletionResultType]::ParameterName, 'Sorting strategy')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to list packages for. Defaults to the default environment')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to list packages for. Defaults to the default environment')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'Whether to output in json format')
            [CompletionResult]::new('--json-pretty', '--json-pretty', [CompletionResultType]::ParameterName, 'Whether to output in pretty json format')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('-x', '-x', [CompletionResultType]::ParameterName, 'Only list packages that are explicitly defined in the workspace')
            [CompletionResult]::new('--explicit', '--explicit', [CompletionResultType]::ParameterName, 'Only list packages that are explicitly defined in the workspace')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;lock' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'Output the changes in JSON format')
            [CompletionResult]::new('--check', '--check', [CompletionResultType]::ParameterName, 'Check if any changes have been made to the lock file. If yes, exit with a non-zero code')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;reinstall' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to install')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to install')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-a', '-a', [CompletionResultType]::ParameterName, 'Install all environments')
            [CompletionResult]::new('--all', '--all', [CompletionResultType]::ParameterName, 'Install all environments')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;remove' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform for which the dependency should be modified')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform for which the dependency should be modified')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The feature for which the dependency should be modified')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The feature for which the dependency should be modified')
            [CompletionResult]::new('-g', '-g', [CompletionResultType]::ParameterName, 'The git url to use when adding a git dependency')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url to use when adding a git dependency')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'The subdirectory of the git repository to use')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory of the git repository to use')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--host', '--host', [CompletionResultType]::ParameterName, 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`')
            [CompletionResult]::new('--build', '--build', [CompletionResultType]::ParameterName, 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`')
            [CompletionResult]::new('--pypi', '--pypi', [CompletionResultType]::ParameterName, 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;rm' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform for which the dependency should be modified')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform for which the dependency should be modified')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The feature for which the dependency should be modified')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The feature for which the dependency should be modified')
            [CompletionResult]::new('-g', '-g', [CompletionResultType]::ParameterName, 'The git url to use when adding a git dependency')
            [CompletionResult]::new('--git', '--git', [CompletionResultType]::ParameterName, 'The git url to use when adding a git dependency')
            [CompletionResult]::new('--branch', '--branch', [CompletionResultType]::ParameterName, 'The git branch')
            [CompletionResult]::new('--tag', '--tag', [CompletionResultType]::ParameterName, 'The git tag')
            [CompletionResult]::new('--rev', '--rev', [CompletionResultType]::ParameterName, 'The git revision')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'The subdirectory of the git repository to use')
            [CompletionResult]::new('--subdir', '--subdir', [CompletionResultType]::ParameterName, 'The subdirectory of the git repository to use')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--host', '--host', [CompletionResultType]::ParameterName, 'The specified dependencies are host dependencies. Conflicts with `build` and `pypi`')
            [CompletionResult]::new('--build', '--build', [CompletionResultType]::ParameterName, 'The specified dependencies are build dependencies. Conflicts with `host` and `pypi`')
            [CompletionResult]::new('--pypi', '--pypi', [CompletionResultType]::ParameterName, 'The specified dependencies are pypi dependencies. Conflicts with `host` and `build`')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;run' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to run the task in')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to run the task in')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--as-is', '--as-is', [CompletionResultType]::ParameterName, 'Shorthand for the combination of --no-install and --frozen')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--force-activate', '--force-activate', [CompletionResultType]::ParameterName, 'Do not use the environment activation cache. (default: true except in experimental mode)')
            [CompletionResult]::new('--no-completions', '--no-completions', [CompletionResultType]::ParameterName, 'Do not source the autocompletion scripts from the environment')
            [CompletionResult]::new('--clean-env', '--clean-env', [CompletionResultType]::ParameterName, 'Use a clean environment to run the task')
            [CompletionResult]::new('--skip-deps', '--skip-deps', [CompletionResultType]::ParameterName, 'Don''t run the dependencies of the task (''depends-on'' field in the task definition)')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'Run the task in dry-run mode (only print the command that would run)')
            [CompletionResult]::new('--dry-run', '--dry-run', [CompletionResultType]::ParameterName, 'Run the task in dry-run mode (only print the command that would run)')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'help')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'h')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;r' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to run the task in')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to run the task in')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--as-is', '--as-is', [CompletionResultType]::ParameterName, 'Shorthand for the combination of --no-install and --frozen')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--force-activate', '--force-activate', [CompletionResultType]::ParameterName, 'Do not use the environment activation cache. (default: true except in experimental mode)')
            [CompletionResult]::new('--no-completions', '--no-completions', [CompletionResultType]::ParameterName, 'Do not source the autocompletion scripts from the environment')
            [CompletionResult]::new('--clean-env', '--clean-env', [CompletionResultType]::ParameterName, 'Use a clean environment to run the task')
            [CompletionResult]::new('--skip-deps', '--skip-deps', [CompletionResultType]::ParameterName, 'Don''t run the dependencies of the task (''depends-on'' field in the task definition)')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'Run the task in dry-run mode (only print the command that would run)')
            [CompletionResult]::new('--dry-run', '--dry-run', [CompletionResultType]::ParameterName, 'Run the task in dry-run mode (only print the command that would run)')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'help')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'h')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;search' {
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--channel', '--channel', [CompletionResultType]::ParameterName, 'The channels to consider as a name or a url. Multiple channels can be specified by using this field multiple times')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to search for, defaults to current platform')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to search for, defaults to current platform')
            [CompletionResult]::new('-l', '-l', [CompletionResultType]::ParameterName, 'Limit the number of search results')
            [CompletionResult]::new('--limit', '--limit', [CompletionResultType]::ParameterName, 'Limit the number of search results')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;self-update' {
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'The desired version (to downgrade or upgrade to)')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--dry-run', '--dry-run', [CompletionResultType]::ParameterName, 'Only show release notes, do not modify the binary')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Force download the desired version when not exactly same with the current. If no desired version, always replace with the latest version')
            [CompletionResult]::new('--no-release-note', '--no-release-note', [CompletionResultType]::ParameterName, 'Skip printing the release notes')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;shell' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to activate in the shell')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to activate in the shell')
            [CompletionResult]::new('--change-ps1', '--change-ps1', [CompletionResultType]::ParameterName, 'Do not change the PS1 variable when starting a prompt')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--as-is', '--as-is', [CompletionResultType]::ParameterName, 'Shorthand for the combination of --no-install and --frozen')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--force-activate', '--force-activate', [CompletionResultType]::ParameterName, 'Do not use the environment activation cache. (default: true except in experimental mode)')
            [CompletionResult]::new('--no-completions', '--no-completions', [CompletionResultType]::ParameterName, 'Do not source the autocompletion scripts from the environment')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;s' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to activate in the shell')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to activate in the shell')
            [CompletionResult]::new('--change-ps1', '--change-ps1', [CompletionResultType]::ParameterName, 'Do not change the PS1 variable when starting a prompt')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--as-is', '--as-is', [CompletionResultType]::ParameterName, 'Shorthand for the combination of --no-install and --frozen')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--force-activate', '--force-activate', [CompletionResultType]::ParameterName, 'Do not use the environment activation cache. (default: true except in experimental mode)')
            [CompletionResult]::new('--no-completions', '--no-completions', [CompletionResultType]::ParameterName, 'Do not source the autocompletion scripts from the environment')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;shell-hook' {
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Sets the shell, options: [`bash`,  `zsh`,  `xonsh`,  `cmd`, `powershell`,  `fish`,  `nushell`]')
            [CompletionResult]::new('--shell', '--shell', [CompletionResultType]::ParameterName, 'Sets the shell, options: [`bash`,  `zsh`,  `xonsh`,  `cmd`, `powershell`,  `fish`,  `nushell`]')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to activate in the script')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to activate in the script')
            [CompletionResult]::new('--change-ps1', '--change-ps1', [CompletionResultType]::ParameterName, 'Do not change the PS1 variable when starting a prompt')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--as-is', '--as-is', [CompletionResultType]::ParameterName, 'Shorthand for the combination of --no-install and --frozen')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--force-activate', '--force-activate', [CompletionResultType]::ParameterName, 'Do not use the environment activation cache. (default: true except in experimental mode)')
            [CompletionResult]::new('--no-completions', '--no-completions', [CompletionResultType]::ParameterName, 'Do not source the autocompletion scripts from the environment')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'Emit the environment variables set by running the activation as JSON')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;task' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a command to the workspace')
            [CompletionResult]::new('a', 'a', [CompletionResultType]::ParameterValue, 'Add a command to the workspace')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a command from the workspace')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove a command from the workspace')
            [CompletionResult]::new('alias', 'alias', [CompletionResultType]::ParameterValue, 'Alias another specific command')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all tasks in the workspace')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List all tasks in the workspace')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;task;add' {
            [CompletionResult]::new('--depends-on', '--depends-on', [CompletionResultType]::ParameterName, 'Depends on these other commands')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform for which the task should be added')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform for which the task should be added')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The feature for which the task should be added')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The feature for which the task should be added')
            [CompletionResult]::new('--cwd', '--cwd', [CompletionResultType]::ParameterName, 'The working directory relative to the root of the workspace')
            [CompletionResult]::new('--env', '--env', [CompletionResultType]::ParameterName, 'The environment variable to set, use --env key=value multiple times for more than one variable')
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'A description of the task to be added')
            [CompletionResult]::new('--arg', '--arg', [CompletionResultType]::ParameterName, 'The arguments to pass to the task')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--clean-env', '--clean-env', [CompletionResultType]::ParameterName, 'Isolate the task from the shell environment, and only use the pixi environment to run the task')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;task;a' {
            [CompletionResult]::new('--depends-on', '--depends-on', [CompletionResultType]::ParameterName, 'Depends on these other commands')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform for which the task should be added')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform for which the task should be added')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The feature for which the task should be added')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The feature for which the task should be added')
            [CompletionResult]::new('--cwd', '--cwd', [CompletionResultType]::ParameterName, 'The working directory relative to the root of the workspace')
            [CompletionResult]::new('--env', '--env', [CompletionResultType]::ParameterName, 'The environment variable to set, use --env key=value multiple times for more than one variable')
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'A description of the task to be added')
            [CompletionResult]::new('--arg', '--arg', [CompletionResultType]::ParameterName, 'The arguments to pass to the task')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--clean-env', '--clean-env', [CompletionResultType]::ParameterName, 'Isolate the task from the shell environment, and only use the pixi environment to run the task')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;task;remove' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform for which the task should be removed')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform for which the task should be removed')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The feature for which the task should be removed')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The feature for which the task should be removed')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;task;rm' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform for which the task should be removed')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform for which the task should be removed')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The feature for which the task should be removed')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The feature for which the task should be removed')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;task;alias' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform for which the alias should be added')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform for which the alias should be added')
            [CompletionResult]::new('--description', '--description', [CompletionResultType]::ParameterName, 'The description of the alias task')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;task;list' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment the list should be generated for. If not specified, the default environment is used')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment the list should be generated for. If not specified, the default environment is used')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Tasks available for this machine per environment')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'Tasks available for this machine per environment')
            [CompletionResult]::new('--machine-readable', '--machine-readable', [CompletionResultType]::ParameterName, 'Output the list of tasks from all environments in machine readable format (space delimited) this output is used for autocomplete by `pixi run`')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'List as json instead of a tree If not specified, the default environment is used')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;task;ls' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment the list should be generated for. If not specified, the default environment is used')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment the list should be generated for. If not specified, the default environment is used')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-s', '-s', [CompletionResultType]::ParameterName, 'Tasks available for this machine per environment')
            [CompletionResult]::new('--summary', '--summary', [CompletionResultType]::ParameterName, 'Tasks available for this machine per environment')
            [CompletionResult]::new('--machine-readable', '--machine-readable', [CompletionResultType]::ParameterName, 'Output the list of tasks from all environments in machine readable format (space delimited) this output is used for autocomplete by `pixi run`')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'List as json instead of a tree If not specified, the default environment is used')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;task;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a command to the workspace')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a command from the workspace')
            [CompletionResult]::new('alias', 'alias', [CompletionResultType]::ParameterValue, 'Alias another specific command')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all tasks in the workspace')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;task;help;add' {
            break
        }
        'pixi;task;help;remove' {
            break
        }
        'pixi;task;help;alias' {
            break
        }
        'pixi;task;help;list' {
            break
        }
        'pixi;task;help;help' {
            break
        }
        'pixi;tree' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to list packages for. Defaults to the current platform')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to list packages for. Defaults to the current platform')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to list packages for. Defaults to the default environment')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to list packages for. Defaults to the default environment')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on given package in the regex argument')
            [CompletionResult]::new('--invert', '--invert', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on given package in the regex argument')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;t' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to list packages for. Defaults to the current platform')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to list packages for. Defaults to the current platform')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to list packages for. Defaults to the default environment')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to list packages for. Defaults to the default environment')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('-i', '-i', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on given package in the regex argument')
            [CompletionResult]::new('--invert', '--invert', [CompletionResultType]::ParameterName, 'Invert tree and show what depends on given package in the regex argument')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;update' {
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environments to update. If none is specified, all environments are updated')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environments to update. If none is specified, all environments are updated')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platforms to update. If none is specified, all platforms are updated')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platforms to update. If none is specified, all platforms are updated')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t install the (solve) environments needed for pypi-dependencies solving')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'Don''t actually write the lockfile or update any environment')
            [CompletionResult]::new('--dry-run', '--dry-run', [CompletionResultType]::ParameterName, 'Don''t actually write the lockfile or update any environment')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'Output the changes in JSON format')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;upgrade' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The feature to update')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The feature to update')
            [CompletionResult]::new('--exclude', '--exclude', [CompletionResultType]::ParameterName, 'The packages which should be excluded')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'Output the changes in JSON format')
            [CompletionResult]::new('-n', '-n', [CompletionResultType]::ParameterName, 'Only show the changes that would be made, without actually updating the manifest, lock file, or environment')
            [CompletionResult]::new('--dry-run', '--dry-run', [CompletionResultType]::ParameterName, 'Only show the changes that would be made, without actually updating the manifest, lock file, or environment')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;upload' {
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('channel', 'channel', [CompletionResultType]::ParameterValue, 'Commands to manage workspace channels')
            [CompletionResult]::new('description', 'description', [CompletionResultType]::ParameterValue, 'Commands to manage workspace description')
            [CompletionResult]::new('platform', 'platform', [CompletionResultType]::ParameterValue, 'Commands to manage workspace platforms')
            [CompletionResult]::new('version', 'version', [CompletionResultType]::ParameterValue, 'Commands to manage workspace version')
            [CompletionResult]::new('environment', 'environment', [CompletionResultType]::ParameterValue, 'Commands to manage workspace environments')
            [CompletionResult]::new('export', 'export', [CompletionResultType]::ParameterValue, 'Commands to export workspaces to other formats')
            [CompletionResult]::new('name', 'name', [CompletionResultType]::ParameterValue, 'Commands to manage workspace name')
            [CompletionResult]::new('system-requirements', 'system-requirements', [CompletionResultType]::ParameterValue, 'Commands to manage workspace system requirements')
            [CompletionResult]::new('requires-pixi', 'requires-pixi', [CompletionResultType]::ParameterValue, 'Commands to manage the pixi minimum version requirement')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;channel' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds a channel to the manifest and updates the lockfile')
            [CompletionResult]::new('a', 'a', [CompletionResultType]::ParameterValue, 'Adds a channel to the manifest and updates the lockfile')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the channels in the manifest')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List the channels in the manifest')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove channel(s) from the manifest and updates the lockfile')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove channel(s) from the manifest and updates the lockfile')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;channel;add' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--priority', '--priority', [CompletionResultType]::ParameterName, 'Specify the channel priority')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--prepend', '--prepend', [CompletionResultType]::ParameterName, 'Add the channel(s) to the beginning of the channels list, making them the highest priority')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;channel;a' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--priority', '--priority', [CompletionResultType]::ParameterName, 'Specify the channel priority')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--prepend', '--prepend', [CompletionResultType]::ParameterName, 'Add the channel(s) to the beginning of the channels list, making them the highest priority')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;channel;list' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--urls', '--urls', [CompletionResultType]::ParameterName, 'Whether to display the channel''s names or urls')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;channel;ls' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--urls', '--urls', [CompletionResultType]::ParameterName, 'Whether to display the channel''s names or urls')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;channel;remove' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--priority', '--priority', [CompletionResultType]::ParameterName, 'Specify the channel priority')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--prepend', '--prepend', [CompletionResultType]::ParameterName, 'Add the channel(s) to the beginning of the channels list, making them the highest priority')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;channel;rm' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--priority', '--priority', [CompletionResultType]::ParameterName, 'Specify the channel priority')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--prepend', '--prepend', [CompletionResultType]::ParameterName, 'Add the channel(s) to the beginning of the channels list, making them the highest priority')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;channel;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds a channel to the manifest and updates the lockfile')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the channels in the manifest')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove channel(s) from the manifest and updates the lockfile')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;channel;help;add' {
            break
        }
        'pixi;workspace;channel;help;list' {
            break
        }
        'pixi;workspace;channel;help;remove' {
            break
        }
        'pixi;workspace;channel;help;help' {
            break
        }
        'pixi;workspace;description' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace description')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace description')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;description;get' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;description;set' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;description;help' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace description')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace description')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;description;help;get' {
            break
        }
        'pixi;workspace;description;help;set' {
            break
        }
        'pixi;workspace;description;help;help' {
            break
        }
        'pixi;workspace;platform' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds a platform(s) to the workspace file and updates the lockfile')
            [CompletionResult]::new('a', 'a', [CompletionResultType]::ParameterValue, 'Adds a platform(s) to the workspace file and updates the lockfile')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the platforms in the workspace file')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List the platforms in the workspace file')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove platform(s) from the workspace file and updates the lockfile')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove platform(s) from the workspace file and updates the lockfile')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;platform;add' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The name of the feature to add the platform to')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The name of the feature to add the platform to')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t update the environment, only add changed packages to the lock-file')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;platform;a' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The name of the feature to add the platform to')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The name of the feature to add the platform to')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t update the environment, only add changed packages to the lock-file')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;platform;list' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;platform;ls' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;platform;remove' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The name of the feature to remove the platform from')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The name of the feature to remove the platform from')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t update the environment, only remove the platform(s) from the lock-file')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;platform;rm' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The name of the feature to remove the platform from')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The name of the feature to remove the platform from')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t update the environment, only remove the platform(s) from the lock-file')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;platform;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds a platform(s) to the workspace file and updates the lockfile')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the platforms in the workspace file')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove platform(s) from the workspace file and updates the lockfile')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;platform;help;add' {
            break
        }
        'pixi;workspace;platform;help;list' {
            break
        }
        'pixi;workspace;platform;help;remove' {
            break
        }
        'pixi;workspace;platform;help;help' {
            break
        }
        'pixi;workspace;version' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace version')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace version')
            [CompletionResult]::new('major', 'major', [CompletionResultType]::ParameterValue, 'Bump the workspace version to MAJOR')
            [CompletionResult]::new('minor', 'minor', [CompletionResultType]::ParameterValue, 'Bump the workspace version to MINOR')
            [CompletionResult]::new('patch', 'patch', [CompletionResultType]::ParameterValue, 'Bump the workspace version to PATCH')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;version;get' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;version;set' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;version;major' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;version;minor' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;version;patch' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;version;help' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace version')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace version')
            [CompletionResult]::new('major', 'major', [CompletionResultType]::ParameterValue, 'Bump the workspace version to MAJOR')
            [CompletionResult]::new('minor', 'minor', [CompletionResultType]::ParameterValue, 'Bump the workspace version to MINOR')
            [CompletionResult]::new('patch', 'patch', [CompletionResultType]::ParameterValue, 'Bump the workspace version to PATCH')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;version;help;get' {
            break
        }
        'pixi;workspace;version;help;set' {
            break
        }
        'pixi;workspace;version;help;major' {
            break
        }
        'pixi;workspace;version;help;minor' {
            break
        }
        'pixi;workspace;version;help;patch' {
            break
        }
        'pixi;workspace;version;help;help' {
            break
        }
        'pixi;workspace;environment' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds an environment to the manifest file')
            [CompletionResult]::new('a', 'a', [CompletionResultType]::ParameterValue, 'Adds an environment to the manifest file')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the environments in the manifest file')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List the environments in the manifest file')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove an environment from the manifest file')
            [CompletionResult]::new('rm', 'rm', [CompletionResultType]::ParameterValue, 'Remove an environment from the manifest file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;environment;add' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Features to add to the environment')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'Features to add to the environment')
            [CompletionResult]::new('--solve-group', '--solve-group', [CompletionResultType]::ParameterName, 'The solve-group to add the environment to')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-default-feature', '--no-default-feature', [CompletionResultType]::ParameterName, 'Don''t include the default feature in the environment')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Update the manifest even if the environment already exists')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;environment;a' {
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'Features to add to the environment')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'Features to add to the environment')
            [CompletionResult]::new('--solve-group', '--solve-group', [CompletionResultType]::ParameterName, 'The solve-group to add the environment to')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--no-default-feature', '--no-default-feature', [CompletionResultType]::ParameterName, 'Don''t include the default feature in the environment')
            [CompletionResult]::new('--force', '--force', [CompletionResultType]::ParameterName, 'Update the manifest even if the environment already exists')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;environment;list' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;environment;ls' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;environment;remove' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;environment;rm' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;environment;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds an environment to the manifest file')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the environments in the manifest file')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove an environment from the manifest file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;environment;help;add' {
            break
        }
        'pixi;workspace;environment;help;list' {
            break
        }
        'pixi;workspace;environment;help;remove' {
            break
        }
        'pixi;workspace;environment;help;help' {
            break
        }
        'pixi;workspace;export' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('conda-explicit-spec', 'conda-explicit-spec', [CompletionResultType]::ParameterValue, 'Export workspace environment to a conda explicit specification file')
            [CompletionResult]::new('ces', 'ces', [CompletionResultType]::ParameterValue, 'Export workspace environment to a conda explicit specification file')
            [CompletionResult]::new('conda-environment', 'conda-environment', [CompletionResultType]::ParameterValue, 'Export workspace environment to a conda environment.yaml file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;export;conda-explicit-spec' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environments to render. Can be repeated for multiple environments')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environments to render. Can be repeated for multiple environments')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to render. Can be repeated for multiple platforms. Defaults to all platforms available for selected environments')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to render. Can be repeated for multiple platforms. Defaults to all platforms available for selected environments')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--ignore-pypi-errors', '--ignore-pypi-errors', [CompletionResultType]::ParameterName, 'PyPI dependencies are not supported in the conda explicit spec file')
            [CompletionResult]::new('--ignore-source-errors', '--ignore-source-errors', [CompletionResultType]::ParameterName, 'Source dependencies are not supported in the conda explicit spec file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;export;ces' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environments to render. Can be repeated for multiple environments')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environments to render. Can be repeated for multiple environments')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to render. Can be repeated for multiple platforms. Defaults to all platforms available for selected environments')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to render. Can be repeated for multiple platforms. Defaults to all platforms available for selected environments')
            [CompletionResult]::new('--auth-file', '--auth-file', [CompletionResultType]::ParameterName, 'Path to the file containing the authentication token')
            [CompletionResult]::new('--concurrent-downloads', '--concurrent-downloads', [CompletionResultType]::ParameterName, 'Max concurrent network requests, default is `50`')
            [CompletionResult]::new('--concurrent-solves', '--concurrent-solves', [CompletionResultType]::ParameterName, 'Max concurrent solves, default is the number of CPUs')
            [CompletionResult]::new('--pinning-strategy', '--pinning-strategy', [CompletionResultType]::ParameterName, 'Set pinning strategy')
            [CompletionResult]::new('--pypi-keyring-provider', '--pypi-keyring-provider', [CompletionResultType]::ParameterName, 'Specifies whether to use the keyring to look up credentials for PyPI')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--ignore-pypi-errors', '--ignore-pypi-errors', [CompletionResultType]::ParameterName, 'PyPI dependencies are not supported in the conda explicit spec file')
            [CompletionResult]::new('--ignore-source-errors', '--ignore-source-errors', [CompletionResultType]::ParameterName, 'Source dependencies are not supported in the conda explicit spec file')
            [CompletionResult]::new('--no-lockfile-update', '--no-lockfile-update', [CompletionResultType]::ParameterName, 'DEPRECATED: use `--frozen` `--no-install`. Skips lock-file updates')
            [CompletionResult]::new('--frozen', '--frozen', [CompletionResultType]::ParameterName, 'Install the environment as defined in the lockfile, doesn''t update lockfile if it isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--locked', '--locked', [CompletionResultType]::ParameterName, 'Check if lockfile is up-to-date before installing the environment, aborts when lockfile isn''t up-to-date with the manifest file')
            [CompletionResult]::new('--no-install', '--no-install', [CompletionResultType]::ParameterName, 'Don''t modify the environment, only modify the lock-file')
            [CompletionResult]::new('--run-post-link-scripts', '--run-post-link-scripts', [CompletionResultType]::ParameterName, 'Run post-link scripts (insecure)')
            [CompletionResult]::new('--tls-no-verify', '--tls-no-verify', [CompletionResultType]::ParameterName, 'Do not verify the TLS certificate of the server')
            [CompletionResult]::new('--use-environment-activation-cache', '--use-environment-activation-cache', [CompletionResultType]::ParameterName, 'Use environment activation cache (experimental)')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;export;conda-environment' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'The platform to render the environment file for. Defaults to the current platform')
            [CompletionResult]::new('--platform', '--platform', [CompletionResultType]::ParameterName, 'The platform to render the environment file for. Defaults to the current platform')
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to render the environment file for. Defaults to the default environment')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to render the environment file for. Defaults to the default environment')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;export;help' {
            [CompletionResult]::new('conda-explicit-spec', 'conda-explicit-spec', [CompletionResultType]::ParameterValue, 'Export workspace environment to a conda explicit specification file')
            [CompletionResult]::new('conda-environment', 'conda-environment', [CompletionResultType]::ParameterValue, 'Export workspace environment to a conda environment.yaml file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;export;help;conda-explicit-spec' {
            break
        }
        'pixi;workspace;export;help;conda-environment' {
            break
        }
        'pixi;workspace;export;help;help' {
            break
        }
        'pixi;workspace;name' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace name')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace name')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;name;get' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;name;set' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;name;help' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace name')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace name')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;name;help;get' {
            break
        }
        'pixi;workspace;name;help;set' {
            break
        }
        'pixi;workspace;name;help;help' {
            break
        }
        'pixi;workspace;system-requirements' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds an environment to the manifest file')
            [CompletionResult]::new('a', 'a', [CompletionResultType]::ParameterValue, 'Adds an environment to the manifest file')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the environments in the manifest file')
            [CompletionResult]::new('ls', 'ls', [CompletionResultType]::ParameterValue, 'List the environments in the manifest file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;system-requirements;add' {
            [CompletionResult]::new('--family', '--family', [CompletionResultType]::ParameterName, 'The Libc family, this can only be specified for requirement `other-libc`')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;system-requirements;a' {
            [CompletionResult]::new('--family', '--family', [CompletionResultType]::ParameterName, 'The Libc family, this can only be specified for requirement `other-libc`')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--feature', '--feature', [CompletionResultType]::ParameterName, 'The name of the feature to modify')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;system-requirements;list' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to list the system requirements for')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to list the system requirements for')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'List the system requirements in JSON format')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;system-requirements;ls' {
            [CompletionResult]::new('-e', '-e', [CompletionResultType]::ParameterName, 'The environment to list the system requirements for')
            [CompletionResult]::new('--environment', '--environment', [CompletionResultType]::ParameterName, 'The environment to list the system requirements for')
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'List the system requirements in JSON format')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;system-requirements;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds an environment to the manifest file')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the environments in the manifest file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;system-requirements;help;add' {
            break
        }
        'pixi;workspace;system-requirements;help;list' {
            break
        }
        'pixi;workspace;system-requirements;help;help' {
            break
        }
        'pixi;workspace;requires-pixi' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the pixi minimum version requirement')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the pixi minimum version requirement')
            [CompletionResult]::new('unset', 'unset', [CompletionResultType]::ParameterValue, 'Remove the pixi minimum version requirement')
            [CompletionResult]::new('verify', 'verify', [CompletionResultType]::ParameterValue, 'Verify the pixi minimum version requirement')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;requires-pixi;get' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;requires-pixi;set' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;requires-pixi;unset' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;requires-pixi;verify' {
            [CompletionResult]::new('--manifest-path', '--manifest-path', [CompletionResultType]::ParameterName, 'The path to `pixi.toml`, `pyproject.toml`, or the workspace directory')
            [CompletionResult]::new('--color', '--color', [CompletionResultType]::ParameterName, 'Whether the log needs to be colored')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Display help information')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Increase logging verbosity (-v for warnings, -vv for info, -vvv for debug, -vvvv for trace)')
            [CompletionResult]::new('-q', '-q', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--quiet', '--quiet', [CompletionResultType]::ParameterName, 'Decrease logging verbosity (quiet mode)')
            [CompletionResult]::new('--no-progress', '--no-progress', [CompletionResultType]::ParameterName, 'Hide all progress bars, always turned on if stderr is not a terminal')
            break
        }
        'pixi;workspace;requires-pixi;help' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the pixi minimum version requirement')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the pixi minimum version requirement')
            [CompletionResult]::new('unset', 'unset', [CompletionResultType]::ParameterValue, 'Remove the pixi minimum version requirement')
            [CompletionResult]::new('verify', 'verify', [CompletionResultType]::ParameterValue, 'Verify the pixi minimum version requirement')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;requires-pixi;help;get' {
            break
        }
        'pixi;workspace;requires-pixi;help;set' {
            break
        }
        'pixi;workspace;requires-pixi;help;unset' {
            break
        }
        'pixi;workspace;requires-pixi;help;verify' {
            break
        }
        'pixi;workspace;requires-pixi;help;help' {
            break
        }
        'pixi;workspace;help' {
            [CompletionResult]::new('channel', 'channel', [CompletionResultType]::ParameterValue, 'Commands to manage workspace channels')
            [CompletionResult]::new('description', 'description', [CompletionResultType]::ParameterValue, 'Commands to manage workspace description')
            [CompletionResult]::new('platform', 'platform', [CompletionResultType]::ParameterValue, 'Commands to manage workspace platforms')
            [CompletionResult]::new('version', 'version', [CompletionResultType]::ParameterValue, 'Commands to manage workspace version')
            [CompletionResult]::new('environment', 'environment', [CompletionResultType]::ParameterValue, 'Commands to manage workspace environments')
            [CompletionResult]::new('export', 'export', [CompletionResultType]::ParameterValue, 'Commands to export workspaces to other formats')
            [CompletionResult]::new('name', 'name', [CompletionResultType]::ParameterValue, 'Commands to manage workspace name')
            [CompletionResult]::new('system-requirements', 'system-requirements', [CompletionResultType]::ParameterValue, 'Commands to manage workspace system requirements')
            [CompletionResult]::new('requires-pixi', 'requires-pixi', [CompletionResultType]::ParameterValue, 'Commands to manage the pixi minimum version requirement')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;workspace;help;channel' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds a channel to the manifest and updates the lockfile')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the channels in the manifest')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove channel(s) from the manifest and updates the lockfile')
            break
        }
        'pixi;workspace;help;channel;add' {
            break
        }
        'pixi;workspace;help;channel;list' {
            break
        }
        'pixi;workspace;help;channel;remove' {
            break
        }
        'pixi;workspace;help;description' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace description')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace description')
            break
        }
        'pixi;workspace;help;description;get' {
            break
        }
        'pixi;workspace;help;description;set' {
            break
        }
        'pixi;workspace;help;platform' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds a platform(s) to the workspace file and updates the lockfile')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the platforms in the workspace file')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove platform(s) from the workspace file and updates the lockfile')
            break
        }
        'pixi;workspace;help;platform;add' {
            break
        }
        'pixi;workspace;help;platform;list' {
            break
        }
        'pixi;workspace;help;platform;remove' {
            break
        }
        'pixi;workspace;help;version' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace version')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace version')
            [CompletionResult]::new('major', 'major', [CompletionResultType]::ParameterValue, 'Bump the workspace version to MAJOR')
            [CompletionResult]::new('minor', 'minor', [CompletionResultType]::ParameterValue, 'Bump the workspace version to MINOR')
            [CompletionResult]::new('patch', 'patch', [CompletionResultType]::ParameterValue, 'Bump the workspace version to PATCH')
            break
        }
        'pixi;workspace;help;version;get' {
            break
        }
        'pixi;workspace;help;version;set' {
            break
        }
        'pixi;workspace;help;version;major' {
            break
        }
        'pixi;workspace;help;version;minor' {
            break
        }
        'pixi;workspace;help;version;patch' {
            break
        }
        'pixi;workspace;help;environment' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds an environment to the manifest file')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the environments in the manifest file')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove an environment from the manifest file')
            break
        }
        'pixi;workspace;help;environment;add' {
            break
        }
        'pixi;workspace;help;environment;list' {
            break
        }
        'pixi;workspace;help;environment;remove' {
            break
        }
        'pixi;workspace;help;export' {
            [CompletionResult]::new('conda-explicit-spec', 'conda-explicit-spec', [CompletionResultType]::ParameterValue, 'Export workspace environment to a conda explicit specification file')
            [CompletionResult]::new('conda-environment', 'conda-environment', [CompletionResultType]::ParameterValue, 'Export workspace environment to a conda environment.yaml file')
            break
        }
        'pixi;workspace;help;export;conda-explicit-spec' {
            break
        }
        'pixi;workspace;help;export;conda-environment' {
            break
        }
        'pixi;workspace;help;name' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace name')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace name')
            break
        }
        'pixi;workspace;help;name;get' {
            break
        }
        'pixi;workspace;help;name;set' {
            break
        }
        'pixi;workspace;help;system-requirements' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds an environment to the manifest file')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the environments in the manifest file')
            break
        }
        'pixi;workspace;help;system-requirements;add' {
            break
        }
        'pixi;workspace;help;system-requirements;list' {
            break
        }
        'pixi;workspace;help;requires-pixi' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the pixi minimum version requirement')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the pixi minimum version requirement')
            [CompletionResult]::new('unset', 'unset', [CompletionResultType]::ParameterValue, 'Remove the pixi minimum version requirement')
            [CompletionResult]::new('verify', 'verify', [CompletionResultType]::ParameterValue, 'Verify the pixi minimum version requirement')
            break
        }
        'pixi;workspace;help;requires-pixi;get' {
            break
        }
        'pixi;workspace;help;requires-pixi;set' {
            break
        }
        'pixi;workspace;help;requires-pixi;unset' {
            break
        }
        'pixi;workspace;help;requires-pixi;verify' {
            break
        }
        'pixi;workspace;help;help' {
            break
        }
        'pixi;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds dependencies to the workspace')
            [CompletionResult]::new('auth', 'auth', [CompletionResultType]::ParameterValue, 'Login to prefix.dev or anaconda.org servers to access private channels')
            [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterValue, 'Workspace configuration')
            [CompletionResult]::new('clean', 'clean', [CompletionResultType]::ParameterValue, 'Cleanup the environments')
            [CompletionResult]::new('completion', 'completion', [CompletionResultType]::ParameterValue, 'Generates a completion script for a shell')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'Configuration management')
            [CompletionResult]::new('exec', 'exec', [CompletionResultType]::ParameterValue, 'Run a command and install it in a temporary environment')
            [CompletionResult]::new('global', 'global', [CompletionResultType]::ParameterValue, 'Subcommand for global package management actions')
            [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterValue, 'Information about the system, workspace and environments for the current machine')
            [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterValue, 'Creates a new workspace')
            [CompletionResult]::new('import', 'import', [CompletionResultType]::ParameterValue, 'Imports a file into an environment in an existing workspace.')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Install an environment, both updating the lockfile and installing the environment')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List workspace''s packages')
            [CompletionResult]::new('lock', 'lock', [CompletionResultType]::ParameterValue, 'Solve environment and update the lock file without installing the environments')
            [CompletionResult]::new('reinstall', 'reinstall', [CompletionResultType]::ParameterValue, 'Re-install an environment, both updating the lockfile and re-installing the environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Removes dependencies from the workspace')
            [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterValue, 'Runs task in the pixi environment')
            [CompletionResult]::new('search', 'search', [CompletionResultType]::ParameterValue, 'Search a conda package')
            [CompletionResult]::new('self-update', 'self-update', [CompletionResultType]::ParameterValue, 'Update pixi to the latest version or a specific version')
            [CompletionResult]::new('shell', 'shell', [CompletionResultType]::ParameterValue, 'Start a shell in a pixi environment, run `exit` to leave the shell')
            [CompletionResult]::new('shell-hook', 'shell-hook', [CompletionResultType]::ParameterValue, 'Print the pixi environment activation script')
            [CompletionResult]::new('task', 'task', [CompletionResultType]::ParameterValue, 'Interact with tasks in the workspace')
            [CompletionResult]::new('tree', 'tree', [CompletionResultType]::ParameterValue, 'Show a tree of workspace dependencies')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'The `update` command checks if there are newer versions of the dependencies and updates the `pixi.lock` file and environments accordingly')
            [CompletionResult]::new('upgrade', 'upgrade', [CompletionResultType]::ParameterValue, 'Checks if there are newer versions of the dependencies and upgrades them in the lockfile and manifest file')
            [CompletionResult]::new('upload', 'upload', [CompletionResultType]::ParameterValue, 'Upload a conda package')
            [CompletionResult]::new('workspace', 'workspace', [CompletionResultType]::ParameterValue, 'Modify the workspace configuration file through the command line')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pixi;help;add' {
            break
        }
        'pixi;help;auth' {
            [CompletionResult]::new('login', 'login', [CompletionResultType]::ParameterValue, 'Store authentication information for a given host')
            [CompletionResult]::new('logout', 'logout', [CompletionResultType]::ParameterValue, 'Remove authentication information for a given host')
            break
        }
        'pixi;help;auth;login' {
            break
        }
        'pixi;help;auth;logout' {
            break
        }
        'pixi;help;build' {
            break
        }
        'pixi;help;clean' {
            [CompletionResult]::new('cache', 'cache', [CompletionResultType]::ParameterValue, 'Clean the cache of your system which are touched by pixi')
            break
        }
        'pixi;help;clean;cache' {
            break
        }
        'pixi;help;completion' {
            break
        }
        'pixi;help;config' {
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Edit the configuration file')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List configuration values')
            [CompletionResult]::new('prepend', 'prepend', [CompletionResultType]::ParameterValue, 'Prepend a value to a list configuration key')
            [CompletionResult]::new('append', 'append', [CompletionResultType]::ParameterValue, 'Append a value to a list configuration key')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set a configuration value')
            [CompletionResult]::new('unset', 'unset', [CompletionResultType]::ParameterValue, 'Unset a configuration value')
            break
        }
        'pixi;help;config;edit' {
            break
        }
        'pixi;help;config;list' {
            break
        }
        'pixi;help;config;prepend' {
            break
        }
        'pixi;help;config;append' {
            break
        }
        'pixi;help;config;set' {
            break
        }
        'pixi;help;config;unset' {
            break
        }
        'pixi;help;exec' {
            break
        }
        'pixi;help;global' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds dependencies to an environment')
            [CompletionResult]::new('edit', 'edit', [CompletionResultType]::ParameterValue, 'Edit the global manifest file')
            [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterValue, 'Installs the defined packages in a globally accessible location and exposes their command line applications.')
            [CompletionResult]::new('uninstall', 'uninstall', [CompletionResultType]::ParameterValue, 'Uninstalls environments from the global environment.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Removes dependencies from an environment')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'Lists global environments with their dependencies and exposed commands. Can also display all packages within a specific global environment when using the --environment flag.')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Sync global manifest with installed environments')
            [CompletionResult]::new('expose', 'expose', [CompletionResultType]::ParameterValue, 'Interact with the exposure of binaries in the global environment')
            [CompletionResult]::new('shortcut', 'shortcut', [CompletionResultType]::ParameterValue, 'Interact with the shortcuts on your machine')
            [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterValue, 'Updates environments in the global environment')
            [CompletionResult]::new('upgrade', 'upgrade', [CompletionResultType]::ParameterValue, 'Upgrade specific package which is installed globally. This command has been removed, please use `pixi global update` instead')
            [CompletionResult]::new('upgrade-all', 'upgrade-all', [CompletionResultType]::ParameterValue, 'Upgrade all globally installed packages This command has been removed, please use `pixi global update` instead')
            [CompletionResult]::new('tree', 'tree', [CompletionResultType]::ParameterValue, 'Show a tree of dependencies for a specific global environment')
            break
        }
        'pixi;help;global;add' {
            break
        }
        'pixi;help;global;edit' {
            break
        }
        'pixi;help;global;install' {
            break
        }
        'pixi;help;global;uninstall' {
            break
        }
        'pixi;help;global;remove' {
            break
        }
        'pixi;help;global;list' {
            break
        }
        'pixi;help;global;sync' {
            break
        }
        'pixi;help;global;expose' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add exposed binaries from an environment to your global environment')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove exposed binaries from the global environment')
            break
        }
        'pixi;help;global;expose;add' {
            break
        }
        'pixi;help;global;expose;remove' {
            break
        }
        'pixi;help;global;shortcut' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a shortcut from an environment to your machine.')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove shortcuts from your machine')
            break
        }
        'pixi;help;global;shortcut;add' {
            break
        }
        'pixi;help;global;shortcut;remove' {
            break
        }
        'pixi;help;global;update' {
            break
        }
        'pixi;help;global;upgrade' {
            break
        }
        'pixi;help;global;upgrade-all' {
            break
        }
        'pixi;help;global;tree' {
            break
        }
        'pixi;help;info' {
            break
        }
        'pixi;help;init' {
            break
        }
        'pixi;help;import' {
            break
        }
        'pixi;help;install' {
            break
        }
        'pixi;help;list' {
            break
        }
        'pixi;help;lock' {
            break
        }
        'pixi;help;reinstall' {
            break
        }
        'pixi;help;remove' {
            break
        }
        'pixi;help;run' {
            break
        }
        'pixi;help;search' {
            break
        }
        'pixi;help;self-update' {
            break
        }
        'pixi;help;shell' {
            break
        }
        'pixi;help;shell-hook' {
            break
        }
        'pixi;help;task' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Add a command to the workspace')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove a command from the workspace')
            [CompletionResult]::new('alias', 'alias', [CompletionResultType]::ParameterValue, 'Alias another specific command')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List all tasks in the workspace')
            break
        }
        'pixi;help;task;add' {
            break
        }
        'pixi;help;task;remove' {
            break
        }
        'pixi;help;task;alias' {
            break
        }
        'pixi;help;task;list' {
            break
        }
        'pixi;help;tree' {
            break
        }
        'pixi;help;update' {
            break
        }
        'pixi;help;upgrade' {
            break
        }
        'pixi;help;upload' {
            break
        }
        'pixi;help;workspace' {
            [CompletionResult]::new('channel', 'channel', [CompletionResultType]::ParameterValue, 'Commands to manage workspace channels')
            [CompletionResult]::new('description', 'description', [CompletionResultType]::ParameterValue, 'Commands to manage workspace description')
            [CompletionResult]::new('platform', 'platform', [CompletionResultType]::ParameterValue, 'Commands to manage workspace platforms')
            [CompletionResult]::new('version', 'version', [CompletionResultType]::ParameterValue, 'Commands to manage workspace version')
            [CompletionResult]::new('environment', 'environment', [CompletionResultType]::ParameterValue, 'Commands to manage workspace environments')
            [CompletionResult]::new('export', 'export', [CompletionResultType]::ParameterValue, 'Commands to export workspaces to other formats')
            [CompletionResult]::new('name', 'name', [CompletionResultType]::ParameterValue, 'Commands to manage workspace name')
            [CompletionResult]::new('system-requirements', 'system-requirements', [CompletionResultType]::ParameterValue, 'Commands to manage workspace system requirements')
            [CompletionResult]::new('requires-pixi', 'requires-pixi', [CompletionResultType]::ParameterValue, 'Commands to manage the pixi minimum version requirement')
            break
        }
        'pixi;help;workspace;channel' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds a channel to the manifest and updates the lockfile')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the channels in the manifest')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove channel(s) from the manifest and updates the lockfile')
            break
        }
        'pixi;help;workspace;channel;add' {
            break
        }
        'pixi;help;workspace;channel;list' {
            break
        }
        'pixi;help;workspace;channel;remove' {
            break
        }
        'pixi;help;workspace;description' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace description')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace description')
            break
        }
        'pixi;help;workspace;description;get' {
            break
        }
        'pixi;help;workspace;description;set' {
            break
        }
        'pixi;help;workspace;platform' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds a platform(s) to the workspace file and updates the lockfile')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the platforms in the workspace file')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove platform(s) from the workspace file and updates the lockfile')
            break
        }
        'pixi;help;workspace;platform;add' {
            break
        }
        'pixi;help;workspace;platform;list' {
            break
        }
        'pixi;help;workspace;platform;remove' {
            break
        }
        'pixi;help;workspace;version' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace version')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace version')
            [CompletionResult]::new('major', 'major', [CompletionResultType]::ParameterValue, 'Bump the workspace version to MAJOR')
            [CompletionResult]::new('minor', 'minor', [CompletionResultType]::ParameterValue, 'Bump the workspace version to MINOR')
            [CompletionResult]::new('patch', 'patch', [CompletionResultType]::ParameterValue, 'Bump the workspace version to PATCH')
            break
        }
        'pixi;help;workspace;version;get' {
            break
        }
        'pixi;help;workspace;version;set' {
            break
        }
        'pixi;help;workspace;version;major' {
            break
        }
        'pixi;help;workspace;version;minor' {
            break
        }
        'pixi;help;workspace;version;patch' {
            break
        }
        'pixi;help;workspace;environment' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds an environment to the manifest file')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the environments in the manifest file')
            [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterValue, 'Remove an environment from the manifest file')
            break
        }
        'pixi;help;workspace;environment;add' {
            break
        }
        'pixi;help;workspace;environment;list' {
            break
        }
        'pixi;help;workspace;environment;remove' {
            break
        }
        'pixi;help;workspace;export' {
            [CompletionResult]::new('conda-explicit-spec', 'conda-explicit-spec', [CompletionResultType]::ParameterValue, 'Export workspace environment to a conda explicit specification file')
            [CompletionResult]::new('conda-environment', 'conda-environment', [CompletionResultType]::ParameterValue, 'Export workspace environment to a conda environment.yaml file')
            break
        }
        'pixi;help;workspace;export;conda-explicit-spec' {
            break
        }
        'pixi;help;workspace;export;conda-environment' {
            break
        }
        'pixi;help;workspace;name' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the workspace name')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the workspace name')
            break
        }
        'pixi;help;workspace;name;get' {
            break
        }
        'pixi;help;workspace;name;set' {
            break
        }
        'pixi;help;workspace;system-requirements' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'Adds an environment to the manifest file')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'List the environments in the manifest file')
            break
        }
        'pixi;help;workspace;system-requirements;add' {
            break
        }
        'pixi;help;workspace;system-requirements;list' {
            break
        }
        'pixi;help;workspace;requires-pixi' {
            [CompletionResult]::new('get', 'get', [CompletionResultType]::ParameterValue, 'Get the pixi minimum version requirement')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set the pixi minimum version requirement')
            [CompletionResult]::new('unset', 'unset', [CompletionResultType]::ParameterValue, 'Remove the pixi minimum version requirement')
            [CompletionResult]::new('verify', 'verify', [CompletionResultType]::ParameterValue, 'Verify the pixi minimum version requirement')
            break
        }
        'pixi;help;workspace;requires-pixi;get' {
            break
        }
        'pixi;help;workspace;requires-pixi;set' {
            break
        }
        'pixi;help;workspace;requires-pixi;unset' {
            break
        }
        'pixi;help;workspace;requires-pixi;verify' {
            break
        }
        'pixi;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
