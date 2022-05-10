// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "../interfaces/IERC20.sol";

abstract contract AERC20 is IERC20 {
    uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    constructor(string memory name_, string memory symbol_, uint8 decimals_) {
        _name = name_;
        _symbol = symbol_;
        _decimals = decimals_;
    }

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

    function balanceOf(address account) public view virtual returns (uint256) {
        return _balances[account];
    }

    function transfer(address to, uint256 amount) public virtual returns (bool) {
        _transfer(msg.sender, to, amount);

        return true;
    }

    function allowance(address owner, address spender) public view virtual returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public virtual returns (bool) {
        require(spender != address(0), "approve to the zero address.");
        require(spender != msg.sender, "approve to same address.");
        require(amount > 0, "approve amount is zero.");

        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);

        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public virtual returns (bool) {
        require(_allowances[from][msg.sender] >= amount, "insufficient allowance.");

        _allowances[from][msg.sender] -= amount;
        _transfer(from, to, amount);

        return true;
    }

    function _transfer(address from, address to, uint256 amount) internal virtual {
        require(from != address(0), "transfer from the zero address.");
        require(to != address(0), "transfer to the zero address.");
        require(from != to, "transfer to same address.");
        require(amount > 0, "transfer amount is zero.");
        require(_balances[from] >= amount, "transfer amount exceeds balance.");

        _balances[from] = _balances[from] - amount;
        _balances[to] += amount;

        emit Transfer(from, to, amount);
    }

    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "mint to the zero address.");
        require(amount > 0, "mint amount is zero.");

        _totalSupply += amount;
        _balances[account] += amount;
        
        emit Transfer(address(0), account, amount);
    }

    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "burn from the zero address.");
        require(amount > 0, "burn amount is zero.");
        require(_balances[account] >= amount, "burn amount exceeds balance.");
        
        _balances[account] -= amount;
        _totalSupply -= amount;

        emit Transfer(account, address(0), amount);
    }
}