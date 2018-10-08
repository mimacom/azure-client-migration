$url = "https://raw.githubusercontent.com/mimacom/azure-client-migration/master/network-share/mount.ps1"
$path = "$($env:temp)\mount.ps1"


# download mount.ps1 script
$downloader = new-object System.Net.WebClient
$downloader.DownloadFile($url, $path)

# run mount.ps1 script
& $path