$scriptRoot = $PSScriptRoot
Import-Module -DisableNameChecking -Force $(Join-Path $scriptRoot "_template\modules\TemplateHelper") > $null 

Function Get-Folder($initialDirectory)

{
    Add-Type -AssemblyName System.Windows.Forms

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select Install Folder"
    $foldername.RootFolder = "MyComputer"
    $foldername.SelectedPath = $scriptRoot

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }

    return [string]$folder
}

$installpath = $(Get-Folder)
if([string]::IsNullOrWhiteSpace($installpath) -eq 1) {
    Write-Host "Missing Install Path"
    return 1
}
Write-Host $installpath

if([System.IO.Directory]::Exists($installpath) -eq 0) {
    Write-Host "Install Path Does not Exist"
    return 1
}

$packagename = Read-Host -Prompt "Package Name"
if([string]::IsNullOrWhiteSpace($packagename) -eq 1) {
    Write-Host "Package Name is required"
    return 1
}

$author = Read-Host -Prompt "Author"
if([string]::IsNullOrWhiteSpace($author) -eq 1) {
    Write-Host "Author is required"
    return 1
}

Create-ChocoPackage $packagename $author $installpath

return 0