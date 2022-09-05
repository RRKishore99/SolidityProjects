//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

struct Acc_detail {
    string name;
    uint age;
    string place;
    uint amount;
}

contract AppMapping {

    mapping(address=>Acc_detail) public address_Id;

    function setAccData(string memory _name,uint _age,string memory _place,uint _amount) public {

        address_Id[msg.sender] = Acc_detail({name:_name,age:_age,place:_place,amount:address_Id[msg.sender].amount+_amount});
    }

    function getRecordData(address _address_Id) public view returns(Acc_detail memory) {
        
        return  address_Id[_address_Id];
    }

    function clearData(address _address_Id) public {

        delete address_Id[_address_Id];

    }
}
