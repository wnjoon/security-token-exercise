package erc20controller

import (
	"math/big"

	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/ethclient"
	"github.com/security-token-exercise/client/account"
	"github.com/security-token-exercise/client/contract/erc20"
	"github.com/security-token-exercise/client/util"
)

// Return contract instance (ERC20)
func GetContract_erc20(client *ethclient.Client) *erc20.Erc20 {
	tokenAddress := util.GetContractAddress("ERC20ADDRESS")
	instance, err := erc20.NewErc20(tokenAddress, client)
	util.Perror(err)
	return instance
}

// Return ERC20 balance of user
func GetBalance_erc20(instance *erc20.Erc20, _address string) *big.Int {
	address := common.HexToAddress(_address)
	bal, err := instance.BalanceOf(&bind.CallOpts{}, address)
	util.Perror(err)
	return bal
}

// Return Total Supply of Token (ERC20)
func GetTotalSupply_erc20(instance *erc20.Erc20) *big.Int {
	bal, err := instance.TotalSupply(&bind.CallOpts{})
	util.Perror(err)
	return bal
}

// Mint Token (ERC20)
func Mint_erc20(client *ethclient.Client, instance *erc20.Erc20, from *account.User, to *account.User, amount *big.Int) {

	// // Get PrivateKey
	// privateKey, err := crypto.HexToECDSA(from.PrivateKey)
	// util.Perror(err)

	// // Get PublicKey from PrivateKey
	// publicKey := privateKey.Public()
	// publicKeyECDSA, ok := publicKey.(*ecdsa.PublicKey)
	// if !ok {
	// 	log.Fatal("cannot assert type: publicKey is not of type *ecdsa.PublicKey")
	// }

	// // Get Address of from(Caller)
	// fromAddress := crypto.PubkeyToAddress(*publicKeyECDSA)

	// // Get Nonce [TODO : SPLIT]
	// nonce, err := client.PendingNonceAt(context.Background(), fromAddress)
	// util.Perror(err)

	// // Allocate Gas Price [TODO : SPLIT]
	// value := big.NewInt(0)
	// gasPrice, err := client.SuggestGasPrice(context.Background())
	// util.Perror(err)

}
