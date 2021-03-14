while($true) {
#Your PS code
$encpwd = Get-Content $path\bitlocker\password.bin
$passwd = ConvertTo-SecureString $encpwd
Unlock-BitLocker -MountPoint "F:" -Password $passwd

Start-Sleep –Seconds 60
}


