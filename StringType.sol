// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract stringtype {

    string public str = "Raju Raj Kishore";

    function checkString(string memory _str) public returns(string memory){

        string memory str2 = "Abhay Patel";
        str = _str;

        return str2;

    }

}
