# elevated self-deployment: 
### Check if the script is running with administrator privileges
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    # If not running as administrator, relaunch the script with elevated privileges
    Start-Process powershell.exe -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

# Set-ExecutionPolicy RemoteSigned

try {
  #run bit defender virus scan
  $consolePath = 'C:\Program Files\Bitdefender\Endpoint Security\product.console.exe'

  Start-Process -FilePath $consolePath -NoNewWindow -Wait

  #### create and send scan command to product console
  $scanCommand = "FileScan.onDemand.RunScanTask custom"

  Add-Type -AssemblyName System.Windows.Forms
  Start-Sleep -Seconds 1 # Wait for console to fully open
  [System.Windows.Forms.SendKeys]::SendWait($scanCommand)
  [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
}
catch {
  Write-Host "There's an error with installing Dell patches or running Bitdefender: $_"
}

# Remove the scheduled task if it was created
Unregister-ScheduledTask -TaskName "RunScriptElevated" -Confirm:$false

Remove-Item -Path $MyInvocation.MyCommand.Path -Force #self-delete file