//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract FallBackDemo {

/*fallback
It is executed when a non-existent function is called on the contract.
It is required to be marked external.
It has no name.
It has no arguments.
It can not return any thing.
It can be defined one per contract,
If not marked payable,it will throw exception if contract receives ether
It's main use is to directly send the ETH to contract
*/

event checkData(string message,address from,uint amount,address to);


//Fallback functions takes data and ether 
//If there is an transaction where the data and ether is send then fallback function will run
//otherwise receive function will take care of it
fallback() external payable{

    emit checkData("Transaction of fallback",msg.sender,address(this).balance,address(this));

}

//recieve function will not take data and will always be a payable function
//you can not make a receive function impayable
receive() external payable {
    emit checkData("Transaction of recieve",msg.sender,address(this).balance,address(this));

}

function checkBalance() public view returns(uint) {

    return address(this).balance;
}


}
