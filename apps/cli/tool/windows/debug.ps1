$CelestPackageName = "Celest.CLI"

function Remove-Celest {
    Get-AppxPackage -Name $CelestPackageName | Remove-AppxPackage
}

function Install-Local {
    Add-AppxPackage -Register .\celest\AppxManifest.xml
}