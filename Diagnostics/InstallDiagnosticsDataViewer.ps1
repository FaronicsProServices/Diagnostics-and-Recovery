# Check if NuGet package provider is installed, and if not, install it before installing the Microsoft Diagnostics Data Viewer module
try { 
    if(Get-PackageProvider | Where-Object {$_.Name -eq "Nuget"}) { 
        "Nuget Module already exists" 
    } 
    else { 
        "Installing nuget module" 
        Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force 
    } 
    Install-Module Microsoft.DiagnosticDataViewer -Force  
} 
catch { 
    Write-Output $_.Exception.Message 
}
