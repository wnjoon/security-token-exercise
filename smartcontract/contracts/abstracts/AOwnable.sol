// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "../interfaces/IOwnable.sol";

abstract contract AOwnable is IOwnable {
    
    address private _owner;

    // _; 라는 문법을 통해서 modifier를 사용하는 function의 body가 그대로 실행됩니다.
    // 아래의 modifier는 transaction을 발생시키는 주체가 계약의 최초 생성자(owner)가 아니면
    // exception을 발생시킵니다.
    modifier onlyOwner() {
        require(_owner == msg.sender, "Caller is not the owner.");
        _;
    }

    constructor() {
        _owner = msg.sender;
    }

    function owner() public view virtual returns (address) {
        return _owner;
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "New owner's address is the zero");
        
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}