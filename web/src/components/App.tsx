import React, { useEffect, useRef, useState } from "react";
import { debugData } from "../utils/debugData";
import { fetchNui } from "../utils/fetchNui";
import styles from "./modules/App.module.css";
import RaffleRoller from "./RaffleRoller";
import { genDummyLoot } from "../data/dummyData";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { LootPool } from "./RaffleRoller";
import { isEnvBrowser } from "../utils/misc";
import rouletteAudio from "../assets/roulette.mp3";
import RaffleItem from "./RaffleItem";

// This will set the NUI to visible if we are
// developing in browser
debugData([
  {
    action: "setVisible",
    data: true,
  },
]);

type ClientLootData = {
  pool: LootPool;
  winner: number;
};

const App: React.FC = () => {
  const [isRolling, setIsRolling] = useState<boolean>(false);
  const [lootData, setLootData] = useState<ClientLootData>({
    pool: isEnvBrowser() ? genDummyLoot() : [],
    winner: 0,
  });

  const [inventory, setInventory] = useState<LootPool>([]);
  const audioRef = useRef(new Audio(rouletteAudio));
  const isBrowserEnv = isEnvBrowser();

  const clearLoot = () => {
    setLootData({
      pool: [],
      winner: 0,
    });
  };

  const roll = (data: ClientLootData) => {
    setIsRolling(true);
    clearLoot();

    setTimeout(() => {
      if (isBrowserEnv) {
        setInventory((lastInv) => [data.pool[data.winner], ...lastInv]);
      }
      setIsRolling(false);
      fetchNui("finished");
    }, 9000);

    setTimeout(() => {
      setLootData(data);
      audioRef.current.play();
    }, 500);
  };

  useNuiEvent<ClientLootData>("setLootData", (data) => {
    if (isRolling) return;
    roll(data);
  });

  const backgroundStyle = isBrowserEnv
    ? { background: "grey" }
    : { background: "none" };

  return (
    <div style={backgroundStyle} className={styles.container}>
      {isBrowserEnv && (
        <div className={styles.inventory}>
          {inventory.map((item, i) => (
            <RaffleItem item={item} key={"inventory-item-" + i} inventory />
          ))}
        </div>
      )}
      {isRolling ? (
        <RaffleRoller pool={lootData.pool} winner={lootData.winner} />
      ) : (
        isBrowserEnv && (
          <button
            onClick={() =>
              roll({
                pool: genDummyLoot(),
                winner: Math.floor(Math.random() * 100) + 100,
              })
            }
            className={styles.rollButton}
          >
            ROLL
          </button>
        )
      )}
    </div>
  );
};

export default App;
