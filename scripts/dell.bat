::Microsoft
"C:\ThirdParty\MSOffice\setup.exe" /download "C:\ThirdParty\MSOffice\configuration_Office_LTSC_2021.xml"

 & setup.exe /configure configuration_Office_LTSC_2021.xml

::Dell
powershell.exe -ExecutionPolicy Bypass -Command "Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\SupportAssistLauncher.exe' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-PCIe-Ethernet-Controller-Driver_VP20T_WIN_24.1.0.0_A13_01.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Dell-Wireless-1707-WiFi-Bluetooth-Driver_J5T5G_WIN_10.0.3.458_A00.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-8260-7265-3165-Wi-Fi-Driver_94C2C_WIN_21.90.3.2_A32_01.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-HD-Graphics-Driver_3PV49_WIN_20.19.15.5126_A11_02.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\NVIDIA-GeForce-and-Quadro-Series-Graphics-Driver_YWJX9_WIN_27.21.14.5241_A11.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-8260-7265-3165-Bluetooth-Driver_GN99J_WIN_21.80.0.3_A26_04.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-Rapid-Storage-Technology-Driver-and-Management_2PMT8_WIN_16.8.3.1004_A06.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Dell-Command-Monitor_6R88F_WIN_10.5.1.114_A00_02.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Dell-Security-Advisory-Update-DSA-2020-059_1GWG9_WIN64_1.0.0.0_A00.EXE' -NoNewWindow -Wait"


:: virus scan
"C:\Program Files\Bitdefender\Endpoint Security\product.console.exe" /c FileScan.OnDemand.RunScanTask custom scanBootSectors=true scanRegistry=true scanMemory=true smartScan=false scanRootKits=true scanPUA=true


                <SynchronousCommand wcm:action="add">
                    <Order>5</Order>
                    <Description>Install Google Chrome</Description>
                    <RequiresUserInput>false</RequiresUserInput>
                    <CommandLine>"C:\ThirdParty\ChromeSetup.exe" /silent /install</CommandLine>
                </SynchronousCommand>
                <SynchronousCommand wcm:action="add">
                    <Order>6</Order>
                    <Description>Install Bitdefender</Description>
                    <RequiresUserInput>false</RequiresUserInput>
                    <CommandLine>"C:\ThirdParty\setupdownloader_[aHR0cHM6Ly9jbG91ZC1lY3MuZ3Jhdml0eXpvbmUuYml0ZGVmZW5kZXIuY29tL1BhY2thZ2VzL0JTVFdJTi8wL3Y5bGM4cS9pbnN0YWxsZXIueG1sP2xhbmc9ZW4tVVM=].exe" /silent /install</CommandLine>
                </SynchronousCommand>
                <SynchronousCommand wcm:action="add">
                    <Order>7</Order>
                    <Description>Install Microsoft Office</Description>
                    <RequiresUserInput>false</RequiresUserInput>
                    <CommandLine>cd C:\ThirdParty\MSOffice & setup.exe /download configuration_Office_LTSC_2021.xml & setup.exe /configure configuration_Office_LTSC_2021.xml
                    </CommandLine>
                </SynchronousCommand>
                <SynchronousCommand wcm:action="add">
                    <Order>8</Order>
                    <Description>Install Dell Patches</Description>
                    <RequiresUserInput>true</RequiresUserInput>
                    <CommandLine>powershell.exe -ExecutionPolicy Bypass -Command "Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\SupportAssistLauncher.exe' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-PCIe-Ethernet-Controller-Driver_VP20T_WIN_24.1.0.0_A13_01.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Dell-Wireless-1707-WiFi-Bluetooth-Driver_J5T5G_WIN_10.0.3.458_A00.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-8260-7265-3165-Wi-Fi-Driver_94C2C_WIN_21.90.3.2_A32_01.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-HD-Graphics-Driver_3PV49_WIN_20.19.15.5126_A11_02.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\NVIDIA-GeForce-and-Quadro-Series-Graphics-Driver_YWJX9_WIN_27.21.14.5241_A11.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-8260-7265-3165-Bluetooth-Driver_GN99J_WIN_21.80.0.3_A26_04.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-Rapid-Storage-Technology-Driver-and-Management_2PMT8_WIN_16.8.3.1004_A06.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Dell-Command-Monitor_6R88F_WIN_10.5.1.114_A00_02.EXE' -NoNewWindow -Wait; Start-Process -FilePath 'C:\ThirdParty\Dell Lattitude E7450 Patches\Dell-Security-Advisory-Update-DSA-2020-059_1GWG9_WIN64_1.0.0.0_A00.EXE' -NoNewWindow -Wait"</CommandLine>
                </SynchronousCommand>
                <SynchronousCommand wcm:action="add">
                    <Order>9</Order>
                    <Description>Run Bitdefender full virus scan</Description>
                    <RequiresUserInput>false</RequiresUserInput>
                    <CommandLine>"C:\Program Files\Bitdefender\Endpoint Security\product.console.exe" /c FileScan.OnDemand.RunScanTask custom scanBootSectors=true scanRegistry=true scanMemory=true smartScan=false scanRootKits=true scanPUA=true</CommandLine>
                </SynchronousCommand>