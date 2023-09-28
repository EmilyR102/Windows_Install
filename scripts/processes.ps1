try {
  # chrome install
  Start-Process "ChromeSetup.exe"

  # microsoft install
  $var = 'cd\msoffice & setup.exe /download configuration_Office_LTSC_2021.xml & setup.exe /configure configuration_Office_LTSC_2021.xml'
  Start-Process -Verb RunAs cmd.exe -Args '/c', $var

  # bitdefender install
  Start-Process "bitdefender_avfree.exe"
}
catch {
  Write-Host "An error occurred: $_"
}