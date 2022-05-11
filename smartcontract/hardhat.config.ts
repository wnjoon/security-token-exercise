import "@nomiclabs/hardhat-waffle";
import "@typechain/hardhat";
import "@nomiclabs/hardhat-ganache";


import { HardhatUserConfig } from "hardhat/types"

const config: HardhatUserConfig = {
    defaultNetwork: "hardhat",
    solidity: {
        version: "0.8.10",
    },
    networks: {
        hardhat: {
            blockGasLimit: 10000000,
        },
        ganache: {
            url: "http://localhost:8545",
        }
    }
};

export default config;