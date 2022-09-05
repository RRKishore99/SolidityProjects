//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract constantVar {

    //constant variable we use when the value of the state variable 
    //will not be change throughout the whole contract
    //constant variable use less gas ccompared to the normal state variable

    address public constant addVar1 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;//21259 gas used
    
    address public addVar2 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; //23417 gas used
    
}
