$UserUPN = whoami.exe /upn

net use m: \\share.flowable.group\secure /persistent:no /user:$UserUPN
net use p: \\share.flowable.group\projects /persistent:no /user:$UserUPN
net use s: \\share.flowable.group\software /persistent:no /user:$UserUPN
