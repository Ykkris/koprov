-- Creating hen spawn
local hen = {
  {type= 28, hash= 0x6AF51FAF, x= 2126.68, y= 5013.56, z= 41.42}
}

AddEventHandler('onClientMapStart', function()

  RequestModel(0x6AF51FAF)
  while not HadModelLoaded(0x6AF51FAF) do
    Wait(1)
  end

  for _, item in pairs(hen) do
    hens = CreatePed(item.type, item.hash, item.x, item.y, item.z, false, false)
  end
end)