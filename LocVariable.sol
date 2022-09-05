// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract locVariable {
    string naam = "Naam47hai";
    uint public age;
    address public ghr;
    bool public flag;
    constructor() {
        
        age = 74;
        age = 75;
    }

    function setValue() public {

        // string memory name = "Ashish Patel";
        age = 32;        
    }

    function getValueOfLocal() view public returns (uint) {

        return age;
    }
    function getTheString() view public returns(string memory) {
        return naam;
        
    }

    function callingState(string memory _naam,uint _age, address _ghr ) public {
        age = _age;
        naam = _naam;
        ghr  = _ghr;

        
    }
    function viewStateVar() view public returns(uint,string memory, address) {

        return (age,naam,ghr);
    }
}
