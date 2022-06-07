#Requires -RunAsAdministrator

function show-menu{
    Write-Host ""
    Write-Host "1. Winget Menu" 
    Write-Host "2. Install Unifying Software "
    Write-Host "3. Install ScanSnap Offline version"
    Write-Host "4. Run RevoUninstaller Portable"
    Write-Host "5. Clear Teams Cache"
    Write-Host "6. Pin Word,Excel,Outlook to taskbar"
    Write-Host "7. Remove Win10 Bloatware crap"
    Write-Host "8. Set NumLock to on at startup"
    Write-Host "9. Install Dell Support Assistant"
    Write-Host "10. Repair FileSystem"
    Write-Host "11. Cleanup Temp Files and Computer"
    Write-Host "12. Install SolutionView 3.0.31 (BIG DOWNLOAD)"
    
    Write-Host "Enter q to quit" -BackgroundColor Red

}

function winget-menu{
    Write-Host""
    Write-Host "1. Install Winget (**Must be installed prior to installing other packages**)" -ForegroundColor Green -BackgroundColor Red
    Write-Host "2. Install Plantronics Hub Installer" 
    Write-Host "3. Install Jabra Direct"
    Write-Host "4. Install DYMO Connect"
    Write-Host "5. Install Dialpad"
    Write-Host "6. Install Teams"
    Write-Host "7. Install Sonos S1 Controller"
    Write-Host "8. Install WinDirStat"
    Write-Host "9. Upgrade all packages"
    Write-Host "Enter q to quit" -ForegroundColor Blue
    $Global:y = Read-Host "Enter your choice: "
}
function winget-installers{
    switch ($Global:y) {
        1{
         Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://gist.github.com/TimLeitch/a7163b75eb535a27161d63ce797d3b05/raw'))
        }
        2{
         winget install --id=Poly.PlantronicsHub  --accept-source-agreements --accept-package-agreements
        }
        3{
            winget install --id=Jabra.Direct -e --accept-source-agreements --accept-package-agreements
         }
         4{
             winget install --id=SanfordLP.DYMOConnect -e --accept-source-agreements --accept-package-agreements
         }
         5{
             winget install --id=Dialpad.Dialpad -e --accept-source-agreements --accept-package-agreements
         }
         6{
             winget install --id=Microsoft.Teams -e --accept-source-agreements --accept-package-agreements
         }
         7{
            winget install --id=Sonos.S1Controller -e --accept-source-agreements --accept-package-agreements
         }
         8{
            winget install --id=WinDirStat.WinDirStat -e --accept-source-agreements --accept-package-agreements
         }
         9{
             winget upgrade --all
         }
 
    }
 
 }

do{
    show-menu
    $Global:x = Read-Host "Enter your choice: "
switch ($Global:x) {

    1 { do{
        winget-menu
        winget-installers
    }
    while ($Global:y -ne 'q')}
    2 {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://gist.github.com/TimLeitch/8d5e9c8fb72aa2f30a7323816db649a6/raw'))
    }
    3 {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://gist.github.com/TimLeitch/66e5517d817976944c03610ea4cf9124/raw'))
    }
    4 {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://gist.github.com/TimLeitch/a45507362467643a7609e7e365152355/raw'))
    }
    5 {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://gist.github.com/TimLeitch/44aa9b898967cf632f20ad78743fd81d/raw'))
    }
    6 {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://gist.github.com/TimLeitch/303e279c231e1a59711ac15ddf46c285/raw'))
    }
    7 {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://gist.github.com/TimLeitch/091a57039cc938da3c654371b66d4e58/raw'))
    }
    8 {
        #Set NumLock ON at Windows login screen

        $path = 'Registry::\HKEY_USERS\.DEFAULT\Control Panel\Keyboard\'
        $name = 'InitialKeyboardIndicators'
        $value = '2'
        Set-Itemproperty -Path $path -Name $name -Value $value

        Write-Host "NumLock ON at Windows login screen"
    }
    9 {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://gist.github.com/TimLeitch/3f0bb180fa245f8c5851b597a908b2a1/raw'))
    }
    10 {
        sfc /scannow
        dism /online /cleanup-image /CheckHealth
        dism /online /cleanup-image /ScanHealth
        dism /online /cleanup-image /startcomponentcleanup
        dism /online /cleanup-image /restorehealth
    }
    11 {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://gist.github.com/TimLeitch/ed9c41e166937d0009df723000c78690/raw'))
    }
    12 {
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://gist.github.com/TimLeitch/f5ac65e5903736d9097a70453678ed7c/raw'))
    }
    13 {}



}
}while($x -ne "q")
