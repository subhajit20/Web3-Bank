// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import {CustomModifiers} from './CustomModifiers.sol';

contract Account is CustomModifiers{
    struct UserAccount{
        string bank;
        // string name:"Subhajit";
        string signature;
        address walletAddress;
        uint totalBalance;
        // string accountOpeningDate;
        // string lastCreadit;
        // string lastDeposite;
    }

    address[] public allAccounts;
    mapping (address => UserAccount) public accounts;

    function _openAccount(string memory bankName,string memory _signature) internal isAccountExist(accounts[msg.sender].walletAddress) openingDepositeAmount{
        accounts[msg.sender] = UserAccount({
            bank:bankName,
            signature:_signature,
            walletAddress:msg.sender,
            totalBalance:msg.value
        });
        payable(address(this)).transfer(msg.value);
        allAccounts.push(accounts[msg.sender].walletAddress);
    }

    function _getAccount(address acc) internal view checkIsAccount(accounts[acc].walletAddress)  returns(UserAccount memory) {
        UserAccount memory myAcc =  accounts[acc];
        
        return myAcc;
    }

    function _creadit(address acc)internal checkIsAccount(accounts[acc].walletAddress) _depositeAmount{
        payable(address(this)).transfer(msg.value);
        accounts[acc].totalBalance = accounts[acc].totalBalance + msg.value;
    }

    function _debit(address acc,uint debinAmount)internal checkIsAccount(accounts[acc].walletAddress) _debitAmount(debinAmount){
        uint debitBalance = _canAmountDebited(debinAmount,acc);
        payable(acc).transfer(msg.value);
        accounts[acc].totalBalance = debitBalance;
    }

    function _canAmountDebited(uint debinAmount,address acc) internal view _checkDebitAmount(accounts[acc].totalBalance,debinAmount) returns(uint){
        uint debitBalance = accounts[acc].totalBalance - debinAmount;

        return debitBalance;
    }
    
}