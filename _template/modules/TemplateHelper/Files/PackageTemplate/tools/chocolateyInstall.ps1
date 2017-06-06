$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
#. $toolsPath\helpers.ps1

$pp = Get-PackageParameters
#$silentArgs = @('-s -l -msiparams REBOOT=ReallySuppress')
#$silentArgs += if (!$pp.CurrentUser)      { 'ALLUSERS=1' } else { 'ALLUSERS=2';  Write-Host 'Param: Installing for current user' }

$packageArgs = @{
  packageName            = '%packagename%'
  fileType               = 'EXE'
  url                    = 'http://www.google.com'
  url64bit               = 'http://www.google.com'
  checksum               = 'e36883bb27653aabe20ca0cbf140b2aa19573fc989c47e3cce7986dc544b0e93'
  checksum64             = 'e36883bb27653aabe20ca0cbf140b2aa19573fc989c47e3cce7986dc544b0e93'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = $silentArgs
  validExitCodes         = @(0)
  softwareName           = 'Software Nanme'
}
Install-ChocolateyPackage @packageArgs

$packageName = $packageArgs.packageName
#if (!$pp.NoPath) { Write-Host "Adding to PATH if needed"; Install-ChocolateyPath $installLocation }

Write-Host "$packageName installed"
#Register-Application "$installLocation\$packageName.exe" vbox
#Write-Host "$packageName registered as vbox"
