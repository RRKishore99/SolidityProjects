//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract RequireDemo {

    //This require keyword helps you in error handling 
    //it is a simple check
    //If it fails then the gas will be refunded and if there's any changes been made in the
    //Smart contract then it will revert it that as well

    uint public age=20;
    address public owner=msg.sender;
    string public name;

    function addAge(uint _adding) public {

        age = age+_adding;
        require(_adding>1,"Please enter the adding value greater than 1");
    }

    function onlyOwnerNameChange(string memory _name) public {

        name = _name;
        require(owner == msg.sender,"Only Owner can add the name");


    }
}
