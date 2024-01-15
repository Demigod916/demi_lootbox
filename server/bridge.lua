local ox_inventory = exports.ox_inventory

local function getPlayer(src)
    local core = Bridge.core
    if not core then
        print("error: no core found")
        return
    end

    if Bridge.frameWork == "esx" then
        return core.GetPlayerFromId(src)
    elseif Bridge.frameWork == "qb" then
        return core.Functions.GetPlayer(src)
    end
end

function Bridge.getItemCount(src, item)
    if GetResourceState("ox_inventory") == "started" then
        return ox_inventory:GetItemCount(src, item)
    end

    local Player = getPlayer(src)

    if not Player then return end

    if Bridge.frameWork == "esx" then
        local itemData = Player.getInventoryItem(item)
        return (itemData and itemData.count) or 0
    elseif Bridge.frameWork == "qb" then
        local itemData = Player.Functions.GetItemByName(item)
        return (itemData and itemData.amount) or 0
    end
end

function Bridge.removeItem(src, item, amount, slot)
    amount = amount or 1

    if GetResourceState("ox_inventory") == "started" then
        return ox_inventory:RemoveItem(src, item, amount, nil, slot)
    end

    local Player = getPlayer(src)

    if not Player then return end

    local hasEnough = Bridge.getItemCount(src, item) >= amount

    if not hasEnough then return false end

    if Bridge.frameWork == "esx" then
        if hasEnough then
            Player.removeInventoryItem(item, amount)
        end
        return hasEnough
    elseif Bridge.frameWork == "qb" then
        return Player.Functions.RemoveItem(item, amount, slot)
    end
end

function Bridge.giveItem(src, item, amount, metadata, checkWeight)
    local PlayerState = Player(src).state

    if PlayerState.isFishing then
        PlayerState:set("isFishing", false, true)
    end

    if GetResourceState("ox_inventory") == "started" then
        if ox_inventory:CanCarryItem(src, item, amount, metadata) then
            return ox_inventory:AddItem(src, item, amount, metadata)
        else
            local dropId = ox_inventory:CreateDropFromPlayer(src)
            ox_inventory:AddItem(dropId, item, amount, metadata)
        end
    end

    local Player = getPlayer(src)

    if not Player then return end

    if Bridge.frameWork == "esx" then
        if not checkWeight or Player.canCarryItem(item, amount) then
            Player.addInventoryItem(item, amount, metadata or {})
        end
    elseif Bridge.frameWork == "qb" then
        Player.Functions.AddItem(item, amount, false, metadata or {})
    end
end

function Bridge.getitemLabel(item)
    if GetResourceState("ox_inventory") == "started" then
        local item = ox_inventory:Items()[item]
        return (item and item.label) or "ERROR"
    end

    local core = Bridge.core
    if not core then
        print("error: no core found")
        return
    end

    if Bridge.frameWork == "esx" then
        return core.GetItemLabel(item)
    elseif Bridge.frameWork == "qb" then
        if not core.Shared.Items[item] then
            print(string.format('ERROR: the item %s does not exist in shared items', item))
            return
        end
        return core.Shared.Items[item].label
    end
end

function Bridge.RegisterUsableItem(item, cb)
    local core = Bridge.core

    if not core then
        return
    end
    if Bridge.frameWork == "esx" then
        core.RegisterUsableItem(item, cb)
    elseif Bridge.frameWork == "qb" then
        core.Functions.CreateUseableItem(item, cb)
    end
end
