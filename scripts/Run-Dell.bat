@echo off
setlocal enabledelayedexpansion

set progressFile=progress.txt
set "patchFolderPath=C:\ThirdParty\Dell Lattitude E7450 Patches"
set processes=("SupportAssistLauncher.exe" "Intel-PCIe-Ethernet-Controller-Driver_VP20T_WIN_24.1.0.0_A13_01.EXE" "Dell-Wireless-1707-WiFi-Bluetooth-Driver_J5T5G_WIN_10.0.3.458_A00.EXE" "Intel-8260-7265-3165-Wi-Fi-Driver_94C2C_WIN_21.90.3.2_A32_01.EXE" "Intel-HD-Graphics-Driver_3PV49_WIN_20.19.15.5126_A11_02.EXE" "NVIDIA-GeForce-and-Quadro-Series-Graphics-Driver_YWJX9_WIN_27.21.14.5241_A11.EXE" "Intel-8260-7265-3165-Bluetooth-Driver_GN99J_WIN_21.80.0.3_A26_04.EXE" "Intel-Rapid-Storage-Technology-Driver-and-Management_2PMT8_WIN_16.8.3.1004_A06.EXE" "Dell-Command-Monitor_6R88F_WIN_10.5.1.114_A00_02.EXE" "Dell-Security-Advisory-Update-DSA-2020-059_1GWG9_WIN64_1.0.0.0_A00.EXE" "E7450A24.exe")

rem Check if the progress file exists. If not, create it.
if not exist %progressFile% (
    echo Creating progress file...
    echo 0 > %progressFile%
)

rem Read the last completed process index from the progress file.
set /p lastCompleted=<%progressFile%

echo Continuing from process %lastCompleted%

for /l %%i in (%lastCompleted%,1,10) do (
    echo Starting !processes[%%i]!...
    start /wait "!processes[%%i]!" "!patchFolderPath!\!processes[%%i]!"
    
    rem Check if the process is still running.
    tasklist | findstr /i "!processes[%%i]!" >nul
    if %errorlevel% neq 0 (
        echo !processes[%%i]! is not running. Initiating a reboot...
        echo %%i > %progressFile%
        shutdown /r /f /t 10 /d p:2:4 /c "Rebooting for Process Completion"
    )
)

if %lastCompleted% geq 10 (
    echo All Dell processes completed successfully.
    
    @echo off
    echo Deleting this batch file and progress.txt...

    del %progressFile%

    ping 127.0.0.1 -n 3 > nul
    del "%~f0"
    echo Batch file deleted.
)
