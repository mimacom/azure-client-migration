$url = "https://raw.githubusercontent.com/mimacom/azure-client-migration/master/network-share/download.ps1"
$install_folder_path = "$($env:systemdrive)\network-share"
$install_path = "$($install_folder_path)\download.ps1"
$startup_path = "$($env:programdata)\Microsoft\Windows\Start Menu\Programs\Startup\Mount Network Drives.lnk"
$startmenu_path = "$($env:programdata)\Microsoft\Windows\Start Menu\Programs\Mount Network Drives.lnk"

# download download.ps1 script
new-item $install_folder_path -itemtype directory
$downloader = new-object System.Net.WebClient
$downloader.DownloadFile($url, $install_path)

# create shortcuts to allusers startup and startmenu folder
$WshShell = New-Object -comObject WScript.Shell
$startup_shortcut = $WshShell.CreateShortcut($startup_path)
$startup_shortcut.TargetPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -file $($install_path)"
$startup_shortcut.Save()

$startmenu_shortcut = $WshShell.CreateShortcut($startmenu_path)
$startmenu_shortcut.TargetPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -file $($install_path)"
$startmenu_shortcut.Save()