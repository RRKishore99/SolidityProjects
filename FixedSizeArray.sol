//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;



contract fixedSizeArray {

    uint[10] public arr = [10,20,30];
    string[3] public strarr;
    address[2] public addarray  = [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2];

    function getValueFromArray() public view returns(uint) {
        uint temp ;
        temp = arr[4];
        return temp;

    }

    function updateValueInArray() public {
        arr[4] = 4000;

        
    }

    function deleteValueFromArray() public{

        //delete is the keyword with is use to remove the value from the array
        //it will not change the sixe of an array but only delete the value
        delete arr[1];

    }

    function ViewLength() public view returns(uint) {
        uint len = arr.length;
        return len;
    }

    function arrayWithLoop(uint _Value) public {

        for(uint i=0;i<arr.length;i++){
            arr[i]  = _Value+i;

        }
    }

    function creatingArrayInMemory(uint _value) pure public returns(uint) {

        //This is the way to create a array inside a function
        //Or creating an array inside the memory

        //We cannot create a dynamic size array inside memory

        // uint[] memory array = new uint[](_value);
        // uint value = _value;
        // array[4]  = value;
        // return array[4];
        // return array.length;

        //creating string array in memory
        string[] memory array2 = new string[](_value);
        array2.length;
        return array2.length;
    }

        //How to return whole array

    function returnArray() public view returns(uint[10] memory) {
        return arr;
    }
    constructor() {

        strarr  = ["Raju","Raj","Kishore"];

    }

    function returnStringArray() public view returns(string[3] memory) {

        return strarr;
    }


}
