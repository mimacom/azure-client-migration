$UserUPN = ([ADSI]"LDAP://<SID=$([System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value)>").UserPrincipalName

net use m: \\mima-nas-03.mimacom.local\secure /persistent:no /user:$UserUPN
net use p: \\mima-nas-03.mimacom.local\projects /persistent:no /user:$UserUPN
net use s: \\mima-nas-03.mimacom.local\software /persistent:no /user:$UserUPN