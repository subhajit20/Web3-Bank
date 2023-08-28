// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
import {Bank} from './Bank.sol';

contract Web3Bank is Bank{
    string public name;
    address public bankOwner;

    constructor(string memory bankName) Bank(bankName){
        bankOwner = msg.sender;
    }
    
    receive() payable external{}
    fallback() external payable {}


    function getBankName() public view returns (string memory) {
        string memory nameOfBank = bankName;

        return nameOfBank;
    }

}
