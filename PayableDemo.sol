//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract PayableDemo {

    //type-cast is needed when you are creating a payable address.
    address payable public owner = payable(msg.sender);

    //How to create a payable constructor?
    //By using this you can add the ether before deployment 
    constructor() payable {

    }

    //to create a function payable we have to add keyword 'payable' at function declaration
    //you can write payable after public in function but cannot write payable after visiblity in case of s.v.
    function getETH() public payable {


    }

    function viewETH() public view returns(uint) {

        return address(this).balance; //This is used to check the current balance on this address
    }

    function checkAddressOfContract() public view returns(address) {

        return address(this);
    }

    //This is the way to have the dynamic values of payable
    function addOwnerAddress(address payable _owner) public {
        
        owner = _owner;


    }
}
