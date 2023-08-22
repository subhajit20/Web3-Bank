// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import {CustomModifiers} from './CustomModifiers.sol';
// import {Error} from './Events.sol';

contract Account is CustomModifiers{
    struct UserAccount{
        string bank;
        // string name:"Subhajit";
        string signature;
        address walletAddress;
        uint totalBalance;
        bool active;
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
            totalBalance:msg.value,
            active:true
        });
        payable(address(this)).transfer(msg.value);
        // emit Error('Congratulations! Your account has been opened');
        allAccounts.push(accounts[msg.sender].walletAddress);
    }

    function _getAccount(address acc) internal view checkIsAccount(accounts[acc])  returns(UserAccount memory) {
        UserAccount memory myAcc =  accounts[acc];
        
        return myAcc;
    }

    function _creadit(address acc)internal checkIsAccount(accounts[acc]) _depositeAmount{
        payable(address(this)).transfer(msg.value);
        accounts[acc].totalBalance = accounts[acc].totalBalance + msg.value;
    }

    function _debit(address acc)internal checkIsAccount(accounts[acc]) _debitAmount{
        uint debitBalance = _canAmountDebited(acc);
        payable(acc).transfer(msg.value);
        accounts[acc].totalBalance = debitBalance;
    }

    function _canAmountDebited(address acc) internal view _checkDebitAmount(accounts[acc].totalBalance) returns(uint){
        uint debitBalance = accounts[acc].totalBalance - msg.value;

        return debitBalance;
    }

    function _OneToOneTransfer(address senderAcc,address receiverAcc) internal checkIsRecipentAccount(accounts[receiverAcc],receiverAcc){
        uint _transferBalance = _transferAmount(senderAcc);
        payable(receiverAcc).transfer(msg.value);
        _transferdAmount(senderAcc,receiverAcc,_transferBalance);
    }

    function _transferAmount(address senderAcc) internal view checkIsAccount(accounts[senderAcc]) _checkDebitAmount(accounts[senderAcc].totalBalance) returns(uint){
        uint transferBalance = accounts[senderAcc].totalBalance - msg.value;

        return transferBalance;
    }

    function _transferdAmount(address senderAcc,address receiverAcc,uint _transferBalance) internal view{
        accounts[senderAcc].totalBalance = _transferBalance;
        accounts[receiverAcc].totalBalance = accounts[receiverAcc].totalBalance + msg.value;
    }
    
}