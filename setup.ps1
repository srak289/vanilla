$ProgressPreference = "SilentlyContinue"
$ErrorActionPreference = "Inquire"

Set-StrictMode -Version Latest
# Set-PSDebug -Strict

$vanilla_setup = $PSCommandPath
$vanilla_checkout = $PSScriptRoot
$vanilla_path = "$env:HOME/.vanilla"
$vanilla_module_path = "$vanilla_checkout/powershell/vanilla.psm1"
$vanilla_profile = "$vanilla_path/powershell/profile.ps1"

$profile_dir = [System.IO.Path]::GetDirectoryName($PROFILE)

$local = "$env:HOME/.local"
$ssh = "$env:HOME/.ssh"

$gitcmd = "$local/bin/git.exe"


function setup {
        if (!Test-Path $vanilla_path) {
                Write-Output "Moving vanilla to .vanilla"
                Move-Item $vanilla_checkout $vanilla_path
        }
        if (!Test-Path "$local") {
                Write-Output "Creating $local"
                New-Item -Type Directory -Path "$local"
        }
        if (!Test-Path "$local/bin") {
                Write-Output "Creating $local/bin"
                New-Item -Type Directory -Path "$local/bin"
        }
        if (!Test-Path $ssh) {
                Write-Output "Creating $ssh"
                New-Item -Type Directory -Path "$local/bin"
        }
        if (!Test-Path $profile_dir) {
                Write-Output "Creating $profile_dir"
                New-Item -Type Directory -Path $profile_dir
        }
        if ((Get-Item $PROFILE).linktarget -eq $null) {
                Write-Output "Removing $PROFILE"
                Remove-Item $PROFILE
                if (!Test-Path) {
                        Write-Output "Linking $PROFILE to $vanilla_profile"
                        New-Item -Type SymbolicLink -Name $PROFILE -Value $vanilla_profile
                }
        }
}


function hide_directories {
        Set-ItemProperty -Path $env:HOME/.local -Name Attributes -Value Hidden
        Set-ItemProperty -Path $env:HOME/.vanilla -Name Attributes -Value Hidden
        Set-ItemProperty -Path $env:HOME/.ssh -Name Attributes -Value Hidden
}
function install_git {
        if (!Test-Path $gitcmd) {
                Invoke-WebRequest `
                -Uri https://github.com/git-for-windows/git/releases/download/v2.49.0.windows.1/MinGit-2.49.0-busybox-64-bit.zip ` 
                -OutFile mingit.zip
                Expand-Archive mingit.zip
        }
}

function install_chocolatey {
        if (!Test-Path env:ChocolateyInstall) {
                Set-ExecutionPolicy Bypass -Scope Process -Force
                [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072  
                iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        }
}

setup
hide_directories
# full clone depends on git install
# perhaps we have a switch for something in the middle to determine if we've checked out
install_git
install_chocolatey

