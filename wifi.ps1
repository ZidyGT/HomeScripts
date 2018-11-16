while((Get-NetAdapter "Wi-fi 2").Status -ne "Up")
	{
		netsh wlan connect name="Polachovi"
		Start-Sleep -Milliseconds 2250
 	}
netsh wlan set profileparameter name="Polachovi" ConnectionMode=auto
exit

