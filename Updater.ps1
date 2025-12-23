# ==========================
# Configuration
# ==========================

# Network folder where the update files are located
$networkPath = "Q:\GI_ATUALIZACAO"

# Local destination folder (already exists on all machines)
$destinationPath = "C:\Program Files (x86)\GI2000"

# File name pattern to search for
$filePattern = "GI_SQL_*"

# ==========================
# Execution
# ==========================

try {
    # Get the most recently modified file that matches the pattern
    $latestFile = Get-ChildItem -Path $networkPath -Filter $filePattern -File |
                  Sort-Object LastWriteTime -Descending |
                  Select-Object -First 1

    if ($null -eq $latestFile) {
        Write-Host "No file matching the pattern was found in the network folder." -ForegroundColor Yellow
        Read-Host "Press ENTER to close"
        exit 1
    }

    # Full path of the copied file in the local directory
    $copiedFilePath = Join-Path $destinationPath $latestFile.Name

    Write-Host "Latest file found:" -ForegroundColor Cyan
    Write-Host $latestFile.Name
    Write-Host "Copying file to local directory..."

    # Copy file to local directory (overwrite if exists)
    Copy-Item -Path $latestFile.FullName -Destination $copiedFilePath -Force -ErrorAction Stop

    Write-Host "Extracting files (existing files will be replaced)..."

    # Extract ZIP and overwrite existing files automatically
    Expand-Archive -Path $copiedFilePath -DestinationPath $destinationPath -Force -ErrorAction Stop

    Write-Host ""
    Write-Host "GI update completed successfully." -ForegroundColor Green
}
catch [System.UnauthorizedAccessException] {
    Write-Host ""
    Write-Host "PERMISSION ERROR" -ForegroundColor Red
    Write-Host "You do not have permission to write to:" -ForegroundColor Red
    Write-Host $destinationPath
    Write-Host ""
    Write-Host "Please run this script as Administrator." -ForegroundColor Yellow
}
catch {
    Write-Host ""
    Write-Host "UNEXPECTED ERROR" -ForegroundColor Red
    Write-Host $_.Exception.Message
}
finally {
    Write-Host ""
    Read-Host "Press ENTER to close"
}
