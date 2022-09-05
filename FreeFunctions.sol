//SPDX-License-Identifier: ISC

pragma solidity ^0.8.16;

function bar(uint256 a, uint256 b) pure returns (uint256) {
    return a + b;
}

contract AA {
    uint256 public a;

    constructor() {
        a = 1234;
    }

    function foo() public view returns (uint256) {
        return bar(a, 1000);
    }
}
