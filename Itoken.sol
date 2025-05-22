// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/// @title IToken - A basic ERC20 Token implementation
/// @author 
/// @notice This contract implements a simple ERC20 token with basic functionalities.
/// @dev This is a simplified ERC20 token and does not implement all advanced features like minting or burning.

contract IToken {
    /// @notice Name of the token
    string public name = "IToken";

    /// @notice Symbol of the token
    string public symbol = "ITN";

    /// @notice Number of decimals used to get its user representation
    uint8 public decimals = 18;

    /// @notice Total number of tokens in circulation
    uint256 public totalSupply;

    /// @notice Balance of each account
    mapping(address => uint256) public balanceOf;

    /// @notice Allowance amount a spender is allowed to withdraw from an owner
    mapping(address => mapping(address => uint256)) public allowance;

    /// @notice Emitted when tokens are transferred from one address to another
    event Transfer(address indexed from, address indexed to, uint256 value);

    /// @notice Emitted when an approval is given to a spender
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /// @notice Constructor that gives the deployer an initial supply of tokens
    /// @param _initialSupply The number of tokens initially assigned to the deployer
    constructor(uint256 _initialSupply) {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    /// @notice Transfers tokens to another address
    /// @param to The address to transfer tokens to
    /// @param value The number of tokens to transfer
    /// @return success A boolean value indicating whether the operation succeeded
    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        require(to != address(0), "Cannot transfer to zero address");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;

        emit Transfer(msg.sender, to, value);
        return true;
    }

    /// @notice Approves another address to spend tokens on behalf of the sender
    /// @param spender The address authorized to spend
    /// @param value The number of tokens allowed to be spent
    /// @return success A boolean value indicating whether the operation succeeded
    function approve(address spender, uint256 value) public returns (bool success) {
        allowance[msg.sender][spender] = value;

        emit Approval(msg.sender, spender, value);
        return true;
    }

    /// @notice Transfers tokens from one address to another using an allowance
    /// @param from The address to send tokens from
    /// @param to The address to send tokens to
    /// @param value The number of tokens to transfer
    /// @return success A boolean value indicating whether the operation succeeded
    function transferFrom(address from, address to, uint256 value) public returns (bool success) {
        require(balanceOf[from] >= value, "Insufficient balance");
        require(allowance[from][msg.sender] >= value, "Allowance exceeded");
        require(to != address(0), "Cannot transfer to zero address");

        balanceOf[from] -= value;
        balanceOf[to] += value;

        allowance[from][msg.sender] -= value;

        emit Transfer(from, to, value);
        return true;
    }
}
