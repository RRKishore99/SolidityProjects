//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract A {
    
    string public name;
    uint public age;

    constructor(string memory _name,uint _age){
        name = _name;
        age  = _age;
    }
}
contract B {
    string public addr;
    uint public salary;

    constructor(string memory _addr,uint _salary){
        addr = _addr;
        salary = _salary;
    }
}
//If you inherit a paraent contract and it have constructor then you must have to pass the value to it
//either static or dynamic
//In that contract or in the child contract

//Method 1 to pass the parameters in constructor

// Order Of Inheritance - It is decided on the order of contract inherited
// A,B,C
contract C is A("Raju",23),B("Delhi",100000) {

}

//Method 2 to pass the parameters in constructor

//Order of Inheritance
//B,A,D
contract D is B,A{

    constructor() A("raju",23) B("Delhi",10000) {

    }
}

//Method 3 to pass the parameters in constructor

//A,B,E
contract E is A,B {

    constructor(string memory _name, uint _age,string memory _addr,uint _salary) A(_name,_age) B(_addr,_salary) {
        name = _name;
        age = _age;
        addr = _addr;
        salary = _salary;
    }



}

//Method 4 you can pass any value dynamically 

contract F is A("Ashish",24),B {

    uint public mobile;
    constructor(string memory _addr, uint _salary, uint _mobile) B(_addr,_salary) {

        mobile = _mobile;

    }


}
