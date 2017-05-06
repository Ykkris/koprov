-- Manifest
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

-- Requiring essentialmode
dependency 'essentialmode'

-- General
client_scripts {
  'thecops_client.lua'
}

server_scripts {
  'thecops_server.lua'
}

export 'getIsInService'
