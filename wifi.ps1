# script for set up wireless

$interface="Wi-Fi 2"
$round=1
$connected="TRUE"

function test($ip) {
If (Test-Connection $ip -Count 1 -ErrorAction SilentlyContinue  ) { 
   $true
   } 
   Else {
   $false
   }
  }

Write-Host "START INTERNETU ..."
while ((NetAdapter $interface).Status -ne "Up" *>&1 | out-null){
  [void](netsh wlan connect name="Polachovi" interface=$interface)
  [void](timeout 2)

  If ($round –gt 3) {
    $connected="FALSE"
    break
  }
  $round++
}
[void](netsh wlan set profileparameter name="Polachovi" interface=$interface ConnectionMode=auto)
If ($connected -eq "TRUE" -And (test 8.8.8.8)) { 
    Write-Host "                                     "
    Write-Host "                    O           O    "
    Write-Host "                          A          "
    Write-Host "                      _________      "
    Write-Host "                      \_______/      "
    Write-Host "                                     "	
    Write-Host "                  INTERNET FUNGUJE   "
    [void](Start-Sleep -s 1)
} Else { 
        Write-Host "                                     "
    Write-Host "                    A           A    "
    Write-Host "                          I          "
    Write-Host "                       _______       "
    Write-Host "                      /_______\      "
    Write-Host "                                     "
    Write-Host "------------------------------------------------------"
    Write-Host "TATI/MAMI zřejmně máte vypojený kabel (2. zprava v té krabičce pod monitorem) prosím výtáhněte ho a znova zasuňte a vypnetě/zapněte (restartujte) počítač."
    Write-Host "                                     "
    Write-Host "INTERNET by měl fungovat. Pokud ne tak mně zavolejte!!                        "
    Write-Host "------------------------------------------------------"
    [void](timeout 20)
}

exit
