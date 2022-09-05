//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

struct Emp {
    uint empId;
    string name;
    address addres;

}

contract StructDemo{

    Emp public emp1;
    Emp[] public empArr;
    Emp public emp4;

    constructor(uint _empId,string memory _name, address _addres) {
        //This is the first type
        emp1.empId  = 1001;
        emp1.name   = "Raju";
        emp1.addres = msg.sender;

        emp4.name = _name;
        emp4.addres = _addres;
        emp4.empId =  _empId;

         
    }

    function getData() public view returns(Emp memory) {
        return emp1;
    }
    function createStructData() public  {
        //Type 2 to enter data into struct
        Emp memory emp2 = Emp(1234,"Raju Raj",0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

        //Type 3 to enter the data into struct
        Emp memory emp3  = Emp({addres:0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7,
                                name:"Kishore Ashish",
                                empId:2345});
        empArr.push(emp1);
        empArr.push(emp2);
        empArr.push(emp3);
        //Directly pushing data into array
        empArr.push(Emp({name:"Abhay",addres:0x17F6AD8Ef982297579C203069C1DbfFE4348c372,empId:686586}));

    }
    function removeDataFromStruct() public {

        empArr.pop();
    }
   
}
//Using Struct in two differnt contracts
contract StructDemo2{
    Emp public emp_temp  ;

}
