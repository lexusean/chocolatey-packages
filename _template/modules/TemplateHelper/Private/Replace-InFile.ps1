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