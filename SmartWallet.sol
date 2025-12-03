//SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

contract SmartWallet{
    address public owner;
    mapping(address => uint256) user;
    event Deposited(address user, uint256 amount);
    event Withdrawn(address user, uint256 amount);

    modifier OnlyOwner(){
      require(msg.sender == owner, "You are not the owner");
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
      require(_amount > 0, "Amount must be greater than 0");
      require(_amount <= getBalance(), "");
      (bool sent, ) = msg.sender.call{value: _amount}("");
      require(sent, "Failed to send ether");
      emit Withdrawn(msg.sender, _amount);
    }

    function getUserDeposit(address _user) external view returns (uint256) {
    return user[_user];
    }

    function getBalance() public view returns(uint){
      return address(this).balance;
    }
}
