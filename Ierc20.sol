// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

interface IERC20 {

    function totalSupply() external view returns(uint256);
    function balanceOf(address _owner) external view returns(uint256);
    function transfer(address _receiver, uint256 _value) external returns(bool status);
    function transferFrom(address _sender, address _receiver, uint256 _value) external returns(bool status);
    function approve(address _spender, uint256 _value) external returns(bool status);
    function allowance(address _owner, address _spender) external view returns(uint256) ;


    event Transfer(address indexed from,address indexed to, uint256 indexed value);
    event Approve(address indexed owner, address indexed spender, uint256 indexed value);

}