//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//This is a Parent contract
contract Visibility {

    //Visibility is of for two things 1. state var 2.function
    //4 types of visibility 1. private 2. internal 3. external 4. Public 

    //Private 
    uint private privateVar;  //This variable can only be use inside the contract 
                                    //and call by only inside function of the contract

    //internal
    uint internal internalVar; //This variable can only be called inside a contract 
                                //and by derived contract

    //external
    // A State Variable can not be external
    //This is not possible
    //uint external externalVar; 

    constructor(){
        privateVar = 1234; //Private variable can be initialize inside constructor
        internalVar = 12334; //internal var can be initiablize inside constructor
    }

    //This function can not be call outside a contract
    function checkPrivate() private {

        privateVar = 2345;
        internalVar = 123456; //an internal function can also called a internal state variable

    }

    function checkInternal() internal returns(string memory){
        privateVar = 123456;
        internalVar = 1234567;
        return "I'm an internal function";
    }
    //This function can only be called by outside caller
    //can not be called by another function
    function checkExternal() external returns(string memory) {
        privateVar = 1234567;
        internalVar = 12345678;
        return "I'm an external function";
    }
  
    function getPrivateData() public view returns(uint){

        return privateVar; //This function can call a private state variable because 
                                //it is inside the contract

    }
    function getInternalData() public view returns(uint) {
        return internalVar;
    }
    function callingExternalInternalfunction() public returns(string memory) {

        //an inside function can not call a external function
        //string memory resultByExternal = checkExternal();

        string memory resultByInternal = checkInternal();
         return resultByInternal;  
    }
}
//This is a child contract
contract DerivedContract is Visibility{

    function childContractFunction() public view returns(uint) {
        //Derived function can not call a private state variable
        //return privateVar;
        
        //function of child contract can call a internal state variable
        return internalVar;
    }
}
//This is an external function.
contract VisibilityChecking {
   
    string public resultByExternal;

    function checkPrivateByExternalContract() public returns(string memory) {

        //This is not possible because privateVar is not in this contract 
        //and it is also not public and external
        //return privateVar;

        //calling a internal state var from an external contract is not possible
        //return internalVar; 

        //To call an external function you have to create an object of parent contract
        Visibility visibilityObj = new Visibility();
        resultByExternal = visibilityObj.checkExternal();
        return resultByExternal;
    }
}
