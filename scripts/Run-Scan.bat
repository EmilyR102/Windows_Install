@echo off
setlocal enabledelayedexpansion

set "targetProcess=Installer.exe"

:wait_for_target
cls
tasklist /fi "imagename eq %targetProcess%" | find /i "%targetProcess%" > nul
if %errorlevel% equ 0 (
    echo Bitdefender Endpoint Security Installer is still running. Waiting...
    timeout /t 60 /nobreak > nul
    goto :wait_for_target
) else (
    echo Target application has finished running. Running full virus scan...

    "C:\Program Files\Bitdefender\Endpoint Security\product.console.exe" /c FileScan.OnDemand.RunScanTask custom scanBootSectors=true scanRegistry=true scanMemory=true smartScan=false scanRootKits=true scanPUA=true

    echo Deleting this batch file...
    ping 127.0.0.1 -n 3 > nul
    del "%~f0"
    echo Batch file deleted.
)

:end
endlocal
