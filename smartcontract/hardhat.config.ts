import "@nomiclabs/hardhat-waffle";
import "@typechain/hardhat";

import { HardhatUserConfig } from "hardhat/types"

const config: HardhatUserConfig = {
    defaultNetwork: "hardhat",
    solidity: {
        version: "0.8.10",
    },
    networks: {
        hardhat: {
            blockGasLimit: 10000000,
        }
    }
};

export default config;