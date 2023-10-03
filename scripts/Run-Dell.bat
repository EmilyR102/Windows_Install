setlocal enabledelayedexpansion
@echo off

set progressFile=progress.txt
set "patchFolderPath=C:\ThirdParty\Dell Lattitude E7450 Patches"
set processes[1]=SupportAssistLauncher.exe
set processes[2]=Intel-PCIe-Ethernet-Controller-Driver_VP20T_WIN_24.1.0.0_A13_01.EXE
set processes[3]=Intel-8260-7265-3165-Wi-Fi-Driver_94C2C_WIN_21.90.3.2_A32_01.EXE
set processes[4]=Intel-HD-Graphics-Driver_3PV49_WIN_20.19.15.5126_A11_02.EXE
set processes[5]=Intel-8260-7265-3165-Bluetooth-Driver_GN99J_WIN_21.80.0.3_A26_04.EXE
set processes[6]=Intel-Rapid-Storage-Technology-Driver-and-Management_2PMT8_WIN_16.8.3.1004_A06.EXE
set processes[7]=Dell-Command-Monitor_6R88F_WIN_10.5.1.114_A00_02.EXE
set processes[8]=Dell-Security-Advisory-Update-DSA-2020-059_1GWG9_WIN64_1.0.0.0_A00.EXE

rem the following may give an unsuccessful install error perhaps due to drive dependencies
set processes[9]=NVIDIA-GeForce-and-Quadro-Series-Graphics-Driver_YWJX9_WIN_27.21.14.5241_A11.EXE
set processes[10]=Dell-Wireless-1707-WiFi-Bluetooth-Driver_J5T5G_WIN_10.0.3.458_A00.EXE
set processes[11]=E7450A24.exe

rem Check if the progress file exists. If not, create it.
if not exist %progressFile% (
    echo Creating progress file...
    echo 0 > %progressFile%
)

:continue
rem Read the last completed process index from the progress file.
set /p lastCompleted=<%progressFile%

rem Delete files if all processes ran
if %lastCompleted% geq 11 (
    echo All Dell processes completed successfully.
    
    echo Deleting this batch file and progress.txt...

    set "shortcutFile=C:\Users\TUCCAdmin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Run-Dell - Shortcut"
    del %progressFile%
    del %shortcutFile%

    ping 127.0.0.1 -n 3 > nul
    del "%~f0"
    echo Batch file deleted.
    goto :eof
)

rem Run current process
set /a "currIdx=%lastCompleted%+1"
set currentProcess=!processes[%currIdx%]!
set "currentProcessPath=!patchFolderPath!\!currentProcess!"
echo Starting process #%currIdx%:!currentProcess! at "!currentProcessPath!"
echo %currIdx% > %progressFile%
call "!currentProcessPath!"
goto :continue

endlocal