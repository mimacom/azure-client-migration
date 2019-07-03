#requires -runasadministrator

# variables
$install_folder_path = "$($env:systemdrive)\network-share"
$startup_path = "$($env:programdata)\Microsoft\Windows\Start Menu\Programs\Startup\Mount Network Drives.lnk"
$startmenu_path = "$($env:programdata)\Microsoft\Windows\Start Menu\Programs\Mount Network Drives.lnk"

# umount
net use m: /delete
net use p: /delete
net use s: /delete

# # remove installation
# remove-item -literalpath $install_folder_path -recurse
# remove-item -literalpath $startup_path
# remove-item -literalpath $startmenu_path