//SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

contract SmartWallet{
    address public owner;
    //necesito una variable amount?
    //mapping de users? esto creo que si
    event Withdraw(address user, uint256 amount);

    constructor(){
      owner = msg.sender;
    }

    //deberia dejar depositar a los usuarios, posiblemente cantidades
    //especificas si es posible. pero creo que eso se puede hacer con
    //msg.value
    function deposit() external payable{

    }

    //deberia dejar al owner retirar cantidades exactas del fondo
    //SOLO el OWNER
    function withdraw() external{

    }

    function getBalance() external view returns(uint){
        return address(this).balance;
    }
}
