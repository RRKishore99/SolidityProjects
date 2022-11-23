// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract MultiSigWallet {

    struct Transactions {
    address to;
    uint256 value;
    // bytes data;
    bool isExecuted;
    uint256 numOfConfirmation;
}
    address[] public owners;
    uint256 public numOfApproversNeeded;

    mapping (address => bool) isOwner;
    //index to owner to bool
    mapping(uint => mapping (address=> bool)) isConfirmed;

    Transactions[] public transactionArr;

    event submitTransactions(uint _value, uint txIndex, address _to);
    event confirmTransactions(uint256 _txIndex,address _owner);
    event Deposit(address sender, uint amount , uint Balance);
    event revokeConfirmations(address _owner, uint txIndex);
    event executeTransactions(address _owner, uint txIndex);

    modifier onlyOwner() {

        require(isOwner[msg.sender],"Not an Owner");

        _;

    }
    modifier indexExists(uint _txIndex) {
        
        require(_txIndex < transactionArr.length, "Index does not exists");
        _;
    }

    modifier notExecuted(uint _txIndex) {

        require(!transactionArr[_txIndex].isExecuted,"Transaction already executed");

        _;
    }
    
    modifier notConfirmed(uint _txIndex) {
        require(!isConfirmed[_txIndex][msg.sender],"Transaction already Confirmed");
        _;
    }
    
 
    constructor(address[] memory _owners,uint256 _numOfApproversNeeded)   {
        require(_numOfApproversNeeded>0,"Number of approvers must be greater than 0");
        require(_owners.length>0,"Number of owners must be greater than 0");
        require(_numOfApproversNeeded<= _owners.length,"Owners required must be less or equal to the owners");
        numOfApproversNeeded = _numOfApproversNeeded;
        for(uint i = 0 ; i<_owners.length; i++) {
            address owner = _owners[i];

           require(owner!= address(0),"Invalid address");
           require(!isOwner[owner],"Owner must be unique");

           isOwner[owner] = true;
           owners.push(owner);

        }

        
    }

    function submitTransaction(uint256 _value,address _to) public onlyOwner returns(bool success){

        uint txIndex  = transactionArr.length;

        transactionArr.push(Transactions({
            value:_value,
            to: _to,
            isExecuted:false,
            numOfConfirmation:0
            }));
        

        emit submitTransactions(_value, txIndex, _to);

        success = true;
        
    }
 
    function confirmTransaction(uint _txIndex) public 
    onlyOwner 
    indexExists(_txIndex) 
    notExecuted(_txIndex)
    notConfirmed(_txIndex) 
    {

        Transactions storage transac = transactionArr[_txIndex];
        transac.numOfConfirmation += 1;
        isConfirmed[_txIndex][msg.sender] = true;
        emit confirmTransactions(_txIndex, msg.sender);
         
    }

    function executeTransaction(uint _txIndex) public payable 
    onlyOwner 
    indexExists(_txIndex)
    notExecuted(_txIndex)
    {
        Transactions storage transac = transactionArr[_txIndex];
        require(transac.numOfConfirmation >= numOfApproversNeeded,"Number of Confirmation is less than required");

        transac.isExecuted = true;
        (bool status, ) =  transac.to.call{value:transac.value}("");
        require(status,"Transaction got failed");

        emit executeTransactions(msg.sender, _txIndex);



    }

    function revokeConfirmation(uint _txIndex) public 
    onlyOwner 
    indexExists(_txIndex) 
    notExecuted(_txIndex)
    {

        Transactions storage transac = transactionArr[_txIndex];
        transac.numOfConfirmation -= 1;
        isConfirmed[_txIndex][msg.sender] = false;
        emit confirmTransactions(_txIndex, msg.sender);

    }
    receive() external payable {

    }
    
}
