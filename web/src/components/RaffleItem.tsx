import React, { useState } from "react";
import styles from "./modules/RaffleItem.module.css";
import { Loot } from "./RaffleRoller";

const gradientMap: { [index: string]: string } = {
  ["common"]: "rgba(75,105,255,0.4)",
  ["uncommon"]: "rgba(136,71,255,0.4)",
  ["rare"]: "rgba(211,46,230,0.4)",
  ["epic"]: "rgba(235,75,75,0.4)",
  ["legendary"]: "rgba(255,215,0,0.4)",
};

type RaffleItemProps = {
  item: Loot;
  inventory?: boolean;
};

function getItemIMG(name: string) {
  return "https://cfx-nui-ox_inventory/web/images/" + name + ".png";
}

const RaffleItem: React.FC<RaffleItemProps> = ({ item, inventory }) => {
  return (
    <>
      <div
        className={styles.item}
      >
        <div
          className={styles.itemImage}
          style={{
            backgroundImage: `url(${item.imageUrl || getItemIMG(item.name)})`,
          }}
        ></div>
        <div
          style={{ fontSize: inventory ? "0.8rem" : "1.05rem" }}
          className={styles.label}
        >
          {item.label || item.name}
        </div>
        <div
          className={styles.rarityGlow}
          style={{
            background: `linear-gradient(0deg, ${
              gradientMap[(item?.rarity && item.rarity) || "common"]
            } 0%, rgb(0,0,0,0) 40%)`,
          }}
        ></div>
      </div>
    </>
  );
};

export default RaffleItem;
