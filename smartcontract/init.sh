#!/bin/bash

echo "- If you pull this repository from git,"
echo "- You must execute this script"
echo "- for generate hardhat deployment environment"

OPTION=$1

if [ $OPTION == "reset" ]; then
    rm -Rf artifacts
    rm -Rf cache
    rm -Rf typechain-types
    rm -Rf node_modules
    rm yarn.lock
    yarn add --dev hardhat typescript ts-node typechain @typechain/hardhat @typechain/ethers-v5
    yarn add --dev @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers ethers
    # yarn add --dev hardhat-deploy dotenv
fi

sleep 2

npm install 

sleep 2

if [ ! -f hardhat.config.ts ]; then
    echo "Create hardhat -> create an empty hardhat.config.js"
    yarn hardhat
    echo "Change hardhat.config.js -> hardhat.config.ts"
    cp env/hardhat.config.ts.backup .
    mv hardhat.config.ts.backup hardhat.config.ts
fi

