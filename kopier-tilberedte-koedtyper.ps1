# Kopierer tilberedte-koedtyper fra projektrod til koed/tilberedte-koedtyper/
# Kør fra DSA Gastronom-mappen: .\koed\kopier-tilberedte-koedtyper.ps1

$projectRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$sourceRoot = Join-Path $projectRoot "tilberedte-koedtyper"
$targetDir = Join-Path $projectRoot "koed\tilberedte-koedtyper"

if (-not (Test-Path $sourceRoot)) {
    Write-Host "Kilde-mappen findes ikke: $sourceRoot"
    Write-Host "Har du filerne et andet sted? Angiv stien og kør scriptet igen."
    exit 1
}

if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

$count = 0
Get-ChildItem -Path $sourceRoot -File -Include *.jpg,*.png,*.mp3 | ForEach-Object {
    Copy-Item $_.FullName -Destination $targetDir -Force
    Write-Host "Kopieret: $($_.Name)"
    $count++
}

Write-Host "`nFærdig. $count filer kopieret til koed\tilberedte-koedtyper\"
Write-Host "Push nu til KoedDSAGas for at få billeder og lyd på GitHub Pages."
