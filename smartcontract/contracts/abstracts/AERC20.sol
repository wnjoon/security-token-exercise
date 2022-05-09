// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "../interfaces/IERC20.sol";

abstract contract AERC20 is IERC20 {
    string  private _name;
    string  private _symbol;
    uint8   private _decimals;
    uint256 private _totalSupply;

    using SafeMath for uint256

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    constructor(string memory name_, string memory symbol_, uint8 decimals_) {
        _name = name_;
        _symbol = symbol_;
        _decimals = decimals_;
    }

    // Getter
    function name() public view virtual returns (string memory) {
        return _name;
    }

    function symbol() public view virtual returns (string memory) {
        return _symbol;
    }

    function decimals() public view virtual returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view virtual returns (uint256) {
        return _totalSupply;
    }

    // Balance of ERC20
    function balanceOf(address account) public view virtual returns (uint256) {
        return _balances[account];
    }

    // Transfer ERC20 
    function transfer(address to, uint256 amount) public virtual returns (bool) {
        _transfer(msg.sender, to, amount);

        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public virtual returns (bool) {
        require(_allowances[from][msg.sender] >= amount, "Insufficient allowance.");

        _allowances[from][msg.sender] -= amount;
        _transfer(from, to, amount);

        return true;
    }

    function allowance(address owner, address spender) public view virtual returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public virtual returns (bool) {
        require(spender != address(0), "Approved to the zero address.");
        require(spender != msg.sender, "Approved to same address.");
        require(amount > 0, "Approved amount is zero.");

        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);

        return true;
    }



    // Internal Functions
    function _transfer(address from, address to, uint256 amount) internal virtual {
        require(from != address(0), "Transfer from the zero address.");
        require(to != address(0), "Transfer to the zero address.");
        require(from != to, "Transfer to same address.");
        require(amount > 0, "Transfer amount is zero.");
        require(_balances[from] >= amount, "Transfer amount exceeds balance.");

        _balances[from] -= amount;
        _balances[to]   += amount;

        emit Transfer(from, to, amount);
    }

}