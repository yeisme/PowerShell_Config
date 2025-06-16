using namespace System.Management.Automation

Register-ArgumentCompleter -CommandName cmake -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    if ($commandName.StartsWith('-')) {
        $completions = @(
            [CompletionResult]::new('-S ', '-S ', [CompletionResultType]::ParameterName, 'Explicitly specify a source directory.'),
            [CompletionResult]::new('-B ', '-B ', [CompletionResultType]::ParameterName, 'Explicitly specify a build directory.'),
            [CompletionResult]::new('-C ', '-C ', [CompletionResultType]::ParameterName, 'Pre-load a script to populate the cache.'),
            [CompletionResult]::new('-D ', '-D ', [CompletionResultType]::ParameterName, 'Remove matching entries from CMake cache.'),
            [CompletionResult]::new('-U ', '-U ', [CompletionResultType]::ParameterName, 'Remove matching entries from CMake cache.'),
            [CompletionResult]::new('-G ', '-G ', [CompletionResultType]::ParameterName, 'Specify a build system generator.'),
            [CompletionResult]::new('-T ', '-T ', [CompletionResultType]::ParameterName, 'Specify toolset name if supported by generator.'),
            [CompletionResult]::new('-A ', '-A ', [CompletionResultType]::ParameterName, 'Specify platform name if supported by generator.'),
            [CompletionResult]::new('--toolchain ', '--toolchain ', [CompletionResultType]::ParameterName, 'Specify toolchain file [CMAKE_TOOLCHAIN_FILE].'),
            [CompletionResult]::new('--install-prefix ', '--install-prefix ', [CompletionResultType]::ParameterName, 'Specify install directory [CMAKE_INSTALL_PREFIX].'),
            [CompletionResult]::new('-Wdev ', '-Wdev ', [CompletionResultType]::ParameterName, 'Enable developer warnings.'),
            [CompletionResult]::new('-Wno-dev ', '-Wno-dev ', [CompletionResultType]::ParameterName, 'Suppress developer warnings.'),
            [CompletionResult]::new('-Werror=dev ', '-Werror=dev ', [CompletionResultType]::ParameterName, 'Make developer warnings errors.'),
            [CompletionResult]::new('-Wno-error=dev ', '-Wno-error=dev ', [CompletionResultType]::ParameterName, 'Make developer warnings not errors.'),
            [CompletionResult]::new('-Wdeprecated ', '-Wdeprecated ', [CompletionResultType]::ParameterName, 'Enable deprecation warnings.'),
            [CompletionResult]::new('-Wno-deprecated ', '-Wno-deprecated ', [CompletionResultType]::ParameterName, 'Suppress deprecation warnings.'),
            [CompletionResult]::new('-Werror=deprecated ', '-Werror=deprecated ', [CompletionResultType]::ParameterName, 'Make deprecated macro and function warnings errors.'),
            [CompletionResult]::new('-Wno-error=deprecated ', '-Wno-error=deprecated ', [CompletionResultType]::ParameterName, 'Make deprecated macro and function warnings not errors.'),
            [CompletionResult]::new('--preset ', '--preset ', [CompletionResultType]::ParameterName, 'Specify a configure preset.'),
            [CompletionResult]::new('--list-presets ', '--list-presets ', [CompletionResultType]::ParameterName, 'List available presets.'),
            [CompletionResult]::new('--workflow ', '--workflow ', [CompletionResultType]::ParameterName, 'Run a workflow preset.'),
            [CompletionResult]::new('-E ', '-E ', [CompletionResultType]::ParameterName, 'CMake command mode. Run "cmake -E" for a summary of commands.'),
            [CompletionResult]::new('-L ', '-L ', [CompletionResultType]::ParameterName, 'List non-advanced cached variables.'),
            [CompletionResult]::new('-LR ', '-LR ', [CompletionResultType]::ParameterName, 'Show cached variables that match the regex.'),
            [CompletionResult]::new('--fresh ', '--fresh ', [CompletionResultType]::ParameterName, 'Configure a fresh build tree, removing any existing cache file.'),
            [CompletionResult]::new('--build ', '--build ', [CompletionResultType]::ParameterName, 'Build a CMake-generated project binary tree. Run "cmake --build" to see compatible options and a quick help.'),
            [CompletionResult]::new('--install ', '--install ', [CompletionResultType]::ParameterName, 'Install a CMake-generated project binary tree. Run "cmake --install" to see compatible options and a quick help.'),
            [CompletionResult]::new('--open ', '--open ', [CompletionResultType]::ParameterName, 'Open generated project in the associated application.'),
            [CompletionResult]::new('-N ', '-N ', [CompletionResultType]::ParameterName, 'View mode only.'),
            [CompletionResult]::new('-P ', '-P ', [CompletionResultType]::ParameterName, 'Process script mode.'),
            [CompletionResult]::new('--find-package ', '--find-package ', [CompletionResultType]::ParameterName, 'Legacy pkg-config like mode. Do not use.'),
            [CompletionResult]::new('--graphviz=', '--graphviz=', [CompletionResultType]::ParameterName, 'Generate graphviz of dependencies, see CMakeGraphVizOptions.cmake for more.'),
            [CompletionResult]::new('--system-information ', '--system-information ', [CompletionResultType]::ParameterName, 'Dump information about this system.'),
            [CompletionResult]::new('--print-config-dir ', '--print-config-dir ', [CompletionResultType]::ParameterName, 'Print CMake config directory for user-wide FileAPI queries.'),
            [CompletionResult]::new('--log-level=', '--log-level=', [CompletionResultType]::ParameterName, 'Set the verbosity of messages from CMake files. --loglevel is also accepted for backward compatibility reasons.'),
            [CompletionResult]::new('--log-context ', '--log-context ', [CompletionResultType]::ParameterName, 'Prepend log messages with context, if given.'),
            [CompletionResult]::new('--debug-trycompile ', '--debug-trycompile ', [CompletionResultType]::ParameterName, 'Do not delete the try_compile build tree. Only useful on one try_compile at a time.'),
            [CompletionResult]::new('--debug-output ', '--debug-output ', [CompletionResultType]::ParameterName, 'Put cmake in a debug mode.'),
            [CompletionResult]::new('--debug-find ', '--debug-find ', [CompletionResultType]::ParameterName, 'Put cmake find in a debug mode.'),
            [CompletionResult]::new('--debug-find-pkg=', '--debug-find-pkg=', [CompletionResultType]::ParameterName, 'Limit cmake debug-find to the comma-separated list of packages'),
            [CompletionResult]::new('--debug-find-var=', '--debug-find-var=', [CompletionResultType]::ParameterName, 'Limit cmake debug-find to the comma-separated list of result variables'),
            [CompletionResult]::new('--trace ', '--trace ', [CompletionResultType]::ParameterName, 'Put cmake in trace mode.'),
            [CompletionResult]::new('--trace-expand ', '--trace-expand ', [CompletionResultType]::ParameterName, 'Put cmake in trace mode with variable expansion.'),
            [CompletionResult]::new('--trace-format=', '--trace-format=', [CompletionResultType]::ParameterName, 'Set the output format of the trace.'),
            [CompletionResult]::new('--trace-source=', '--trace-source=', [CompletionResultType]::ParameterName, 'Trace only this CMake file/module. Multiple options allowed.'),
            [CompletionResult]::new('--trace-redirect=', '--trace-redirect=', [CompletionResultType]::ParameterName, 'Redirect trace output to a file instead of stderr.'),
            [CompletionResult]::new('--warn-uninitialized ', '--warn-uninitialized ', [CompletionResultType]::ParameterName, 'Warn about uninitialized values.'),
            [CompletionResult]::new('--no-warn-unused-cli ', '--no-warn-unused-cli ', [CompletionResultType]::ParameterName, "Do not warn about command line options."),
            [CompletionResult]::new('--check-system-vars ', '--check-system-vars ', [CompletionResultType]::ParameterName, 'Find problems with variable usage in system files.'),
            [CompletionResult]::new('--compile-no-warning-as-error ', '--compile-no-warning-as-error ', [CompletionResultType]::ParameterName, 'Ignore COMPILE_WARNING_AS_ERROR property and CMAKE_COMPILE_WARNING_AS_ERROR variable.'),
            [CompletionResult]::new('--profiling-format=', '--profiling-format=', [CompletionResultType]::ParameterName, 'Output data for profiling CMake scripts. Supported formats: google-trace'),
            [CompletionResult]::new('--profiling-output=', '--profiling-output=', [CompletionResultType]::ParameterName, 'Select an output path for the profiling data enabled through --profiling-format.')
        )

        return $completions.Where{ $_.CompletionText.StartsWith($commandName) }
    }
}
