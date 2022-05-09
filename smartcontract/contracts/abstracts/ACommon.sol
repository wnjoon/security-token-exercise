// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

abstract contract ACommon {
    function errorMsg(string memory contractName, string memorty functionName, string memory msg) public virtual returns(string) {
        return "[ERROR][" + contractName + "][" + functionName + "]" + msg;
    }
}