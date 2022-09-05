//SPDX-License-Identifier: MIT

                       // Important
   /* Immutabilty is the concept where we can use it to make a s.v constant
    But can have a dynamic value for one time
    this is the difference between the immutable and constant
    constant can not have a dynamic values they can only have inline values

    Transaction cost will be higher than constant in case of immutable
    Tx cost  constant<<immutable<<simple */

pragma solidity ^0.8.14;

contract Immutability {

    //we usually use address where we don't want to change the address which is fixed once

    //either we can use constructor to provide the value or provide the value inline
    address public immutable owner;
    //You have to initialize the constant variable inline  
    address public constant owner2=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    constructor(address _owner) {
        
        owner = _owner;

    }




}
