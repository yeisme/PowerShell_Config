using namespace System.Management.Automation

Register-ArgumentCompleter -CommandName cpack -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    if ($commandName.StartsWith('-')) {
        $completions = @(
            [CompletionResult]::new('-G ', '-G ', [CompletionResultType]::ParameterName, 'Override/define CPACK_GENERATOR'),
            [CompletionResult]::new('-C ', '-C ', [CompletionResultType]::ParameterName, 'Specify the project configuration'),
            [CompletionResult]::new('-D ', '-D ', [CompletionResultType]::ParameterName, 'Set a CPack variable.'),
            [CompletionResult]::new('--config ', '--config ', [CompletionResultType]::ParameterName, 'Specify the config file.'),
            [CompletionResult]::new('-V', '-V', [CompletionResultType]::ParameterName, 'Enable verbose output'),
            [CompletionResult]::new('--trace', '--trace', [CompletionResultType]::ParameterName, 'Put underlying cmake scripts in trace mode.'),
            [CompletionResult]::new('--trace-expand', '--trace-expand', [CompletionResultType]::ParameterName, 'Put underlying cmake scripts in expanded trace mode.'),
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Enable debug output (for CPack developers)'),
            [CompletionResult]::new('-P ', '-P ', [CompletionResultType]::ParameterName, 'Override/define CPACK_PACKAGE_NAME'),
            [CompletionResult]::new('-R ', '-R ', [CompletionResultType]::ParameterName, 'Override/define CPACK_PACKAGE_VERSION'),
            [CompletionResult]::new('-B ', '-B ', [CompletionResultType]::ParameterName, 'Override/define CPACK_PACKAGE_DIRECTORY'),
            [CompletionResult]::new('--vendor ', '--vendor ', [CompletionResultType]::ParameterName, 'Override/define CPACK_PACKAGE_VENDOR'),
            [CompletionResult]::new('--preset ', '--preset ', [CompletionResultType]::ParameterName, 'Read arguments from a package preset'),
            [CompletionResult]::new('--list-presets ', '--list-presets ', [CompletionResultType]::ParameterName, 'List available package presets')
        )
        return $completions.Where{ $_.CompletionText.StartsWith($commandName) }
    }
}
