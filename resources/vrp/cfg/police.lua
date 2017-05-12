
local cfg = {}

-- define police uniform applied customization
cfg.uniform_customization = {
  [0] = {46,0},
  [4] = {35,0},
  [6] = {24,0},
  [8] = {58,0},
  [11] = {55,0}
}

-- cloakroom position
cfg.cloakroom = {451.588, -992.919, 30.6896}

-- PC position
cfg.pc = {441.0768, -978.2520, 30.6896}

-- vehicle tracking configuration
cfg.trackveh = {
  min_time = 300, -- min time in seconds
  max_time = 600, -- max time in seconds
  service = "police" -- service to alert when the tracking is successful
}

return cfg
