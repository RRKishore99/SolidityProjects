//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract EventDemo {

    event balance(address account,string message,uint value);

    function setDataInEvent(uint _value) public {
        emit balance(msg.sender,"Has a total of",_value);
    }
}

contract Attendence {

    event Ispresent(
        address indexed acc_id,
        string indexed attended,
        uint indexed rollno
    );
    event IsAbsent(
        address indexed acc_id,
        string indexed absent,
        uint rollno
    );
    function giveAttendence(uint _rollno) public {
        emit Ispresent(msg.sender,"Present",_rollno);
    }

}
