// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./AERC20Extendable.sol";
import "./APausable.sol";

abstract contract AERC20Pausable is AERC20Extendable, APausable {
    constructor(string memory name_, string memory symbol_, uint8 decimals_) AERC20Extendable(name_, symbol_, decimals_) APausable() {}

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        require(!paused(), "contract is paused.");
    }

    function _afterTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        
    }
}