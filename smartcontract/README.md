# Smartcontract

This repository describes tokens based on ERC-20, 721 and 1400.  
Security Token is generally created by ERC1400, however, I focus on various business using different tokens.

## Hardhat

Test smartcontract using [hardhat](https://hardhat.org/tutorial/testing-contracts.html).  
Before using hardhat, You must [install hardhat](https://hardhat.org/tutorial/setting-up-the-environment.html#macos-2) with dependencies such as yarn, npx, etc.

### 1. [init.sh](/smartcontract/init.sh)

```sh
...
yarn add --dev hardhat typescript ts-node typechain @typechain/hardhat @typechain/ethers-v5
yarn add --dev @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers ethers
...
```

In this repository, all files including config and tests are generated by typescript(.ts). So, we will change config file from .js to .ts in init.sh.

### 2. [compile.sh](/smartcontract/compile.sh)

Compile generated contracts using hardhat.

### 3. [test.sh](/smartcontract/test.sh)

> TODO: Should be written with branches

```sh
$ yarn hardhat test ./test/{TESTFILE}
# yarn hardhat test ./test/ERC20.test.ts
```

