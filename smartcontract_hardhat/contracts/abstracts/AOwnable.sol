// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "../interfaces/IOwnable.sol";

abstract contract AOwnable is IOwnable {
    address private _owner;

    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not the owner.");
        _;
    }

    constructor() {
        _owner = msg.sender;
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}