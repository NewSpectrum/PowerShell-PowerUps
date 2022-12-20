$FILE=Get-Item 'C:\test' -Force
$FILE.attributes='Hidden'
$FILE.attributes = $FILE.attributes -bxor [System.IO.FileAttributes]::Hidden

$FILE.PSIsContainer = $True.m