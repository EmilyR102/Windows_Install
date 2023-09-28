Set-ExecutionPolicy RemoteSigned #allows local scripts to run

try {
  #install dell patches
  $filePath = 'C:\Users\TUCCAdmin\Downloads\Dell Lattitude E7450 Patches'
  $fileList = GET-ChildItem -Path $filePath

  foreach ($file in $fileList) {
    Start-Process -FilePath $file.FullName -NoNewWindow -Wait
  }

  #run bit defender virus scan
  $consolePath = 'C:\Program Files\Bitdefender\Endpoint Security\product.console.exe'

  Start-Process -FilePath $consolePath -NoNewWindow -Wait

  #### create and send scan command to product console
  $scanCommand = "FileScan.onDemand.RunScanTask custom scanBootSectors=true scanRegistry=true scanMemory=true smartScan=false scanRootKits=true scanPUA=true"

  Add-Type -AssemblyName System.Windows.Forms
  Start-Sleep -Seconds 1 # Wait for the console to fully open
  [System.Windows.Forms.SendKeys]::SendWait($scanCommand)
  [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
}
catch {
  Write-Host "There's an error with installing Dell patches or running Bitdefender: $_"
}
