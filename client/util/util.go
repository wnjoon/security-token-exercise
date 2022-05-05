package util

import (
	"errors"
	"log"
	"os"

	"github.com/ethereum/go-ethereum/common"
	"github.com/joho/godotenv"
)

func Perror(err error) {
	if err != nil {
		log.Fatal("[ERROR] ", err)
	}
}

func GetContractAddress(name string) common.Address {
	err := godotenv.Load(".env")
	Perror(err)
	address, isExist := os.LookupEnv(name)
	if !isExist {
		Perror(errors.New("There is no address :" + name))
	}
	return common.HexToAddress(address)
}
