---@param action string The action you wish to target
---@param data any The data you wish to send along with this action
function SendReactMessage(action, data)
	SendNUIMessage({ action = action, data = data })
end

---@param case string The case for which to get the winner and loot pool
local function getWinnerForCase(case)
	local lootPool, winner = lib.callback.await("demi_lootbox:getCaseAndWinner", false, case)
	SendReactMessage("setLootData", { pool = lootPool, winner = winner })
end
exports("openCase", getWinnerForCase)

---@diagnostic disable-next-line: missing-parameter
RegisterCommand("opencase", function(_, args)
	if #args < 1 then
		return TriggerEvent("chat:addMessage", "Invalid Syntax. Usage: /opencase [caseName]")
	end

	local case = args[1]
	if case then getWinnerForCase(case) end
end)

RegisterNUICallback("finished", function(_, cb)
	TriggerServerEvent('demi_lootbox:getQueuedItem')
	cb({})
end)