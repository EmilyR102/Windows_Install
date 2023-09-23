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
  Write-Host "There's an error with running Bitdefender scan: $_"
}

Remove-Item -Path $MyInvocation.MyCommand.Path -Force #self-delete file