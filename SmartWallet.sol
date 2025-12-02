//SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

contract SmartWallet{
    address public owner;
    mapping(address => uint256) user;
    event Deposited(address user, uint256 amount);
    event Withdrawn(address user, uint256 amount);

    modifier OnlyOwner(){
      owner = msg.sender;
      _;
    }

    constructor(){
      owner = msg.sender;
    }

    function deposit() external payable{
      require(msg.value > 0, "Deposit must be greater than 0");
      user[msg.sender] += msg.value;
      emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) external OnlyOwner{
      require(_amount > 0, "You are not the owner");

    }

    function getBalance() external view returns(uint){
      return address(this).balance;
    }
}
