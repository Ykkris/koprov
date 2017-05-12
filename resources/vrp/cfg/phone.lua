
local cfg = {}

-- size of the sms history
cfg.sms_history = 15

-- maximum size of an sms
cfg.sms_size = 500

-- duration of a sms position marker (in seconds)
cfg.smspos_duration = 300

-- define phone services
-- blipid, blipcolor (customize alert blip)
-- alert_time (alert blip display duration in seconds)
-- alert_permission (permission required to receive the alert)
-- alert_notify (notification received when an alert is sent)
-- notify (notification when sending an alert)
cfg.services = {
  ["Police"] = {
    blipid = 304,
    blipcolor = 38,
    alert_time = 300, -- 5 minutes
    alert_permission = "police.service",
    alert_notify = "~r~Alerte police:~n~~s~",
    notify = "~b~Vous avez appelé la police."
  },
  ["Taxi"] = {
    blipid = 198,
    blipcolor = 5,
    alert_time = 180,
    alert_permission = "taxi.service",
    alert_notify = "~y~Alerte taxi:~n~~s~",
    notify = "~y~Vous avez appelé un taxi."
  },
  ["Dépanneur"] = {
  blipid = 446,
  blipcolor = 60,
  alert_time = 300,
  alert_permission = "tow.service",
  alert_notify = "~y~Dépannage:~n~~s~",
  notify = "~y~Vous avez appelé un dépanneur."
}
}

return cfg
