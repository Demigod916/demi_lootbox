# demi_lootbox - README.md

## Overview

`demi_lootbox` is a FiveM script that brings a CSGO-style case opening user interface into your server. With a visual representation and configurable case contents, this script enhances the in-game economy with randomized loot mechanics.

## Features

- **Customizable Cases:** Define your own cases with varying rarity levels (common, uncommon, rare, epic, legendary).
- **UI:** A UI that gives players a sense of anticipation when opening cases.

## Dependecies

- ESX, QB, or standalone with ox_inventory.

## Installation

1. Copy the `demi_lootbox` folder into your server's resources directory.
2. Add `ensure demi_lootbox` to your server configuration file.

## Configuration

The primary configuration for your cases is done within the `CASES` table found in `server/data.lua` Here, you can define your own cases with varying rarity levels and the weapons/items each rarity level might contain.

each rarity should have at least 1 item in it, or the script wont work properly.

Example:

```lua
CASES = {
    ['gun_case'] = {
        common = {
            {
                name = 'WEAPON_PISTOL',
                amount = 1,
            },
            {
                name = 'WEAPON_SNSPISTOL',
                amount = 1,
            },
        },
        uncommon = {
            {
                name = 'WEAPON_HEAVYPISTOL',
                amount = 1,
            },
        },
        rare = {
            {
                name = 'WEAPON_APPISTOL',
                amount = 1,
            },
        },
        epic = {
            {
                name = 'WEAPON_COMBATPDW',
                amount = 1,
            },

        },
        legendary = {
            {
                name = 'WEAPON_RPG',
                amount = 1,
            },
        },
    }
}
```

## Exported Functions (server)

### addNewLootBox

You can use the exported function to open a case programmatically through an item use or something:

```lua
exports.demi_lootbox:addNewLootBox(caseName, caseContents, cb)
```

the cb function will run before the case is opened

**Example:**

```lua
		exports.demi_lootbox:addNewLootBox('fishing_chest_money', {
			common = {
				{
					name = 'money',
					amount = 500
				}
			},
			uncommon = {
				{
					name = 'money',
					amount = 2500
				}
			},
			rare = {
				{
					name = 'money',
					amount = 5000
				}
			},
			epic = {
				{
					name = 'money',
					amount = 7500
				}
			},
			legendary = {
				{
					name = 'money',
					amount = 10000
				}
			},
		}, function(src)
			TriggerClientEvent('rb-fishing:chestScene', src)
		end)
```

## Probabilities

for those curious about the chances

- Common: 80%
- Uncommon: 16%
- Rare: 3.10%
- Epic: 0.64%
- Legendary: 0.26%

## Feedback & Support

For any feedback or support regarding the script, please reach out in the forums or discord `demiautomatic`.
