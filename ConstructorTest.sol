//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract constructorTest {

    string public name;
    uint public age;
    address public addVar;

    constructor(string memory _name,uint _age,address _addVar) {

        name = _name;
        age = _age;
        addVar = _addVar;


    }

    function viewValues() public view returns(string memory,uint, address) {

        return (name,age,addVar);
    }
}
