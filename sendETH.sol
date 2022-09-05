//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;


contract sendETH {

    address payable public receiver = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

    receive() external payable {

    }

    function checkBalanceOfContract() public view returns(uint) {

        return address(this).balance;
    }

    
    //We usually don't use send and transfer functions now because of fixed gas limit
    function sendEther() public {
       bool status = receiver.send(1000000000000000000);
       require(status==true,"Transaction is failed");
    }

    function transferEther() public {

        receiver.transfer(2000000000000000000);
    }

    //In call method the value and gas is sent in key and value pair
    function sendEtherByCall() public {

        (bool status,bytes memory data) = receiver.call{value:2000000000000000000,gas:2500}("Data is");
        require(status==true,"Transaction got failed");
    }

    //How to send ether on address provided by user using call only

    function sendEthToDyanmicAddress(address payable _DynamicAddr) public {

        (bool status, ) = _DynamicAddr.call{value:2000000000000000000,gas:5000}("");
        require(status==true,"Transaction got failed");
    }

    

}
