# Restores to a custom restore Point specifed under Restore Point Sequence Number
# Define the sequence number of the restore point to restore to
$restorePointSequenceNumber = "Sequence Number of a Restore Point"

# Restore the computer to the specified restore point
Restore-Computer -RestorePoint $restorePointSequenceNumber -Confirm:$false

Write-Output "The system will restart to apply the restore point."
