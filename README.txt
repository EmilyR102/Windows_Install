UNATTENDED INSTALLS:
The commands are in the file. Just don't accidentally restart computer (during the Dell phase) while they're running and especially during the virus scan.

Leave computer connected to network prior and during this entire process.

DELL PATCHES:

The Run-Dell.bat runs automatically after each reboot. There may be issues with installing the following due to drive dependencies or some external issue (I tried to comply with the correct order to install drives as shown in the bat file, but these may not always install successfully):
- NVIDIA-GeForce-and-Quadro-Series-Graphics-Driver_YWJX9_WIN_27.21.14.5241_A11.EXE and - Dell-Wireless-1707-WiFi-Bluetooth-Driver_J5T5G_WIN_10.0.3.458_A00.EXE

WINDOWS IMAGE:
I used a Windows.iso that's 32-bit and 64-bit. I got the 64 bit Windows install to work perfectly, but the 32-bit version during the boot stage said it's missing a windows.eog file.

IMPORTANT USB DETAILS:
Must have a GPT Partition Scheme and NTFS File System
I used Rufus to make my USB

IMPORTANT FILES TO TRANSFER INTO A NEW BOOTABLE USB:
Everything in the folders x64 and x86:
install.wim and the clg file should go in the corresponding sources folders in the bootable usb.