@echo off

&::To whoever on white team looks at this: I may change the passwords, account names and system paths from their current values.

net user Administrator blueteamrocks &::quickly change default password
net user guest blueteambestteam      &::quickly change default password

wmic useraccount where name='Administrator' rename 22705adminHIREDTEAM  &::Change default account names just to mess with redteam
wmic useraccount where name='Guest' rename 90383guestPLZNOHACK

netsh  advfirewall set allprofiles state on &::turn on firewall

net use /persistant:yes                       &::map sysinternals to new drive
net use z: https://live.sysinternals.com/tools

reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d bgimage.jpg /f  &::set wallpaper

reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /506 /f                   &::Murder sticky keys
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard" /v ResponseLocate /122 /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys" /58 /f

schtaks /delete /tn * /f &::disable scheduled tasks

netsh advfirewall firewall add rule name="PSExec" protocol=TCP dir=in localport=445 action=block  &::block PSExec
netsh advfirewall firewall add rule name="PSExec" protocol=TCP dir=out localport=445 action=block

REG ADD  “HKLM\Software\policies\Microsoft\Windows NT\DNSClient”           &::disable LLMNR (No NTLM relaying for you Enzo)
REG ADD  “HKLM\Software\policies\Microsoft\Windows NT\DNSClient” /v ”EnableMulticast” /t REG_DWORD /d “0” /f

net user  &::Print out the users so user can change all the default passwords

notsytemMuniter64.exe -i config.xml &::START SYSMON

echo "remember to change these passwords"
echo "remember to do set up for this machine"
echo "You may find the fllowing sysinternals things useful: Process exporer (enable sig verification in settings), autoruns, Process Manager, tcpview"
echo "IF THIS IS A DNS MACHINE MAKE 7 BACKUPS IN 20 DIFFRENT PLACES: Windows\System32\DNS Directory"
echo "alias robocopy <file> to some location you need admin perms to delete (not sure about this one)"
echo "check group policy. For the most part enabled things are sus"
echo "check PAM"

