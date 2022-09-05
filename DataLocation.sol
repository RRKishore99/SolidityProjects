//SPDX-License-Identifier: MIT

/* In this we are going to learn about the three diff types of data location
1. storage 2.memory 3. calldata

storage- we usually use them when we want to store the s.v in the blockchain
this memory block is permanent because it stores in blockchain
the gas cost is much higher than memory and calldata

memory- This is store in Ram/Stack mem , we usually use it on local variable

calldata- this is used when we want to take the function input where we do not want to change the value
*/

pragma solidity ^0.8.14;

contract DataLocation {

    uint[] public arr  = [1,2,34,5,6,67];



    function storageDemo() public {
        //storage array is also pointing to that arr because both will be created in blockchain
        //so if we change the value of arrst then there will also be the change in arr
        uint[] storage arrst = arr;

        arrst[1] = 500;

    }

    function memoryDemo() public view {
        //This will create a copy of arr in Ram/stack then point it to that
        uint[] memory arrme = arr;

        arrme[3]  = 100;

    }

    //This calldata we use when we don't want to change the value provided by the users
    //This stores in blockchain
    //multiple functions can use the same variable
    //This calldata can only be use for array,struct and mapping

    //This arr will have the same values for both the functions
    function calldataDemo(uint[] calldata arr) public {

        



    }

    function calldataDemo2(uint[] calldata arr) public {
        
    }

}



