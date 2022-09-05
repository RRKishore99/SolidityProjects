//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract ModifierDemo {

    //You can also use the require, revert and assert in the modifier so that 
    //you don't have to use the same code again and again for owner check 

    //We use the modifiers when we want to remove the error of code duplicacy
    modifier sameCode() {

        for(uint i=0;i<10;i++) {
            //some code

        }
        _;  //This means that it will return back to the function where it called 
        //and comes back again to check if there any code left 
        //and if it is there then it will again execute it and check for '_;'
        //again it will come back to the modifier to check if there is any code left to execute

        for(uint i=10;i<20;i++) {
            //some code
        }
        _; 
    }

    modifier addAge(uint _x) {
        age = age+_x;

        _;
    }

    uint public age;

    //You have to add the name of the modifier where you want to execute the same code
    function fun1() public pure sameCode returns(string memory) {


        return "Hi in Fun 1";
    }    
    function fun2() public pure sameCode returns(uint _x) {

        //return 23; You can write this way or 
        _x=23;
    }
    function fun3() public view sameCode returns(address) {

        return msg.sender;
    }

    //How to send dynamic values in modifiers

    function add(uint _y) public addAge(_y){

      
    }

}
