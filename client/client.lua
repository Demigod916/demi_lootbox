---@param action string The action you wish to target
---@param data any The data you wish to send along with this action
local function SendReactMessage(action, data)
  SendNUIMessage({
    action = action,
    data = data
  })
end

---@param case string The name of the case you want to roll from the CASES table in `server/data.lua`
local function getWinnerForCase(case)
  local lootPool, winner = lib.callback.await('demi_lootbox:getCaseAndWinner', false, case)

  SendReactMessage('setLootData', { pool = lootPool, winner = winner })
end

RegisterCommand('opencase', function(_, args)
  if not args[1] then return end
  getWinnerForCase(args[1])
end)

exports('openCase', getWinnerForCase)


RegisterNUICallback('finished', function(_,cb)
  TriggerServerEvent('demi_lootbox:getQueuedItem')
  cb({})
end)
