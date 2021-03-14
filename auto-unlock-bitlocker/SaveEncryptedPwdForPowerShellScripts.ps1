$SecureString = ConvertTo-SecureString ">Lza86BW>CaR2LF%" -AsPlainText -Force
$encpwd = ConvertFrom-SecureString -SecureString $SecureString
$encpwd > $path\bitlocker\password.bin
