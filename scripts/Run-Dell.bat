@echo off
start /wait "SupportAssist" "C:\ThirdParty\Dell Lattitude E7450 Patches\SupportAssistLauncher.exe"
start /wait "Intel Ethernet Controller Driver" "C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-PCIe-Ethernet-Controller-Driver_VP20T_WIN_24.1.0.0_A13_01.EXE"
start /wait "Dell Wireless 1707 Driver" "C:\ThirdParty\Dell Lattitude E7450 Patches\Dell-Wireless-1707-WiFi-Bluetooth-Driver_J5T5G_WIN_10.0.3.458_A00.EXE"
start /wait "Intel Wi-Fi Driver" "C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-8260-7265-3165-Wi-Fi-Driver_94C2C_WIN_21.90.3.2_A32_01.EXE"
start /wait "Intel HD Graphics Driver" "C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-HD-Graphics-Driver_3PV49_WIN_20.19.15.5126_A11_02.EXE"
start /wait "NVIDIA Graphics Driver" "C:\ThirdParty\Dell Lattitude E7450 Patches\NVIDIA-GeForce-and-Quadro-Series-Graphics-Driver_YWJX9_WIN_27.21.14.5241_A11.EXE"
start /wait "Intel Bluetooth Driver" "C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-8260-7265-3165-Bluetooth-Driver_GN99J_WIN_21.80.0.3_A26_04.EXE"
start /wait "Intel Rapid Storage Technology Driver" "C:\ThirdParty\Dell Lattitude E7450 Patches\Intel-Rapid-Storage-Technology-Driver-and-Management_2PMT8_WIN_16.8.3.1004_A06.EXE"
start /wait "Dell Command Monitor" "C:\ThirdParty\Dell Lattitude E7450 Patches\Dell-Command-Monitor_6R88F_WIN_10.5.1.114_A00_02.EXE"
start /wait "Dell Security Advisory Update" "C:\ThirdParty\Dell Lattitude E7450 Patches\Dell-Security-Advisory-Update-DSA-2020-059_1GWG9_WIN64_1.0.0.0_A00.EXE"

echo All Dell installations have completed.

@echo off
echo Deleting this batch file...
ping 127.0.0.1 -n 3 > nul
del "%~f0"
echo Batch file deleted.