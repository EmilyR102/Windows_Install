"C:\Program Files\Bitdefender\Endpoint Security\product.console.exe" /c FileScan.OnDemand.RunScanTask custom scanBootSectors=true scanRegistry=true scanMemory=true smartScan=false scanRootKits=true scanPUA=true

@echo off
echo Deleting this batch file...
ping 127.0.0.1 -n 3 > nul
del "%~f0"
echo Batch file deleted.