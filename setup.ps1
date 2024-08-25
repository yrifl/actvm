Write-Host "[+] Setting network profile"
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
Write-Host "[+] Done."
Write-Host "[+] Downloading + Installing chrome rdp"
& {$P = $env:TEMP + '\chromeremotedesktophost.msi'; Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $P; Start-Process $P -Wait; Remove-Item $P}
Write-Host "[+] Done."
Write-Host "[+] Downloading + Installing chrome"
& {$P = $env:TEMP + '\chrome_installer.exe'; Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $P; Start-Process -FilePath $P -Args '/silent /install' -Verb RunAs -Wait; Remove-Item $P}
Write-Host "[+] Done."
