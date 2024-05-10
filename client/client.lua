local function SendReactMessage(action, data)
  SendNUIMessage({
    action = action,
    data = data
  })
end

RegisterNetEvent("demi_lootbox:RollCase", function(lootPool, winner)
  SendReactMessage('setLootData', { pool = lootPool, winner = winner })
end)

RegisterNUICallback('finished', function(winner, cb)
  TriggerServerEvent('demi_lootbox:getQueuedItem', winner)
  cb({})
end)
