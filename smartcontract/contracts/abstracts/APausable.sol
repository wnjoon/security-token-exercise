// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "../interfaces/IPausable.sol";
import "./AOwnable.sol";

abstract contract APausable is IPausable, AOwnable {
    bool private _paused;

    modifier whenNotPaused() {
        require(!_paused, "contract paused.");
        _;
    }

    constructor() AOwnable() {
    }

    function paused() public view virtual returns (bool) {
        return _paused;
    }

    function pause() public virtual onlyOwner {
        _paused = true;
        emit Paused(msg.sender);
    }

    function unPause() public virtual onlyOwner {
        _paused = false;
        emit UnPaused(msg.sender);
    }
}