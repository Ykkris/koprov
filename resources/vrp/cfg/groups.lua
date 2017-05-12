
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
  ["superadmin"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"You are superadmin."}) end},
    "player.group.add",
    "player.group.remove"
  },
  ["admin"] = {
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.custom_emote",
    "player.coords"
  },
  -- the group user is auto added to all logged players
  ["user"] = {
    "player.phone"
  },
  ["police"] = {
    "police.cloakroom",
    "police.pc",
    "police.handcuff",
    "police.putinveh",
    "police.askid",
    "police.check",
    "police.service"
  },
  ["taxi"] = {
    _config = { gtype = "job" },
    "taxi.service"
  },
  ["depanneur"] = {
  _config = { gtype = "job"},
  "tow.service"
}
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
  [1] = { -- give superadmin and admin group to the first created user on the database
    "superadmin",
    "admin"
  }
}

return cfg

