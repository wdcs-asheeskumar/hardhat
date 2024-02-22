//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

/// @title A Token contract 
/// @author Ashees Kumar

contract Token {
    string public name = "MyPersonalToken";
    string public symbol = "MPT";
    /// @dev Sets the values for {name} and {symbol}
    uint256 public totalSupply = 1000000;
    /// @dev Giving the value for the total supply of tokens
    address public owner;
    mapping(address => uint256) balances;
    /**
     * @dev create a variable of type address for storing the value of owner of the contract
     * create a mapping which stores the token balance of the token holders
     */
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    /**
      * @dev create an event Transfer which emit the address of the sender, 
      * address of the receiver and the value of the token transfered from sender 
      * to receiver.
      *
      * It will get emitted each and every time token is transfered successfully from 
      * one address to another.
      */
    constructor() {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }
    /** 
      * @dev Here we will assign the value of total supply of tokens to msg.sender 
      * and also make msg.sender the owner of the contract.
      * The value assigned in the constructor can't be changed again in the contract hence
      * the value of balance of msg.sender and owner of contract will remain same throughout the 
      * contract.
      */
    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }
    /**
      * @dev Here we create a transfer function for the transfer of tokens from one address
      * to another. The function takes two parameters as the input. First one being the name of 
      * the receiver and the amount that has to be transfered to the receiver by the sender.
      *
      * In the function, first it's checked inside the require() wether msg.sender, which is the owner 
      * of the contract has equal or more balance then the amount that the sender is trying to transfer
      * or not. It the condition is met then we move on to the next step or else it will stop the execution.
      * 
      * After checking the balance in require statement, the amount which has to be transfered from the
      * sender is deducted from the amount of the sender's account, which in this case is msg.sender or the 
      * owner of the contract. Then that much amount of tokens are added to the account of the receiver and
      * hence completing the process of transfer of tokens.
      *
      * Finally, the event Transfer is emitted at the end of the transfer, emiting the balance of sender, receiver
      * and amount.
      */
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
    /**
      * @dev Here we have created a balanceOf function to check the balance of the account. It takes one parameter
      * which is the account address of the account holder whose balance has to be checked.
      */
}
