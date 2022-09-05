//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract ModifierUse {

    uint public add;
    uint public x;
    uint public y;
    uint public half;
    string public note;

    modifier getValues(uint _x,uint _y) {

        x=_x;
        y=_y;

        _;

        half = add/2;
        
        

        _;

    }

    function addNumbers(uint _x,uint _y) public getValues(_x,_y) {

        add = x+y;
        note = "I'm in the function";
    }

}
