$ErrorActionPreference = 'Stop'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
#. $toolsPath\helpers.ps1

$pp = Get-PackageParameters

#if ($pp.KeepExtensions) {
#  return
#}

Write-Host "Uninstalling %packagename%"
#Start-ChocolateyProcessAsAdmin -ExeToRun $vboxManage -Statements 'extpack', 'cleanup' 2>&1
