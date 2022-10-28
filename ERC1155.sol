// SPDX-License-Identifier:MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/Strings.sol"; 
import "@openzeppelin/contracts/finance/PaymentSplitter.sol";

contract Raju1155 is ERC1155, Ownable, Pausable, ERC1155Supply, PaymentSplitter {
    
    uint256 public priceOfToken = 0.02 ether;
    uint256 public allowListPrice = 0.01 ether;
    uint256 public maxSupply = 5;
    uint256 public maxPerWallet = 3;
    bool allowListMintOpen = true;
    bool publicListMintOpen = false;
    //Mapping which help to know which address is in the part of allowlist
    mapping (address => bool) allowList;
    //We can also use merkle root to make it more gas optimized
    //Mapping which tell amount of minted tokens by one address
    mapping (address => uint256) purchasePerWallet;
    constructor(address[] memory _payees, uint256[] memory _shares) 
    ERC1155("ipfs://Qmaa6TuP2s9pSKczHF4rwWhTKUdygrrDs8RmYYqCjP3Hye/") 
    PaymentSplitter(_payees,_shares)
    {}

    //Set Uri function is used to set a new uri from IPFS if you want to use the new image or data to be minted
    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    //This function will help you to pause the minting whenever you want
    function pause() public onlyOwner {
        _pause();
    }

    //Resume the minting
    function unpause() public onlyOwner {
        _unpause();
    }

    function allowListMint(uint256 id, uint256 amount) public payable {
         
         
         require(allowListMintOpen == true,"Sorry the allowList Minting window is closed");
         require(msg.value == allowListPrice * amount, "Value should be equal to price of Token");
         require(allowList[msg.sender],"This address is not in the allowed List");
         mint(id,amount);
         

    }

    //This function will help minters to mint the token
    function publicMint(uint256 id, uint256 amount)
        public payable 
    
    {
        require(msg.value == priceOfToken * amount, "Value should be equal to price of Token");
        require(publicListMintOpen == true , "Sorry Currently the minting window is closed");
        mint(id,amount); 

    }

    //using this function to code reuseability
    function mint(uint256 id, uint256 amount) internal {
        require(purchasePerWallet[msg.sender]+amount <= maxPerWallet,"Sorry you can't mint more than allowed tokens");
        require(id < 2  ,"Sorry looks like you are minting wrong NFT");
        require(totalSupply(id) + amount <= maxSupply,"Sorry token minting limit exceeded");
        _mint(msg.sender, id, amount, "");
        purchasePerWallet[msg.sender] += amount;

    }

        //This function will help to set the minting window
    function setMintingWindow(bool _allowlistMint,bool _publicListMint) external {
            require(allowListMintOpen != _allowlistMint , "AllowListWindow is already at this state");
            require(publicListMintOpen != _publicListMint , "PublicMintWindow is already at this state");

            allowListMintOpen = _allowlistMint;
            publicListMintOpen = _publicListMint;

    }

        //This function helps you to create a dynamic uri for each token id
    function uri(uint256 id) public view virtual override returns (string memory) {
        
        require(exists(id),"This URI is not exists");
        return(string(abi.encodePacked(super.uri(id), Strings.toString(id),".json")));

    }
        //This function will set the addresses in the list 
    function setAllowList(address _addr) external onlyOwner {

        require(allowList[_addr] != true , "This address is already allowed");
        allowList[_addr] = true;


    }

    function withdraw(address _addr) external onlyOwner {
            require(address(this).balance > 0,"Balance is Zero");
            uint256 bal = address(this).balance;
            payable(_addr).transfer(bal);
    }

    function mintBatch(uint256[] memory ids, uint256[] memory amounts)
        public
        onlyOwner
    {
        _mintBatch(msg.sender, ids, amounts,"");
    }

    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        internal
        whenNotPaused
        override(ERC1155, ERC1155Supply)
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}
