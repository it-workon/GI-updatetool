# Network folder where the update files are located
$networkPath = "Q:\GI_ATUALIZACAO"

# Local destination folder (already exists on all machines)
$destinationPath = "C:\Program Files (x86)\GI2000"

# File name pattern to search for
$filePattern = "GI_SQL_*"

# Get the most recently modified file that matches the pattern
$latestFile = Get-ChildItem -Path $networkPath -Filter $filePattern -File |
              Sort-Object LastWriteTime -Descending |
              Select-Object -First 1

# Check if a file was found
if ($null -eq $latestFile) {
    Write-Host "No file matching the pattern was found." -ForegroundColor Red
    exit 1
}

# Full path of the copied file in the local directory
$copiedFilePath = Join-Path $destinationPath $latestFile.Name

# Copy the latest file to the local directory
Copy-Item -Path $latestFile.FullName -Destination $copiedFilePath -Force

# Extract the file (assuming it is a ZIP file)
Expand-Archive -Path $copiedFilePath -DestinationPath $destinationPath -Force

Write-Host "Atualização no GI realizada com sucesso! Arquivo: " -ForegroundColor Green
Write-Host $latestFile.Name
