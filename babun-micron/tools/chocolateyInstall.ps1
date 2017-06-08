function Replace-InFile {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$file,
        [Parameter(Mandatory=$true, Position=1)]
        [string]$searchStr,
        [Parameter(Mandatory=$true, Position=2)]
        [string]$replaceStr
    )

    (Get-Content $file).Replace($searchStr, $replaceStr) | Set-Content $file
}

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

Update-SessionEnvironment

$username = Get-EnvironmentVariable -Name "USERNAME" -Scope User
$userProfile = Get-EnvironmentVariable -Name "USERPROFILE" -Scope User
$zshrc = Join-Path $toolsPath "files\template.zshrc"
$babunProfile = Join-Path $userProfile ".babun\cygwin\home\$username"
$targetzshrc = Join-Path $babunProfile ".zshrc"

if ($(Test-Path $targetzshrc) -eq $false) {
	Write-Host "babun home .zshrc not found. Exiting"
	exit 1
}

Copy-Item -Force $zshrc $targetzshrc
Replace-InFile $targetzshrc "%BABUN_THEME%" "babun"
Replace-InFile $targetzshrc "%HTTP_PROXY%" "ht"
Replace-InFile $targetzshrc "%HTTPS_PROXY%" "ht"
Replace-InFile $targetzshrc "%NO_PROXY%" "localhost"

Write-Host "$packageName installed"
