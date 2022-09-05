//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.10;

contract Identifier {

constructor() {
   
}

// function getName() view public returns(string memory) {

//     return name;
// }

// function getAge() view public returns(uint) {

//     return age;
// }

function giveName(string memory name) public pure returns(string memory) {

    string memory _name;
    _name = name;
    return _name;

}

}
