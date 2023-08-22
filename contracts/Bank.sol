// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import {Account} from './Account.sol';

contract Bank is Account{
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

    function debitAmount(address _acc) public payable{
        _debit(_acc);
    }

    function transfer(address senderAcc,address receiverAcc) public payable{
        __OneToOneTransfer(senderAcc,receiverAcc);
    }


}