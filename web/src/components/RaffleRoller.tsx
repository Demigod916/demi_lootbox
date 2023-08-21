import React, { useEffect, useRef, useState } from "react";
import styles from "./modules/RaffleRoller.module.css";

import RaffleItem from "./RaffleItem";

export type Loot = {
  name: string;
  label?: string;
  imageUrl?: string;
  rarity?: string;
};

export type LootPool = Loot[];

const getRandomVariance = (winner: number) => {
  let coin = Math.random();
  winner++;
  if (coin > 0.5) {
    return winner + Math.floor(Math.random() * 7);
  } else {
    return winner - Math.floor(Math.random() * 7);
  }
};

type RaffleRollerProps = {
  pool: LootPool;
  winner: number;
};

const RaffleRoller: React.FC<RaffleRollerProps> = ({ pool, winner }) => {

  const [variance, setVariance] = useState(getRandomVariance(winner));

  useEffect(() => {
    setVariance(getRandomVariance(winner));
  }, [winner]);

  return (
    <>
      <div className={styles.container}>
        <div
          style={{
            transition:
              winner === 0
                ? "none"
                : "translate cubic-bezier(0.23, 1, 0.32, 1) 7s",
            translate:
              winner === 0
                ? "0rem"
                : `calc(-${(winner + 1) * 15}rem - ${
                    winner === 0 ? winner : variance
                  }rem)`,
          }}
          id="roller"
          className={styles.roller}
        >
          {pool.map((item, i) => {
            return <RaffleItem item={item} key={"raffle-item-" + i} />;
          })}
        </div>
        <div className={styles.filter}></div>
        <div className={styles.filter}></div>
        <div className={styles.currentItemMarker}></div>
      </div>
    </>
  );
};

export default RaffleRoller;
