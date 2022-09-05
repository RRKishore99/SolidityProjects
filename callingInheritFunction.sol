//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract A {

    event Employee(string name,uint age,string addr, uint salary);
    
    function funA() public virtual {
        emit Employee("raju.A",23,"New Delhi",100000);
        
    }

}

contract B is A {

    
    function funA() public virtual override {
        
        emit Employee("Ashish.B",24,"Delhi",10000);
       
    }

}

contract C is A {

    function funA() public virtual override {
        emit Employee("Raju.FunC",25,"Aligarh",2000000);
        A.funA();
        super.funA();
        
    }


}
contract D is B,C {

    function funA() public override(B,C) {

        emit Employee("Raju.D",26,"Kanpur",10000000000);
        A.funA();//This will give output from 'A' parent contract
        super.funA();//super will be function in 'C' contract

    }
}
