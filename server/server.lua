---@param t1 table
---@param t2 table
---@return table
local function tableConcat(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end

---@param tbl table
---@return table
local function shuffle(tbl)
	for i = #tbl, 2, -1 do
		local shuff = math.random(i)
		tbl[i], tbl[shuff] = tbl[shuff], tbl[i]
	end
	return tbl
end

---@param case table
---@return table
local function generateLootPoolFromCase(case)
	local pool = {}
	local luck = {
		common = 80,
		uncommon = 16,
		rare = 3,
		epic = 0,
		legendary = 0,
	}

	local random = math.random(100)

	if random > 74 then
		luck.legendary = luck.legendary + 1
	elseif random > 10 then
		luck.epic = luck.epic + 1
	else
		luck.rare = luck.rare + 1
	end

	for i = 1, PoolSize do
		local rarity = next(luck)
		if not rarity then break end

		local chosenCase = case[rarity]
		local chosenItem = chosenCase[math.random(#chosenCase)]

		local newItem = {
			name = chosenItem.name,
			amount = chosenItem.amount,
			label = chosenItem.label,
			rarity = rarity,
		}

		pool[i] = newItem

		luck[rarity] = luck[rarity] - 1
		if luck[rarity] <= 0 then
			luck[rarity] = nil
		end
	end

	shuffle(pool)
	pool = tableConcat(pool, pool)

	return pool
end

---@param source number
---@param caseIndex number
lib.callback.register("demi_lootbox:getCaseAndWinner", function(source, caseIndex)
	local case = CASES[caseIndex]
	if not case then return end

	local lootPool = generateLootPoolFromCase(case)
	local winner = (math.random(#lootPool - PoolSize) + PoolSize)
	PlayerLootQueue[source] = lootPool[winner]

	return lootPool, winner - 1
end)

---@param source number
lib.callback.register("demi_lootbox:getQueuedItem", function(source)
	local player = Bridge.getPlayer(source)
	if not player then return false end

	if not PlayerLootQueue[player.source] then
		warn("^1 ==================================================================================================")
		warn(("^1 [WARNING]: POSSIBLE CHEATER. Player Source %s triggered lootbox get item event while not in queue"):format(player.source))
		warn("^1 =================================================================================================")
		warn(("^1 PLAYERS IDENTIFIERS = %s"):format(json.encode(GetPlayerIdentifiers(player.source), { indent = true })))
		warn("^1 =================================================================================================")
		return false
	end

	Bridge.addItem(player.source, PlayerLootQueue[player.source].name, PlayerLootQueue[player.source].amount)
end)

-- #region Debug

if Debug then
	---@diagnostic disable-next-line: missing-parameter
	RegisterCommand("cachedata", function(source)
		local player = Bridge.getPlayer(source)
		print(json.encode(player))
	end)
end

-- #endregion Debug