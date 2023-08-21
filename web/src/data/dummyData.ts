import { LootPool } from "../components/RaffleRoller";

const examplecase: { [index: string]: LootPool } = {
  ["common"]: [
    {
      name: "SG 553 | Aerial",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_sg556_cu_sg553_aerial_light_large.a123874095a96a92aaacd0f64a4fef54fa455e82.png",
    },
    {
      name: "PP-Bizon | Harvester",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_bizon_gs_pp_bizon_harvester_light_large.654d26d43d7e4583a0ede5e0ea6bb697858698dc.png",
    },
    {
      name: "Nova | Exo",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_nova_aq_nova_sci_fi_light_large.9cf268816cad5bdbe33bd4d1ddce1eb81f905164.png",
    },
    {
      name: "MAC-10 | Carnivore",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_mac10_aq_mac_10_alien_camo_light_large.59e0dec2e627e9ee3bf595f7fdf0cfb23f8c79f0.png",
    },
    {
      name: "P250 | Iron Clad",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_p250_gs_p250_metal_panels_light_large.a104ce12e50fa24711708782e5d7b23e1bcb7d1b.png",
    },
    {
      name: "Tec-9 | Ice Cap",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_tec9_am_tec_9_sea_salt_light_large.726f78fd872aa2ccfcab9a051b4b79c314d50a4e.png",
    },
    {
      name: "Five-SeveN | Violent Daimyo",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_fiveseven_cu_five_seven_daimyo_light_large.d394398cae1977546887145dcf6a4892d2ed29aa.png",
    },
  ],
  ["uncommon"]: [
    {
      name: "Sawed-Off | Limelight",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_sawedoff_cu_sawed_off_lime_light_large.87fbbe1597ea04a51b56f3b0f7c3fc6a5ff6553c.png",
    },
    {
      name: "P90 | Chopper",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_p90_gs_p90_full_throttle_light_large.70ef68d70617eb318e2df05e09f780448a1baf0d.png",
    },
    {
      name: "AUG | Aristocrat",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_aug_gs_aug_aristocrat_light_large.4004dbb20c03d1a210ff9a98968ddb251bdfddc6.png",
    },
    {
      name: "R8 Revolver | Reboot",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_revolver_cu_r8_cybersport_light_large.d5eb827f99a401915b8377eda7b81a0bc9cae4bf.png",
    },
    {
      name: "AWP | Phobos",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_awp_gs_awp_phobos_light_large.fca961cc99c704f09c44e6e82378434ef0e22087.png",
    },
  ],
  ["rare"]: [
    {
      name: "P2000 | Imperial Dragon",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_hkp2000_gs_p2000_imperial_dragon_light_large.cc82bc6353a0e8ce963f6b0b600905d4dc37bf4a.png",
    },
    {
      name: "SCAR-20 | Bloodsport",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_scar20_gs_scar20_bloodsport_light_large.dd99feccb31d2ec296bcd620abd885e6fe50d44e.png",
    },

    {
      name: "M4A4 | Desolate Space",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_m4a1_cu_m4a4_desolate_space_light_large.1fcbd5e124ae7c54cf12e6f76c431e6671a73845.png",
    },
  ],
  ["epic"]: [
    {
      name: "Glock-18 | Wasteland Rebel",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_glock_cu_glock_wasteland_rebel_light_large.284899ab35e5a29c6edb64b2af194cee19a0ed89.png",
    },
    {
      name: "M4A1-S | Mecha Industries",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_m4a1_silencer_gs_m4a1_mecha_industries_light_large.2973cf5ca9d1592d6652bf14ac89bcd8593d4f0a.png",
    },
  ],
  ["legendary"]: [
    {
      name: "Bayonet | Lore",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_bayonet_cu_bayonet_lore_light_large.372c7e0ec654f3be5d53e87cbbac3ab160c8c76e.png",
    },
    {
      name: "M9 Bayonet | Gamma Doppler",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_knife_m9_bayonet_am_gamma_doppler_phase1_light_large.4980cb2bb09e19a48a04ae19a0e6353426e81cce.png",
    },
    {
      name: "Gut Knife | Autotronic",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_knife_gut_gs_gut_autotronic_light_large.160e79d868da6ebb84c52e835aaf24ab9c6334f1.png",
    },
    {
      name: "Karambit | Gamma Doppler",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_knife_karambit_am_gamma_doppler_phase1_light_large.769cf2ab676ea2a7d7322c258f57bac8dca00336.png",
    },
    {
      name: "Flip Knife | Bright Water",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_knife_flip_hy_ocean_knife_light_large.6d35f9bc8d0ab2da7112155cf37ef782e542ef31.png",
    },
    {
      name: "Bayonet | Freehand",

      imageUrl:
        "http://media.steampowered.com/apps/730/icons/econ/default_generated/weapon_bayonet_am_marked_up_light_large.c2a4dbca9338c1a5ffaa246715696f92168a49bc.png",
    },
  ],
};

function shuffle(array: LootPool) {
  let currentIndex = array.length,
    randomIndex;

  // While there remain elements to shuffle.
  while (currentIndex != 0) {
    // Pick a remaining element.
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex--;

    // And swap it with the current element.
    [array[currentIndex], array[randomIndex]] = [
      array[randomIndex],
      array[currentIndex],
    ];
  }

  return array;
}

export const genDummyLoot = () => {
  let dummyLoot: LootPool = [];
  let common = 80;
  let uncommon = 16;
  let rare = 3;
  let epic = 0;
  let legendary = 0;

  let rand = Math.random();

  if (rand <= 0.64) {
    epic++;
  } else if (rand <= 0.64 + 0.26) {
    legendary++;
  } else {
    rare++;
  }

  for (let i = 0; i < 100; i++) {
    let rarity = "";

    if (common > 0) {
      rarity = "common";
      common--;
    } else if (uncommon > 0) {
      rarity = "uncommon";
      uncommon--;
    } else if (rare > 0) {
      rarity = "rare";
      rare--;
    } else if (epic > 0) {
      rarity = "epic";
      epic--;
    } else if (legendary > 0) {
      rarity = "legendary";
      legendary--;
    }

    let index =
      dummyLoot.push(
        examplecase[rarity][
          Math.floor(Math.random() * (examplecase[rarity].length - 1))
        ]
      ) - 1;

    dummyLoot[index].rarity = rarity;
  }

  shuffle(dummyLoot);

  dummyLoot = [...dummyLoot, ...dummyLoot];

  return dummyLoot
};
