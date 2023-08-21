Bridge = {}

local frameWork = GetResourceState("es_extended") == "started" and "esx" or GetResourceState("qb-core") == "started" and "qb" or GetResourceState("ox_core") == "started" and "ox"

local core = (Bridge.frameWork == "esx" and exports["es_extended"]:getSharedObject()) or (Bridge.frameWork == "qb" and exports["qb-core"]:GetCoreObject()) or (Bridge.frameWork == "awdawd" and assert(load(LoadResourceFile("ox_core", "imports/server.lua"), "@@ox_core/imports/server.lua"))())

local ox_inventory = exports.ox_inventory

local POOL_SIZE = 100

local function tableConcat(t1, t2)
	for i = 1, #t2 do
		t1[#t1 + 1] = t2[i]
	end
	return t1
end

local function shuffle(tbl)
	for i = #tbl, 2, -1 do
		local j = math.random(i)
		tbl[i], tbl[j] = tbl[j], tbl[i]
	end
	return tbl
end

local function getPlayer(src)
	if not core then return end

	if frameWork == "esx" then
		return core.GetPlayerFromId(src)
	elseif frameWork == "qb" then
		return core.Functions.GetPlayer(src)
	elseif frameWork == "ox" then
		return core.GetPlayer(src)
	end
end

local function giveItem(src, item, amount, metadata)
	if GetResourceState("ox_inventory") == "started" then
		if ox_inventory:CanCarryItem(src, item, amount, metadata) then
			return ox_inventory:AddItem(src, item, amount, metadata)
		else
			local dropId = ox_inventory:CreateDropFromPlayer(src)
			ox_inventory:AddItem(dropId, item, amount, metadata)
		end
		return
	end

	local Player = getPlayer(src)

	if not Player then return end

	if frameWork == "esx" then
		Player.addInventoryItem(item, amount, metadata or {})
	elseif frameWork == "qb" then
		Player.Functions.AddItem(item, amount, false, metadata or {})
	elseif frameWork == "ox" then
		ox_inventory:AddItem(item, amount, metadata or {})
	end
end

local function generateLootPoolFromCase(case)
	local pool = {}
	local desiredCounts = {
		common = 80,
		uncommon = 16,
		rare = 3,
		epic = 0,
		legendary = 0,
	}

	local rnJesus = math.random(100)

	if rnJesus > 74 then
		desiredCounts.legendary += 1
	elseif rnJesus > 10 then
		desiredCounts.epic += 1
	else
		desiredCounts.rare += 1
	end

	for i = 1, POOL_SIZE do
		local rarity = next(desiredCounts)

		if not rarity then break end

		pool[i] = case[rarity][math.random(#case[rarity])]
		pool[i].rarity = rarity

		desiredCounts[rarity] -= 1
		if desiredCounts[rarity] <= 0 then
			desiredCounts[rarity] = nil
		end
	end

	shuffle(pool)

	pool = tableConcat(pool, pool)

	return pool
end

local playerLootQueue = {}

lib.callback.register("demi_lootbox:getCaseAndWinner", function(source, caseIndex)
	local case = CASES[caseIndex]

	if not case then return end

	local lootPool = generateLootPoolFromCase(case)
	local winner = (math.random(#lootPool - POOL_SIZE) + POOL_SIZE)
	playerLootQueue[source] = lootPool[winner]

	return lootPool, winner - 1
end)

RegisterNetEvent("demi_lootbox:getQueuedItem", function()
	local source = source
	if not playerLootQueue[source] then
		print("^1 ==================================================================================================")
		print(("^1 [WARNING]: POSSIBLE CHEATER. Player Source %s triggered lootbox get item event while not in queue"):format(source))
		print("^1 =================================================================================================")
		print(("^1 PLAYERS IDENTIFIERS = %s"):format(json.encode(GetPlayerIdentifiers(source), { indent = true })))
		print("^1 =================================================================================================")
		return
	end
	giveItem(source, playerLootQueue[source].name, playerLootQueue[source].amount)
end)