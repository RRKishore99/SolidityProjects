//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract BytesDemo {
    //Static Size Byte
    bytes5 public var1; //will give 0x0000
    bytes6 public var2; //will give 0x0000000000
    bytes32 public var3; //will give 64 hex digits 0x0000.....0000 
    bytes4 public var4;
    //Dynamic size Bytes
    bytes public var5;

    function setBytesValue() public {

        var1 = "Raj";
        var2 = "12345";
        var3 = "!@#$%^&*";
        // var4 = 12345; we cannot use anything except string to set the value in bytes variable
        var5 = "Rajuraj80070070323";
    }

    function getBytesValue() public view returns(bytes5) {

        return var1;

    }
    //getting particular digit value of bytes
    function getParticularDigit() public view returns(bytes1) {

        return var2[3];
    }

    function getLengthOfBytes() public view returns(uint) {

        return var2.length;
    }
    function pushDataInBytes() public {

        // var3.push("u"); this function will not work in fixed size bytes
        var5.push("A");
    }
    function popDataFromBytes() public {
        var5.pop();
    }
 
}
