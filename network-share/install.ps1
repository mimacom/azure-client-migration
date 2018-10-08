#requires -runasadministrator

# variables
$url = "https://raw.githubusercontent.com/mimacom/azure-client-migration/master/network-share/download.ps1"
$install_folder_path = "$($env:systemdrive)\network-share"
$install_path = "$($install_folder_path)\download.ps1"
$startup_path = "$($env:programdata)\Microsoft\Windows\Start Menu\Programs\Startup\Mount Network Drives.lnk"
$startmenu_path = "$($env:programdata)\Microsoft\Windows\Start Menu\Programs\Mount Network Drives.lnk"


# abort if not admin
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    write-host "Not running as administrator! Aborting." -foregroundcolor red 
} else {
    # remove probably already installed files
    remove-item -recurse -ErrorAction Ignore -path $install_folder_path
    remove-item -recurse -ErrorAction Ignore -path $startup_path
    remove-item -recurse -ErrorAction Ignore -path $startup_path
    
    # download download.ps1 script
    new-item $install_folder_path -itemtype directory
    $downloader = new-object System.Net.WebClient
    $downloader.DownloadFile($url, $install_path)
    
    # create shortcuts to allusers startup and startmenu folder
    $WshShell = New-Object -comObject WScript.Shell
    $startup_shortcut = $WshShell.CreateShortcut($startup_path)
    $startup_shortcut.TargetPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
    $startup_shortcut.Arguments = "-file $($install_path)"
    $startup_shortcut.Save()
    
    $startmenu_shortcut = $WshShell.CreateShortcut($startmenu_path)
    $startmenu_shortcut.TargetPath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
    $startmenu_shortcut.Arguments = "-file $($install_path)"
    $startmenu_shortcut.Save()
}
