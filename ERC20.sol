//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "contracts/Ierc20.sol";

contract ERC20 is IERC20 {


    //Before Creating any ERC-20 smart Token we have to declare things which is NAME,SYMBOL,DECIMALS,TotalAmount
    string public tokenName = "RAJUTOKEN";
    string public symbol = "RAJU";
    uint8 public decimals = 0;
    uint256 public totalAmount;

    address minter;
    address contractOwner = msg.sender;
    address newOwner;
    address receiver;
    address spender;

    mapping(address => uint)  BalanceOf;
    mapping (address => mapping (address => uint)) allower; //an address will become an allower of other address to send the token on his behalf

    constructor(address _minter) {
        minter = _minter;
        totalAmount = 100000;
    }

    event Ownership(address indexed _contractOwner,address indexed _newOwner);
    
    
    modifier onlyContractOwner() {

        require(msg.sender == contractOwner,"Only Contract owner can do this Task");
        _;
    }
    modifier checkBalance(uint256 _value) {
        
        require(BalanceOf[msg.sender] >= _value,"Balance of the sender should be greater than _value");

        _;

    }
    function mint(uint _amount) public {

        totalAmount += _amount;
        BalanceOf[minter] = totalAmount;
    }
    function changeOwner(address _owner) public onlyContractOwner {
       
        require(_owner != contractOwner,"contract Owner can not be owner again of same contract"); 
            newOwner = _owner;
            emit Ownership(contractOwner, newOwner);
            contractOwner = newOwner;

    }    
    function totalSupply() public view override returns(uint256) {

        return totalAmount;

    } 
     function balanceOf(address _account) public view override returns(uint256) {

         return BalanceOf[_account];


    } 
     function transfer(address _receiver, uint256 _value) public override checkBalance(_value) returns(bool status){

       
        BalanceOf[msg.sender] -= _value;
        BalanceOf[_receiver] += _value;
        emit Transfer(msg.sender,_receiver,_value);
        status = true;

    } 
     function transferFrom(address _from, address _receiver,uint256 _value) public override returns(bool status){
        
        uint256 allowedBal = allower[_from][msg.sender];
        require(allowedBal>= _value,"Balance of the sender must be greater than _value");
        allower[_from][msg.sender] -= _value;
        BalanceOf[_receiver] += _value;
        BalanceOf[_from] -= _value;
        emit Transfer(_from, _receiver, _value);
        status = true;
    } 
     function approve(address _spender, uint256 _value) public override  checkBalance(_value) returns(bool status) {
         allower[msg.sender][_spender] = _value;
         emit Approve(msg.sender, _spender, _value);
         status = true;
    } 
     function allowance(address _owner, address _spender) public view returns(uint256) {
         //This function will tell how much token is allowed fro a sender to send
         return allower[_owner][_spender];
    } 
}

