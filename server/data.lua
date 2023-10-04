--[[
    if not using ox_inventory, you will need to manually add the inventory image links to the items in this list.
        {
            name = 'WEAPON_PISTOL',
            amount = 1,
            imageUrl = 'https://image.png'
        },

]]

CASES = {
    ['gun_case'] = { -- this index should be the name of the item used if you are triggering this through using an item
        common = {
            {
                name = 'WEAPON_PISTOL',
                amount = 1,
            },
            {
                name = 'WEAPON_SNSPISTOL',
                amount = 1,
            },
            {
                name = 'WEAPON_VINTAGEPISTOL',
                amount = 1,
            },
            {
                name = 'WEAPON_COMBATPISTOL',
                amount = 1,
            }
        },
        uncommon = {
            {
                name = 'WEAPON_HEAVYPISTOL',
                amount = 1,
            },
            {
                name = 'WEAPON_PISTOLXM3',
                amount = 1,
            },
            {
                name = 'WEAPON_DOUBLEACTION',
                amount = 1,
            }
        },
        rare = {
            {
                name = 'WEAPON_APPISTOL',
                amount = 1,
            },
            {
                name = 'WEAPON_MACHINEPISTOL',
                amount = 1,
            },
            {
                name = 'WEAPON_SAWNOFFSHOTGUN',
                amount = 1,
            },
        },
        epic = {
            {
                name = 'WEAPON_COMBATPDW',
                amount = 1,
            },
            {
                name = 'WEAPON_COMPACTRIFLE',
                amount = 1,
            },
            {
                name = 'WEAPON_CARBINERIFLE',
                amount = 1,
            },

        },
        legendary = {
            {
                name = 'WEAPON_RPG',
                amount = 1,
            },
            {
                name = 'WEAPON_DAGGER',
                amount = 1,
            },
            {
                name = 'WEAPON_RAYPISTOL',
                amount = 1,
            },

        },
    }
}


for case, data in pairs(CASES) do
    Bridge.RegisterUsableItem(case, function(src) --register case as a usable item
        if Bridge.removeItem(src, case, 1) then
            local lootPool, winner = GetCaseData(src, case)
            TriggerClientEvent('demi_lootbox:RollCase', src, lootPool, winner)
        end
    end)

    for rarity, items in pairs(data) do --because im lazy and didnt want to add a label to every item
        for i = 1, #items do
            local item = CASES[case][rarity][i]
            CASES[case][rarity][i].label = Bridge.getitemLabel(item.name)
        end
    end
end
