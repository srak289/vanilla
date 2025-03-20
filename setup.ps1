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
    # Modified from
    # https://gist.githubusercontent.com/rapgru/561df5b95fb0a78f5934efefb19ea236/raw/f9917c519ec70c00894887796e3d723f97231c57/install-git-cmd-only.ps1
    if(!(Get-Command git -ErrorAction SilentlyContinue)) {
        $gitDir = "$env:LOCALAPPDATA\CustomGit"
        if(Test-Path $gitDir) { Remove-Item -Path $gitDir -Recurse -Force }
        New-Item -Path $gitDir -ItemType Directory
        $gitLatestReleaseApi = (Invoke-WebRequest -UseBasicParsing https://api.github.com/repos/git-for-windows/git/releases/latest).Content | ConvertFrom-Json
        $mingitObject = $gitLatestReleaseApi.assets `
            | Where-Object {$_.name -match "MinGit-[\d.]*?-64-bit.zip"} `
            | Select-Object browser_download_url
  
        Write-Host "Matching asset count: $((Measure-Object -InputObject $mingitObject).Count)"
  
        if ((Measure-Object -InputObject $mingitObject).Count -eq 1) {
            $mingitObject `
                | ForEach-Object { Invoke-WebRequest -Uri $_.browser_download_url -UseBasicParsing -OutFile "$gitDir\mingit.zip" }
  
            Write-Host "Installing latest release fetched from github api!"
        } else {
            Write-Host "There were more than one mingit assets found in the latest release!"
            Write-Host "Installing release 2.26.2 instead!"
  
            Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/latest/download/MinGit-2.26.2-64-bit.zip" -UseBasicParsing -OutFile "$gitDir\mingit.zip"
        }
  
        Expand-Archive -Path "$gitDir\mingit.zip" -DestinationPath "$gitDir"
        #Copy-Item -Path "$gitDir\mingit\cmd\git.exe" -Destination "$gitDir\git.exe" -Recurse
        Remove-Item -Path "$gitDir\mingit.zip" -Recurse -Force
  
        if(([Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)) -notlike "*$gitDir*") {
            Write-Host "Updating PATH"
            [Environment]::SetEnvironmentVariable("Path", [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User) + ";$gitDir\cmd", [System.EnvironmentVariableTarget]::User)
        }
    }
    # Invoke-WebRequest `
    # -Uri https://github.com/git-for-windows/git/releases/download/v2.49.0.windows.1/MinGit-2.49.0-busybox-64-bit.zip ` 
    # -OutFile mingit.zip
    # msiexec /i git.exe /quiet
}

function install_chocolatey {
    if (!Test-Path env:ChocolateyInstall) {
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072  
        iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    }
}

function install_ps7 {
    & "winget install --id Microsoft.Powershell --source winget"
}

# ops
# 1. Run single cmdline close to the choco install
# 2. Install git
# 3. Clone vanilla
# 4. Setup vanilla
# This could be a second script or could be a piece of this initial script

function main {
    switch ($args) {
    case bootstrap {
        install_git
        clone_vanilla
    }
    case setup {
        setup
        hide_dirs
        install_choco
    }
    default {
        Write-Output "Please specify 'bootstrap' or 'setup'"
    }
    }
}
main
