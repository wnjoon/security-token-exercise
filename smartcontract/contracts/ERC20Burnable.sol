// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./ERC20Mintable.sol";

contract ERC20Burnable is ERC20Mintable {
    event Burn(address indexed account, address indexed from, uint256 amount);

    constructor(string memory name_, string memory symbol_, uint8 decimals_) ERC20Mintable(name_, symbol_, decimals_) {}

    function burn(uint256 amount) public virtual onlyOwner {
        _burn(msg.sender, amount);

        emit Burn(msg.sender, msg.sender, amount);
    }
}