//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract sendETHDirect{


    //This receiver takes the amount from transact 
    receive() external payable{}


    //after getting the amount this function will send the msg.value to the mentioned address
    //This function will directly send ether from one account to another account address
    //This function must be payable because we are sending it through this function and using msg.value
    //This function is receiving and then sending the ethereum at the same time so we have to use it as payable
    function sendEthDirectByCall(address payable receiver) public payable{

     (bool status,)= receiver.call{value:msg.value,gas:3500}("");
     require(status==true,"Transaction got failed");


    }

    //Emitting log 
    event log(uint value,address _receiver);

    function eventinglogontransfer(address payable receiver) public payable{

        emit log(msg.value, receiver);
        receiver.transfer(msg.value);
    } 

}

//sending ether to another contract

//This other contract must have a receive or fallback function in order to receieve the ether
contract getETH {

    receive() external payable{

    }

}
