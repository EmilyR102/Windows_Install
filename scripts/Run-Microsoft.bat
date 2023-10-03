cd C:\ThirdParty\MSOffice
setup.exe /download configuration_Office_LTSC_2021.xml 
setup.exe /configure configuration_Office_LTSC_2021.xml

@echo off
echo Deleting this batch file...
ping 127.0.0.1 -n 3 > nul
del "%~f0"
echo Batch file deleted.