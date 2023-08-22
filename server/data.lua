local ITEMS = exports.ox_inventory:Items() --store all inventory items

CASES = {
    ['weapon_case'] = {
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

--because im lazy and didnt want to add a label to every item
for case, data in pairs(CASES) do
    for rarity, items in pairs(data) do
        for i = 1, #items do
            local item = CASES[case][rarity][i]
            CASES[case][rarity][i].label = ITEMS[item.name].label
        end
    end
end
