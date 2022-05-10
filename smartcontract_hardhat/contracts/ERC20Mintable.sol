// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./abstracts/AERC20Pausable.sol";

contract ERC20Mintable is AERC20Pausable {
    event Mint(address indexed account, address indexed receiver, uint256 amount);

    constructor(string memory name_, string memory symbol_, uint8 decimals_) AERC20Pausable(name_, symbol_, decimals_) {}

    function mint(address account, uint256 amount) public virtual onlyOwner {
        _mint(account, amount);

        emit Mint(msg.sender, account, amount);
    }
}