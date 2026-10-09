# FileAutomation.ps1
# Finds files older than 7 days and copies them to OldFiles.
 
$source = "SampleFiles"
$backup = "OldFiles"
$today  = Get-Date
$cutoff = (Get-Date).AddDays(-7)
 
Write-Host "Today: $today"
Write-Host "Cutoff date: $cutoff"
 
$oldFiles = Get-ChildItem -Path $source -File | Where-Object { $_.LastWriteTime -lt $cutoff }
 
foreach ($file in $oldFiles) {
    Write-Host "Found old file: $($file.Name)"
    Copy-Item -Path $file.FullName -Destination $backup -WhatIf
}
 
Write-Host "Old files found: $($oldFiles.Count)"
