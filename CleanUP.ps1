$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace(0xA)
$WinTemp = "c:\Windows\Temp\*"

#### Remove Temp Files#####
write-Host "Removing Temporary Files" -ForegroundColor Green
Set-Location “C:\Windows\Temp”
Remove-Item * -Recurse -Force -ErrorAction SilentlyContinue

Set-Location “C:\Windows\Prefetch”
Remove-Item * -Recurse -Force -ErrorAction SilentlyContinue

Set-Location “C:\Documents and Settings”
Remove-Item “.\*\Local Settings\temp\*” -Recurse -Force -ErrorAction SilentlyContinue

Set-Location “C:\Users”
Remove-Item “.\*\Appdata\Local\Temp\*” -Recurse -Force -ErrorAction SilentlyContinue

####### Empty Recycle Bin ########
write-Host "Emptying Recycle Bin." -ForegroundColor Blue 
$objFolder.items() | %{ remove-item $_.path -Recurse -Confirm:$false}


###### Running Disk Clean up Tool ######
write-Host "Running the Windows Disk Clean up Tool" -ForegroundColor White
cleanmgr /sagerun:1 | out-Null 

##### Clear Windows Store cache#######
### write-Host "Clearing the Windows Store cache" -ForegroundColor Green
### wsreset.exe

#####Clearing DNS cache#########
write-Host "Flushing DNS" -ForegroundColor Blue
ipconfig /flushdns



$([char]7)
Sleep 3
write-Host "Cleanup complete" -ForegroundColor Yellow 
Sleep 3
