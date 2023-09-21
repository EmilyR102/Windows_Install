$filePath = 'C:\Users\TUCCAdmin\Downloads\Dell Lattitude E7450 Patches'

$fileList = GET-ChildItem -Path $filePath

foreach ($file in $fileList) {
  Start-Process -FilePath $file.FullName -NoNewWindow -Wait
}