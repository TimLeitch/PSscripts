if(Get-Package -Name ExchangeOnlineManagement){
    Write-Host "Exchange Online Management Module is installed"
}
else{
    Write-Host "Exchange Online Management Module is not installed"
    Write-Host "Installing Exchange Online Management Module"
    Install-Module -Name ExchangeOnlineManagement -Force
}


Connect-ExchangeOnline 

#get the username they want to check for
Write-Host "Enter the email address for the mailbox you want to check. example: test.user@goterrafirma.com" -ForegroundColor Yellow
$User = Read-Host
Write-Host "This will take a few minutes to run" -ForegroundColor Blue

$list =Get-EXOMailbox -ResultSize Unlimited | Get-EXOMailboxPermission -Identity $_.Identity | Where-Object {$_.User -eq $user}

foreach ($item in $list)
{
    $item
}

Write-Host "Completed! Press any button to continue" -ForegroundColor Green
$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Disconnect-ExchangeOnline -Confirm:$false