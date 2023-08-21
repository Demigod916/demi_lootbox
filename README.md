# demi_lootbox - README.md

## Overview

`demi_lootbox` is a FiveM script that brings a CSGO-style case opening user interface into your server. With a visual representation and configurable case contents, this script enhances the in-game economy with randomized loot mechanics.

## Features

- **Customizable Cases:** Define your own cases with varying rarity levels (common, uncommon, rare, epic, legendary).
- **UI:** A UI that gives players a sense of anticipation when opening cases.
- **Dependencies:** ESX or QB or standalone with ox_inventory

## Installation

1. Ensure you have the `ox_inventory` installed and properly configured in your FiveM server.
2. Copy the `demi_lootbox` folder into your server's resources directory.
3. Add `ensure demi_lootbox` to your server configuration file.

## Configuration

The primary configuration for your cases is done within the `CASES` table found in `server/data.lua` Here, you can define your own cases with varying rarity levels and the weapons/items each rarity level might contain.

each rarity should have at least 1 item in it, or the script wont work properly.

Example:

```lua
CASES = {
    ['weapon_case'] = {
        common = {
            {
                name = 'WEAPON_PISTOL',
                amount = 1,
            },
            ...
        },
        ...
    }
}
```

## Usage

To test a case:
```
/opencase [case_name]
```
Replace `[case_name]` with the actual name of the case you want to open (for instance, `weapon_case`).

ideally you would remove this command before putting it in your server

## Exported Functions
You can use the exported function to open a case programmatically through an item use or something:

```lua
exports.demi_lootbox.openCase(caseName)
```


## Probabilities
for those curious about the chances

- Common: 80%
- Uncommon: 16%
- Rare: 3.10%
- Epic: 0.64%
- Legendary: 0.26%

## Client-Side Functions

- `getWinnerForCase(case)`: A function to get the winning item for a specific case.
- Command `/opencase`: To open a specified case.
- NUI Callback for when the case opening animation finishes.

## Feedback & Support

For any feedback or support regarding the script, please reach out in the forums or discord `demiautomatic`.

