#will automatically login to admin so don't need admin check

# In PowerShell, single-quoted strings (') are used for literal strings where variables are not expanded, while double-quoted strings (") allow variable expansion. 

# Set execution policy to allow local scripts to run
Set-ExecutionPolicy RemoteSigned

try {
    $thirdPartyDir = "$env:SystemDrive\ThirdParty"

    echo ""
    echo ""
    echo "Installing Google Chrome..."
    echo ""
    echo ""

    # chrome install
    Start-Process "$thirdPartyDir\ChromeSetup.exe" /silent /install

    echo ""
    echo ""
    echo "Installing Bitdefender..."
    echo ""
    echo ""

    Start-Process "$thirdPartyDir\BitdefenderInstall.exe" /silent /install

    echo ""
    echo ""
    echo "Installing Microsoft Office..."
    echo ""
    echo ""

    $var = "cd $thirdPartyDir\MSOffice & setup.exe /download configuration_Office_LTSC_2021.xml & setup.exe /configure configuration_Office_LTSC_2021.xml"
    Start-Process -Verb RunAs cmd.exe -Args '/c', $var

    echo ""
    echo ""
    echo "Installing Dell Patches..."
    echo ""
    echo ""

    $filePath = "$thirdPartyDir\Dell Lattitude E7450 Patches"
    $fileList = Get-ChildItem -Path $filePath

    $count = 1
    #total = 12

    foreach ($file in $fileList) {
        echo ""
        echo "($count/12) Installing $file.FullName"
        echo ""
        Start-Process -FilePath $file.FullName -NoNewWindow -Wait
        $count++
    }

    echo ""
    echo ""
    echo "Running Full Virus Scan..."
    echo ""
    echo ""

    $consolePath = "$env:SystemDrive\Program Files\Bitdefender\Endpoint Security\product.console.exe"

    Start-Process -FilePath $consolePath -NoNewWindow -Wait

    $scanCommand = "FileScan.onDemand.RunScanTask custom scanBootSectors=true scanRegistry=true scanMemory=true smartScan=false scanRootKits=true scanPUA=true"

    Add-Type -AssemblyName System.Windows.Forms
    Start-Sleep -Seconds 1 # Wait for console to open
    [System.Windows.Forms.SendKeys]::SendWait($scanCommand)
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")

    echo ""
    echo ""
    echo "Self-deleting this script..."
    echo ""
    echo ""

    # self-delete the script
    Remove-Item -Path $MyInvocation.MyCommand.Path -Force
}
catch {
    Write-Host "There's an error with installing software: $_"
}
