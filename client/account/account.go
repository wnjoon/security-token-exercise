package account

import (
	"errors"
	"log"
)

type User struct {
	Address    string
	PrivateKey string
}

var userList = map[string]*User{}

// Init user map
// Generated in Ganache by deterministic -> Non-changable address
func init() {
	userList["user0"] = &User{
		Address:    "0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1",
		PrivateKey: "0x4f3edf983ac636a65a842ce7c78d9aa706d3b113bce9c46f30d7d21715b23b1d",
	}
	userList["user1"] = &User{
		Address:    "0xFFcf8FDEE72ac11b5c542428B35EEF5769C409f0",
		PrivateKey: "0x6cbed15c793ce57650b9877cf6fa156fbef513c4e6134f022a85b1ffdd59b2a1",
	}
	userList["user2"] = &User{
		Address:    "0x22d491Bde2303f2f43325b2108D26f1eAbA1e32b",
		PrivateKey: "0x6370fd033278c143179d81c5526140625662b8daa446c22ee2d73db3707e620c",
	}
}

func getUserInfo(name string) (*User, error) {
	if user := userList[name]; user != nil {
		return user, nil
	}
	return nil, errors.New("There is no user name" + name)
}

// Get User Address
func GetAddress(name string) (string, error) {
	if user := userList[name]; user != nil {
		return user.Address, nil
	}
	return "", errors.New("Address Error in" + name)
}

// Get User PrivateKey
func GetPrivateKey(name string) (string, error) {
	if user := userList[name]; user != nil {
		return user.PrivateKey, nil
	}
	return "", errors.New("PrivateKey Error in" + name)
}

// Get User
func GetUser(name string) *User {
	user, err := getUserInfo(name)
	if err != nil {
		log.Fatal(err)
	}
	return user
}
