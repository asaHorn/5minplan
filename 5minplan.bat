@echo off

::To whoever on white team looks at this: I may change the passwords, account names and system paths from their current values.

net user Administrator blueteamrocks &::quickly change default password
net user guest blueteambestteam      &::quickly change default password
net user DefaultAccount blueparrot
net user defaultuser0 redteamsmells

wmic useraccount where name='Administrator' rename 22705adminHIREDTEAM  &::Change default account names just to mess with redteam
wmic useraccount where name='Guest' rename 22705guestPLZNOHACK
wmic useraccount where name='defaultAccount' rename 22705defaultAccountYOUCANNEVERFINDMYPASSWORDS
wmic useraccount where name='defaultuser0' rename 22705duser0RSTHISISUSELESS

netsh  advfirewall set allprofiles state on &::turn on firewall
                      
net use z: https://live.sysinternals.com/tools /persistent:yes &::map sysinternals to new drive

reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d bgimage.jpg /f  &::set wallpaper

schtasks /delete /tn * /f &::disable scheduled tasks

netsh advfirewall firewall add rule name="PSExec" protocol=TCP dir=in localport=445 action=block  &::block PSExec
netsh advfirewall firewall add rule name="PSExec" protocol=TCP dir=out localport=445 action=block

notsytemMuniter64.exe -i config.xml -accepteula &::START SYSMON

echo 
echo 
echo 
echo 

net user  &::Print out the users so user can change all the default passwords

echo -----------------------------

echo remember to change these passwords
echo remember to do set up for this machine
echo You may find the fllowing sysinternals things useful: Process exporer (enable sig verification in settings), autoruns, Process Manager, tcpview
echo IF THIS IS A DNS MACHINE MAKE 7 BACKUPS IN 20 DIFFRENT PLACES: Windows\System32\DNS Directory
echo alias robocopy <file> to some location you need admin perms to delete (not sure about this one)
echo Turn of sticky keys
echo check group policy. For the most part enabled things are sus
echo turn off NTBIOS (adapter settings advanced) and LLMNR(group policy DNS)
echo check PAM
echo Also right click on the very important background image and set it as desktop

