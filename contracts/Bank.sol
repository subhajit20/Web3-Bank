// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import {Account} from './Account.sol';
import {SmartCard} from './SmartCard.sol';

contract Bank is Account,SmartCard{
    string internal bankName;
    constructor(string memory name){
        bankName = name;
    }

    function openAccount() public payable{
        string memory _bankName = bankName;
        _openAccount(_bankName,'Subhajit Ghosh');
    }


    function loginAccount(address acc) public view returns(UserAccount memory){
        UserAccount memory _myAcc = _getAccount(acc);

        return _myAcc;
    }

    function creaditAmount(address acc) public payable{
        _creadit(acc);
    }

    function debitAmount(address _acc,uint256 _debitAmount) public payable{
        _debit(_acc,_debitAmount);
    }

    function transfer(address senderAcc,address receiverAcc) public payable{
        _OneToOneTransfer(senderAcc,receiverAcc);
    }

    function applySmartCard(address accountWalletAddress) public {
        _applyForCard(accountWalletAddress, accounts[accountWalletAddress].name);
    }

    function getContractBalance() public view returns(uint256){
        // require(msg.sender != address(0),'Bank owner can see the amount');
        return _getContractBalance();
    }

}