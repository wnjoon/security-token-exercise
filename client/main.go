package main

import (
	"fmt"

	acc "github.com/security-token-exercise/client/account"
	net "github.com/security-token-exercise/client/network_eth"
	"github.com/security-token-exercise/client/token/erc20controller"
)

func main() {
	client := net.Connect("ganache")

	user1 := acc.GetUser("user1")
	// Get Eth balance of account
	ethBalance := net.GetEthBalance(client, user1.Address)
	fmt.Println(ethBalance)

	/*
	 * ERC20
	 */
	erc20 := erc20controller.GetContract_erc20(client)
	// Get Total Supply of ERC20
	erc20TotalSupply := erc20controller.GetTotalSupply_erc20(erc20)
	fmt.Println(erc20TotalSupply)

	// Get ERC20 token balance of account
	erc20Balance := erc20controller.GetBalance_erc20(erc20, user1.Address)
	fmt.Println(erc20Balance)

	// _ = client // we'll use this in the upcoming sections
}
