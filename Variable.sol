// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract variable {
    uint num =  45;
    string name = "Raju";
    string company;

    constructor() {
        name = "Raju raj Kishore";
        num = 76;
        


    }
    function getTheValue() public returns(string memory) {
        name = "Kishore raju Raj";
        return name;
    }
    function setCompany() public {
        company = "Capgemini";
    }
    function getCompanyName() public view returns(string memory) {
        return company;
    }
}
