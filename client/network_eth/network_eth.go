package network_eth

import (
	"context"
	"fmt"
	"math/big"

	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/ethclient"
	util "github.com/security-token-exercise/client/util"
)

func Connect(networkType string) *ethclient.Client {
	client, err := ethclient.Dial(getNetworkPath(networkType))
	util.Perror(err)
	fmt.Println("connected to", networkType, "->", getNetworkPath(networkType))
	return client
}

func getNetworkPath(networkType string) string {
	if networkType == "ganache" {
		return "http://localhost:8545"
	}
	return "http://localhost:7545"
}

func GetEthBalance(client *ethclient.Client, _account string) *big.Int {
	account := common.HexToAddress(_account)
	balance, err := client.BalanceAt(context.Background(), account, nil)
	util.Perror(err)
	return balance
}
