// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import {AccountModifiers} from './modifiers/AccountModifiers.sol';
// import {SmartCard} from './SmartCard.sol';
// import {Error} from './Events.sol';

contract Account is AccountModifiers{
    struct UserAccount{
        string bank;
        string name;
        string signature;
        address walletAddress;
        uint256 totalBalance;
        bool active;
        // string accountOpeningDate;
        // string lastCreadit;
        // string lastDeposite;
    }

    // address[] public allAccounts;
    mapping (address => UserAccount) public accounts;

    function _openAccount(string memory bankName,string memory _signature) internal isAccountExist(accounts[msg.sender].walletAddress) openingDepositeAmount{
        accounts[msg.sender].bank = bankName;
        accounts[msg.sender].signature = _signature;
        accounts[msg.sender].name = _signature;
        accounts[msg.sender].walletAddress = msg.sender;
        accounts[msg.sender].totalBalance = msg.value;
        accounts[msg.sender].active = true;

        payable(address(this)).transfer(msg.value);
    }

    function _getAccount(address acc) internal view checkIsAccount(accounts[acc])  returns(UserAccount memory) {
        UserAccount memory myAcc =  accounts[acc];
        
        return myAcc;
    }

    function _creadit(address acc)internal checkIsAccount(accounts[acc]) _depositeAmount{
        payable(address(this)).transfer(msg.value);
        accounts[acc].totalBalance = accounts[acc].totalBalance + msg.value;
    }

    function _debit(address acc,uint256 debitAmount)internal checkIsAccount(accounts[acc]){
        uint256 balanceLeft = _canAmountDebited(acc,debitAmount);

        payable(address(this)).transfer(address(this).balance-debitAmount);
        payable(acc).transfer(debitAmount);
        accounts[acc].totalBalance = balanceLeft;
    }

    function _canAmountDebited(address acc,uint256 debitAmount) internal view _checkDemoDebitAmount(accounts[acc].totalBalance,debitAmount) returns(uint256){
        uint256 balanceLeft = accounts[acc].totalBalance - debitAmount;

        return balanceLeft;
    }

    function _OneToOneTransfer(address senderAcc,address receiverAcc) internal checkIsRecipentAccount(accounts[receiverAcc],receiverAcc){
        uint _transferBalance = _transferAmount(senderAcc);
        payable(receiverAcc).transfer(msg.value);
        _transferdAmount(senderAcc,receiverAcc,_transferBalance);
    }

    function _transferAmount(address senderAcc) internal view checkIsAccount(accounts[senderAcc]) _checkDebitAmount(accounts[senderAcc].totalBalance) returns(uint256){
        uint transferBalance = accounts[senderAcc].totalBalance - msg.value;

        return transferBalance;
    }

    function _transferdAmount(address senderAcc,address receiverAcc,uint _transferBalance) internal{
        accounts[senderAcc].totalBalance = _transferBalance;
        accounts[receiverAcc].totalBalance = accounts[receiverAcc].totalBalance + msg.value;
    }

    function _getContractBalance() internal view returns(uint256){
        return address(this).balance;
    }
}