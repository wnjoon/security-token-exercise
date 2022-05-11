// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./AERC20.sol";

abstract contract AERC20Extendable is AERC20 {
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual;
    function _afterTokenTransfer(address from, address to, uint256 amount) internal virtual;

    constructor(string memory name_, string memory symbol_, uint8 decimals_) AERC20(name_, symbol_, decimals_) {

    }

    function _transfer(address from, address to, uint256 amount) internal virtual override {
        _beforeTokenTransfer(from, to, amount);
        super._transfer(from, to, amount);
        _afterTokenTransfer(from, to, amount);
    }

    function _mint(address account, uint256 amount) internal virtual override {
        _beforeTokenTransfer(address(0), account, amount);
        super._mint(account, amount);
        _afterTokenTransfer(address(0), account, amount);
    }

    function _burn(address account, uint256 amount) internal virtual override {
        _beforeTokenTransfer(account, address(0), amount);
        super._burn(account, amount);
        _afterTokenTransfer(account, address(0), amount);
    }
}