# Restores to the most recent restore point created
# Get the most recent restore point
$restorePoints = Get-ComputerRestorePoint
$latestRestorePoint = $restorePoints | Sort-Object -Property CreationTime -Descending | Select-Object -First 1

if ($latestRestorePoint -ne $null) {
    Write-Output "Restoring to the latest restore point: $($latestRestorePoint.Description) created on $($latestRestorePoint.CreationTime)"
    Restore-Computer -RestorePoint $latestRestorePoint.SequenceNumber -Confirm:$false
    Write-Output "The system will restart to apply the restore point."
} else {
    Write-Output "No restore points found."
}
