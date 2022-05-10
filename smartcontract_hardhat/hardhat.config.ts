import "dotenv/config";
import "@typechain/hardhat";
import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-waffle";

import "hardhat-deploy";

import { HardhatUserConfig } from "hardhat/types";

const config: HardhatUserConfig = {
  solidity: "0.8.10",
  namedAccounts: {
    user1: 0,
    user2: 1,
  },
  networks: {
    hardhat: {
      gasPrice: 20000000000,
      gas: 6000000,
    },
    // mainnet: {
    //   url: `https://mainnet.infura.io/v3/${process.env.INFURA_API_KEY}`,
    //   accounts: [process.env.ADMIN || "", process.env.DEPOSITOR || ""],
    //   chainId: 1,
    // },
    // ropsten: {
    //   url: `https://ropsten.infura.io/v3/${process.env.INFURA_API_KEY}`,
    //   accounts: [process.env.ADMIN || "", process.env.DEPOSITOR || ""],
    //   chainId: 3,
    // },
  },
  // etherscan: {
  //   apiKey: process.env.ETHERSCAN_API_KEY,
  // },
};

export default config;