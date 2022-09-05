//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;
//Case 1 when all the contracts are not connected with each other
contract A {

    uint public num;
    
    constructor() {
        num=10;
    }

    function parentFun() public pure returns(string memory) {

    return "I'm in parentFun1";
    }
    

}

contract B  {

    uint public num2;

    constructor(){
        num2=15;

    }
    
    function childfun() public pure returns(string memory) {

        return "I'm in child function";
    }
    
}

contract C is A,B {
    function multiInheritFunction() public pure returns(string memory) {
        return "I'm in multi Inherit function";
    }

    function addition() public view returns(uint) {

        uint res = num+num2;
        return res;


    }
}

//Case 2 : when all the contracts are connected with each other then we have to take care of the order

//Here X is more base Like
contract X {

    uint public var1 = 10;
    constructor(){

        var1 =100;
    }
    function getValueOfVar1() public view returns(uint) {
        return var1;
    }
}
//Derived and less Base Like
contract Y is X {

    uint public var2 = 10;
    constructor(uint _var2){

        var2 = _var2;
    }
    function getValueOfVar2() public view returns(uint) {
        return var1;
    }
}
//Most derived contract
//This we cannot do because the order of inheritance must be much base like 
//contract Z is Y,X{}

contract Z is X,Y(100) {

    function getValueOfVar1Var2() public view returns(uint,uint){
        return (var1,var2);
    }
}
