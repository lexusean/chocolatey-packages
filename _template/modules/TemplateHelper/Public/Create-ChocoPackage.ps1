function Create-ChocoPackage {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$packagename,
        [Parameter(Mandatory=$true, Position=1)]
        [string]$author,
        [Parameter(Position=2)]
        [string]$installpath = "$PSScriptRoot\..\..\..\..",
        [Parameter(Position=3)]
        [string]$packagedesc = "Default Description"
    )
    
    if([string]::IsNullOrWhiteSpace($packagename) -eq 1) {
        Write-Host "Missing packagename"
        return 1
    }

    if([string]::IsNullOrWhiteSpace($author) -eq 1) {
        Write-Host "Missing author"
        return 1
    }

    if([string]::IsNullOrWhiteSpace($installpath) -eq 1) {
        Write-Host "Missing installpath"
        return 1
    }
    
    $moduleRoot = "$PSScriptRoot\.."
    $filesRoot = Join-Path $moduleRoot "Files"
    $templatePackageDir = Join-Path $filesRoot "PackageTemplate"
    $packageDir = Join-Path $installpath $packagename

    Copy-Item -Force -Recurse -Container "$templatePackageDir" "$packageDir"

    Get-ChildItem -Path $packageDir -File -Recurse | ForEach-Object {
        $newName = $_.Name -replace "template", $packagename
        $dest = Join-Path -Path $_.Directory.FullName -ChildPath $newName
        Move-Item -Path $_.FullName -Destination $dest -Force
    } 

    Get-ChildItem -Path $packageDir -File -Recurse | ForEach-Object -Process {Replace-InFile $_.FullName "%packagename%" $packagename}
    Get-ChildItem -Path $packageDir -File -Recurse | ForEach-Object -Process {Replace-InFile $_.FullName "%author%" $author}
    Get-ChildItem -Path $packageDir -File -Recurse | ForEach-Object -Process {Replace-InFile $_.FullName "%packagedesc%" $packagedesc}

    return 0
}