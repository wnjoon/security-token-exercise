#!/bin/bash

echo "- If you pull this code from repository,"
echo "- You must execute this script"
echo "- for generate hardhat deployment environment"

yarn add --dev hardhat typescript ts-node typechain @typechain/hardhat @typechain/ethers-v5
yarn add --dev @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers ethers
yarn add --dev hardhat-deploy dotenv

sleep 2

echo "Create hardhat -> create an empty hardhat.config.js"
yarn hardhat
