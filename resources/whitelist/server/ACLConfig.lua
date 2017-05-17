-- Check the ping of the client attempting to connect. Set to 0 to disable this check
ACL.maxPing = 120

-- Set to false to disable whitelisting
ACL.enableWhitelist = true

-- Set to true to enable the /kick and /playerlist commands
ACL.enablePlayerManagement = true

-- Set to false to disable the check whether identities really belong to connecting player (causes "please try again" message)
ACL.useIdentBugWorkaround = true

ACL.whitelist = {
}

-- Currently mods and admins are indistinguishable
ACL.mods = {
}

ACL.admins = {
	"steam:110000101f91cd2",
	"steam:110000104bd6595",
	"steam:110000102f38cb7",
	"steam:110000101889e5e",
	"steam:110000107102B2C",
	"steam:11000010599af76"
}

ACL.banlist = {
}