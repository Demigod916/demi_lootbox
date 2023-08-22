local Inventory = exports.ox_inventory

if GetResourceState("es_extended"):find("start") then
	local ESX = exports["es_extended"]:getSharedObject()

	function Bridge.getPlayer(source)
		return ESX.GetPlayerFromId(source)
	end

	function Bridge.addItem(source, item, amount, metadata)
		local player = Bridge.getPlayer(source)
		if not player then
			return print("^1[Error]: Invalid player source in Bridge.addItem()")
		end

		if type(item) ~= "string" or type(amount) ~= "number" or amount <= 0 then
			return print("^1[Error]: Invalid item or amount in Bridge.addItem()")
		end

		if GetResourceState("ox_inventory"):find("start") then
			if Inventory:CanCarryItem(player.source, item, amount, metadata) then
				local success = Inventory:AddItem(player.source, item, amount, metadata)
				if success then
					print(("^2[Info]: Item added successfully to player source %s inventory"):format(player.source))
				else
					print(("^1[Error]: Item couldn't be added to player %s inventory"):format(player.source))
				end

				return success
			end
		else
			player.addInventoryItem(item, amount, metadata or {})
		end
	end
elseif GetResourceState("qb-core"):find("start") then
	local QBCore = exports["qb-core"]:GetCoreObject()

	function Bridge.getPlayer(source)
		return QBCore.Functions.GetPlayer(source)
	end

	function Bridge.addItem(source, item, amount, metadata)
		local player = Bridge.getPlayer(source)
		if not player then
			return print("^1[Error]: Invalid player source in Bridge.addItem()")
		end

		if type(item) ~= "string" or type(amount) ~= "number" or amount <= 0 then
			return print("^1[Error]: Invalid item or amount in Bridge.addItem()")
		end

		if GetResourceState("ox_inventory"):find("start") then
			if Inventory:CanCarryItem(player.source, item, amount, metadata) then
				local success = Inventory:AddItem(player.source, item, amount, metadata)
				if success then
					print(("^2[Info]: Item added successfully to player source %s inventory"):format(player.source))
				else
					print(("^1[Error]: Item couldn't be added to player %s inventory"):format(player.source))
				end

				return success
			end
		else
			player.Functions.AddItem(item, amount, false, metadata or {})
		end
	end
elseif GetResourceState("ox_core"):find("start") then
	assert(load(LoadResourceFile("ox_core", "imports/server.lua"), "@@ox_core/imports/server.lua"))()

	function Bridge.getPlayer(source)
		return Ox.GetPlayer(source)
	end

	function Bridge.addItem(source, item, amount, metadata)
		local player = Bridge.getPlayer(source)
		if not player then
			return print("^1[Error]: Invalid player source in Bridge.addItem()")
		end

		if type(item) ~= "string" or type(amount) ~= "number" or amount <= 0 then
			return print("^1[Error]: Invalid item or amount in Bridge.addItem()")
		end

		if GetResourceState("ox_inventory"):find("start") then
			if Inventory:CanCarryItem(player.source, item, amount, metadata) then
				local success = Inventory:AddItem(player.source, item, amount, metadata)
				if success then
					print(("^2[Info]: Item added successfully to player source %s inventory"):format(player.source))
				else
					print(("^1[Error]: Item couldn't be added to player %s inventory"):format(player.source))
				end

				return success
			end
		end
	end
end