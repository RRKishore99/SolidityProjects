//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract parent {

    uint var1 = 1234;  //Bydefault a state variable is internal

    function fun1() public pure returns(string memory) {
        return "I'm a fun1 of parent contract";
    }
    function fun2() public pure returns(string memory) {
        return "I'm in fun2 of parent contract";
    }
    function fun3() public pure virtual returns(string memory) {
        return "I'm in fun3 without override";
    }
    
}
contract child is parent {

   
    function childFun1() public pure returns(string memory) {
        return "I'm in child function 1" ;
    }
    // this is not possible a parent and a child can not have a function of same name without overriding
    // function fun1() public pure returns(string memory) {
    //     return "I'm a child fun1";
    // }
    function getresultofinternalVar() internal view returns(uint) {

        return var1;
    }
    function fun3() public pure override returns(string memory) {
        return "I'm in fun3 with override";
    }
  

}
contract grandChild is child{

    function callingChildFunction() public view returns(uint) {
        uint result = getresultofinternalVar();
        return result;
    }
}
