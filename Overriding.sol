//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract First {

    function methodToOverride() public virtual pure returns(string memory) {
        return "I'm in the function of first cOntract";
    }
}
contract Second is First {

    function methodToOverride() public virtual override pure returns(string memory) {
        return "I'm in the overridden method";
    } 
}

contract Third is First,Second {

    function methodToOverride() public override(First,Second) pure returns(string memory){
    return "I'm in function in third contract"; 

    }

}
