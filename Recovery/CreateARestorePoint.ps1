# Define the restore point description
$description = "Restore Point created on $(Get-Date)"

# Enable System Restore
Enable-ComputerRestore -Drive "C:\"

# Create a restore point on the local computer
Checkpoint-Computer -Description $description -RestorePointType MODIFY_SETTINGS

# Verify if the restore point was created successfully
$restorePoints = Get-ComputerRestorePoint

# Find the latest restore point
$latestRestorePoint = $restorePoints | Sort-Object -Property CreationTime -Descending | Select-Object -First 1

# Display the details of the latest restore point
if ($latestRestorePoint.Description -eq $description) {
    Write-Output "Restore Point created successfully."
    Write-Output "Description: $($latestRestorePoint.Description)"
    Write-Output "Creation Time: $($latestRestorePoint.CreationTime)"
    Write-Output "Event Type: $($latestRestorePoint.EventType)"
} else {
    Write-Output "Failed to create a restore point."
}
