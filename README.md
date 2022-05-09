# Security-token-exercise
Exercise source development of Security token based on ERC-1400 and others

## 1. Network

### 1.1. Ganache

Generate account from ganache using deterministic option (non-change accounts due to pre-defined mnemonic)  
Accounts Information : [account.go](/client/account/account.go)

> Official manual : [ganache-cli - npm](https://www.npmjs.com/package//ganache-cli)

```
Available Accounts
==================
(0) 0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1 (100 ETH)
(1) 0xFFcf8FDEE72ac11b5c542428B35EEF5769C409f0 (100 ETH)
(2) 0x22d491Bde2303f2f43325b2108D26f1eAbA1e32b (100 ETH)

Private Keys
==================
(0) 0x4f3edf983ac636a65a842ce7c78d9aa706d3b113bce9c46f30d7d21715b23b1d
(1) 0x6cbed15c793ce57650b9877cf6fa156fbef513c4e6134f022a85b1ffdd59b2a1
(2) 0x6370fd033278c143179d81c5526140625662b8daa446c22ee2d73db3707e620c

HD Wallet
==================
Mnemonic:      myth like bonus scare over problem client lizard pioneer submit female collect
Base HD Path:  m/44'/60'/0'/0/{account_index}

Gas Price
==================
20000000000

Gas Limit
==================
6721975

Call Gas Limit
==================
9007199254740991
```

### 1.2. [Quorum](/quorum/)

Building Quorum network using 3 nodes based on Raft consensus.  

> <u>3 or 5 nodes is the most common.</u> If you want to scale across more than 3/5/7 nodes you typically just shard the cluster, where each shard runs a completely separate and independent instance of the Raft protocol. If you need to scale for fault tolerance, you will have to relax consistency requirements.

#### 1.2.1. Configuration
- Building a local network based on the [7-nodes example](https://github.com/ConsenSys/quorum-examples).
- Just construct 3 nodes for [Raft consensus](https://raft.github.io/) to be simple.
- Don't use tx manager.
- Port information
   1. quorum_node1_1
      - RPC Port: 22000
      - WS Port: 23000
   2. quorum_node2_1
      - RPC Port: 22001
      - WS Port: 23001
   3. quorum_node3_1
      - RPC Port: 22002
      - WS Port: 23002

#### 1.2.2. Commands
- Start network: ./start.sh
- Stop network: ./stop.sh
- Access to geth of nodes: ./attach.sh ${NODE_ID} 
   - Example: ./attach.sh 1 -> Attach to container "quorum_node1_1"
- Get logs of container: ./log.sh ${NODE_ID}
   - Example: ./log.sh 2 -> Get logs of container "quorum_node2_1"

<br>

## Smart Contracts

Add "@chainsafe/truffle-plugin-abigen" in truffle-config.js -> plugins for "abigen"

```sh
$ cd UniversalToken

# Changed ganache port value in 'truffle-config.js'
# Add ERC20Token, ERC721Token in migrations
$ truffle migrate --network ganache
```

<br>

## Generate .go AbiBinding

[getBindingToken.sh](/UniversalToken/getBindingToken.sh)

1. Migrate smart contract to network
2. Run getBindingToken.sh -> generate .go file of token into [client/contract](/client/contract/) directory
3. Use .go file in client source

<br>

## Client Information

### [account](/client/account/account.go)

- Get Account of network by user's name
- Get Address and PrivateKey of user

### [contract](/client/contract/)

- There are .go files of token made by smart contract using truffle
- **DO NOT MODIFY**

### [network_eth](/client/network_eth/network_eth.go)

- Connect to the Ethereum network and get information of ethereum

### [token](/client/token/)

- Controller and Service of each token made by smart contract using truffle
- Each .go file has individual package using their token name
- All functions (mint, balance, transfer, issue, etc) will be written in this directory

### [util](/client/util/util.go)

- Utilities of client
