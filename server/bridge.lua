Bridge = {}
Bridge.frameWork = ((GetResourceState("es_extended") == "started" and "esx") or ((GetResourceState("qb-core") == "started" or GetResourceState("qbx-core") == "started") and "qb"))
Bridge.core = ((Bridge.frameWork == "esx" and exports["es_extended"]:getSharedObject()) or (Bridge.frameWork == "qb" and exports["qb-core"]:GetCoreObject()))

local ox_inventory = exports.ox_inventory

local function getPlayer(src)
    if not core then return end

    if frameWork == "esx" then
        return core.GetPlayerFromId(src)
    elseif frameWork == "qb" then
        return core.Functions.GetPlayer(src)
    end
end

function Bridge.GiveItem(src, item, amount, metadata)
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
    end
end
