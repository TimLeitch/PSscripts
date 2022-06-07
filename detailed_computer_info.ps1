#Get detailed computer info
$dir = FT (Join-Path ([environment]::GetFolderPath(('Desktop'))))
Get-ComputerInfo  > FT $dir.ComputerInfo.txt
Read-Host -Prompt "Press Enter to Exit"