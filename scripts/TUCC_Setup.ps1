

$params = @{
    Name        = 'TUCCUser'
    Password    = 'User1'
    FullName    = 'TUCC User'
    Description = 'Trinity Child Care Local User Account'
}
New-LocalUser @params

echo ""
echo ""
echo "Installing Google Chrome..."
echo ""
echo ""

$LocalTempDir = $env:TEMP; 
$ChromeInstaller = "ChromeInstaller.exe"; 
(new-object System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor = "ChromeInstaller"; 
Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; 
If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)



echo ""
echo ""
echo "Installing BitDefender..."
echo ""
echo ""

Function New-FileDownload {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Url,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Destination
    )
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($Url, $Destination)
    if (Test-Path -LiteralPath $Destination) {
        Write-Verbose "File downloaded Successfully"
        return $true
    }
    else {
        Write-Verbose "File download Failed"
        return $false
    }
}
 
$Installed = Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | 
Where-Object { $_.DisplayName -eq "Bitdefender Endpoint Security Tools" }
 
if ($Installed) {
    Write-Output "Bitdefender already installed. Exiting."
    Exit 1
}
 
$BitdefenderURL = "setupdownloader_thisistheuniquepart.exe"
Write-Output "Beginning download of Bitdefender..."
$BaseURL = "https://cloud.gravityzone.bitdefender.com/Packages/BSTWIN/0/"
$URL = $BaseURL + $BitdefenderURL
$Destination = "$($env:TEMP)\$($BitdefenderURL)"
 
$FileDownload = New-FileDownload -Url $URL -Destination $Destination
if ($FileDownload) {
    Write-Output "Download succeeded, beginning install..."
    Start-Process $Destination -ArgumentList "/bdparams /silent silent" -Wait -NoNewWindow
    Start-Sleep -Seconds 30
}
else {
    Write-Output "File failed to download. Exiting."
    Exit 1
}
$Installed = Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*" | 
Where-Object { $_.DisplayName -eq "Bitdefender Endpoint Security Tools" }
 
if ($Installed) {
    Write-Output "Bitdefender successfully installed."
    Exit 0
}
else {
    Write-Output "ERROR: Failed to install Bitdefender"
    Exit 1
}


setupdownloader_[aHR0cHM6Ly9jbG91ZC1lY3MuZ3Jhdml0eXpvbmUuYml0ZGVmZW5kZXIuY29tL1BhY2thZ2VzL0JTVFdJTi8wL3Y5bGM4cS9pbnN0YWxsZXIueG1sP2xhbmc9ZW4tVVM=]