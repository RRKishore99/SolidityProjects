//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract ifelsetest {

    //we cannot use if-else here
    //it can only be use inside the function

    function checkNumber(uint num) public pure returns(string memory) {

        string memory result;

        if(num>100) {

            result="Number is greater than 100";
            return result;

        }
        else if(num==100) {
            result = "Number is equal to 100";
            return result;
        }
        else
        {
            result = "Number is smaller than 100";
            return result;
        }
    }

    //ternary operator
    function checkNumberTernary(uint num) public pure returns(string memory) {

        string memory result  = (num>100)?"Number is greater than 100":(num==100)?"Number is equal to 100":"Number is smaller than 100";

        return result;
    }
} 
