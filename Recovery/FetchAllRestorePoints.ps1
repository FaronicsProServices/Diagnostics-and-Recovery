# Fetch all restore points on the local computer
$restorePoints = Get-ComputerRestorePoint

# Check if there are any restore points
if ($restorePoints.Count -eq 0) {
    Write-Output "No restore points found."
} else {
    Write-Output "Restore Points:"
    foreach ($restorePoint in $restorePoints) {
        $creationTime = [DateTime]::ParseExact($restorePoint.CreationTime, "yyyyMMddHHmmss.ffffff-000", $null)
        Write-Output "Description: $($restorePoint.Description)"
        Write-Output "Creation Time: $creationTime"
        Write-Output "Event Type: $($restorePoint.EventType)"
        Write-Output "Sequence Number: $($restorePoint.SequenceNumber)"
        Write-Output "-------------------------"
    }
}
