//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;


contract loops {

    //if()
   // for(){}  if-else and loops can nott be use on contract level

   function forDemo(uint _length) public pure returns(uint) {
       uint length = _length;
       uint result=1;
       for (uint i=1;i<=length;i++) {

           result = result*i;

       }
       return result;


   }
}
