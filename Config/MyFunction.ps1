# MyFunction.ps1

### Github Copilot alias
function ghcs {
    # Debug support provided by common PowerShell function parameters, which is natively aliased as -d or -db
    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-7.4#-debug
    param(
        [Parameter()]
        [string]$Hostname,

        [ValidateSet('gh', 'git', 'shell')]
        [Alias('t')]
        [String]$Target = 'shell',

        [Parameter(Position = 0, ValueFromRemainingArguments)]
        [string]$Prompt
    )
    begin {
        # Create temporary file to store potential command user wants to execute when exiting
        $executeCommandFile = New-TemporaryFile

        # Store original value of GH_* environment variable
        $envGhDebug = $Env:GH_DEBUG
        $envGhHost = $Env:GH_HOST
    }
    process {
        if ($PSBoundParameters['Debug']) {
            $Env:GH_DEBUG = 'api'
        }

        $Env:GH_HOST = $Hostname

        gh copilot suggest -t $Target -s "$executeCommandFile" $Prompt
    }
    end {
        # Execute command contained within temporary file if it is not empty
        if ($executeCommandFile.Length -gt 0) {
            # Extract command to execute from temporary file
            $executeCommand = (Get-Content -Path $executeCommandFile -Raw).Trim()

            # Insert command into PowerShell up/down arrow key history
            [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($executeCommand)

            # Insert command into PowerShell history
            $now = Get-Date
            $executeCommandHistoryItem = [PSCustomObject]@{
                CommandLine        = $executeCommand
                ExecutionStatus    = [Management.Automation.Runspaces.PipelineState]::NotStarted
                StartExecutionTime = $now
                EndExecutionTime   = $now.AddSeconds(1)
            }
            Add-History -InputObject $executeCommandHistoryItem

            # Execute command
            Write-Host "`n"
            Invoke-Expression $executeCommand
        }
    }
    clean {
        # Clean up temporary file used to store potential command user wants to execute when exiting
        Remove-Item -Path $executeCommandFile

        # Restore GH_* environment variables to their original value
        $Env:GH_DEBUG = $envGhDebug
    }
}

function ghce {
    # Debug support provided by common PowerShell function parameters, which is natively aliased as -d or -db
    # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-7.4#-debug
    param(
        [Parameter()]
        [string]$Hostname,

        [Parameter(Position = 0, ValueFromRemainingArguments)]
        [string[]]$Prompt
    )
    begin {
        # Store original value of GH_* environment variables
        $envGhDebug = $Env:GH_DEBUG
        $envGhHost = $Env:GH_HOST
    }
    process {
        if ($PSBoundParameters['Debug']) {
            $Env:GH_DEBUG = 'api'
        }

        $Env:GH_HOST = $Hostname

        gh copilot explain $Prompt
    }
    clean {
        # Restore GH_* environment variables to their original value
        $Env:GH_DEBUG = $envGhDebug
        $Env:GH_HOST = $envGhHost
    }
}

function msvc {
    Import-Module "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
    Enter-VsDevShell e427f47a -SkipAutomaticLocation -DevCmdArguments "-arch=x64 -host_arch=x64"
}

function emv {
    # Check if Emscripten is installed
    if (-not (Get-Command emcc -ErrorAction SilentlyContinue)) {
        Write-Host "Emscripten is not installed. Please install it first."
        return
    }

    # Activate Emscripten environment
    & emsdk activate latest
    & emcc --version
}

function cda {
#region mamba initialize
# !! Contents within this block are managed by 'mamba shell init' !!
$Env:MAMBA_ROOT_PREFIX = "C:\Users\ye\miniforge3"
$Env:MAMBA_EXE = "C:\Users\ye\miniforge3\Library\bin\mamba.exe"
(& $Env:MAMBA_EXE 'shell' 'hook' -s 'powershell' -r $Env:MAMBA_ROOT_PREFIX) | Out-String | Invoke-Expression
#endregion

}

function QT-VS {
    $env:QT_DIR="$QT\msvc2022_64"
    $env:QT6_DIR="$QT\msvc2022_64"
    $env:PATH = "$env:QT_DIR\bin;$env:PATH"
}

# 移除 QT-VS 设置的环境变量
function QT-RVS {
    $env:PATH = $env:PATH -replace [regex]::Escape("$QT\msvc2022_64\bin;"), ""
    $env:QT_DIR = $null
    $env:QT6_DIR = $null
}

function QT-MinGW {
    $env:QT_DIR="$QT\mingw_64"
    $env:QT6_DIR="$QT\mingw_64"
    $env:PATH = "$env:QT_DIR\bin;C:\Qt\Tools\mingw1310_64\bin\;$env:PATH"
}

function QT-RMinGW {
    $env:PATH = $env:PATH -replace [regex]::Escape("$QT\mingw_64\bin;C:\Qt\Tools\mingw1310_64\bin;"), ""
    $env:QT_DIR = $null
    $env:QT6_DIR = $null
}

function QT-LLVM {
    $env:QT_DIR="$QT\mingw1706_64"
    $env:QT6_DIR="$QT\mingw1706_64"
    $env:PATH = "$env:QT_DIR\bin;C:\Qt\Tools\llvm-mingw1706_64\bin;$env:PATH"
}

function QT-RLLVM {
    $env:PATH = $env:PATH -replace [regex]::Escape("$QT\mingw1706_64\bin;C:\Qt\Tools\llvm-mingw1706_64\bin;"), ""
    $env:QT_DIR = $null
    $env:QT6_DIR = $null
}

function cudnn-129 {
    $env:PATH = "C:\Program Files\NVIDIA\CUDNN\v9.13\bin\12.9\;$env:PATH"
}

function rcuda-129 {
    $env:PATH = $env:PATH -replace [regex]::Escape("C:\Program Files\NVIDIA\CUDNN\v9.13\bin\12.9;"), ""
}

function cudnn-130 {
    $env:PATH = "C:\Program Files\NVIDIA\CUDNN\v10.0\bin\13.0\;$env:PATH"
}

function rcuda-130 {
    $env:PATH = $env:PATH -replace [regex]::Escape("C:\Program Files\NVIDIA\CUDNN\v10.0\bin\13.0;"), ""
}
