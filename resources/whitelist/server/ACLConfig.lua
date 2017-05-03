-- Check the ping of the client attempting to connect. Set to 0 to disable this check
ACL.maxPing = 120

-- Set to false to disable whitelisting
ACL.enableWhitelist = true

-- Set to true to enable the /kick and /playerlist commands
ACL.enablePlayerManagement = true

-- Set to false to disable the check whether identities really belong to connecting player (causes "please try again" message)
ACL.useIdentBugWorkaround = true

ACL.whitelist = {
	"Astou / Roger Bergamo",
}

-- Currently mods and admins are indistinguishable
ACL.mods = {
}

ACL.admins = {
	"steam:110000101f91cd2",
}

ACL.banlist = {
}