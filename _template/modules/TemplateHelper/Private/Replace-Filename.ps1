function Replace-Filename {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$origFilePath,
        [Parameter(Mandatory=$true, Position=1)]
        [string]$searchStr,
        [Parameter(Mandatory=$true, Position=2)]
        [string]$replaceStr
    )

    $origFile = Split-Path $origFilePath -Leaf
    $origPath = $origFilePath.Replace($origFile, "")
    $newFile = $origFile.Replace($searchStr, $replaceStr)
    $newFilePath = Join-Path $origPath $newFile

    Copy-Item $origFilePath $newFilePath
}