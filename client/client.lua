local function getWinnerForCase(case)
  local lootPool, winner = lib.callback.await('demi_lootbox:getCaseAndWinner', false, case)

  SendReactMessage('setLootData', { pool = lootPool, winner = winner })
end

RegisterCommand('opencase', function(src, args)
  if not args[1] then return end
  getWinnerForCase(args[1])
end)

exports('openCase', getWinnerForCase)


RegisterNUICallback('finished', function(_,cb)
  TriggerServerEvent('demi_lootbox:getQueuedItem')
  cb({})
end)
