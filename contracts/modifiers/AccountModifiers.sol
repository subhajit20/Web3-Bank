// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import {Account} from '../Account.sol';


contract AccountModifiers{
    modifier isAccountExist(address acc) {
        require(acc != msg.sender,'Account is already exist');
        _;
    }

    modifier openingDepositeAmount {
        require(msg.value > 10 wei,'Amount should be greater than 20');
        _;
    }

    modifier checkAccountSecret(Account.UserAccount memory acc,bytes8 inputAccSecret,address walletAddress){
        require(acc.accountSecret == inputAccSecret && acc.walletAddress == walletAddress,'You have put invalid account secret and walletAddress');
        _;
    }

    modifier checkIsAccount(Account.UserAccount memory acc){
        require(acc.walletAddress == msg.sender,'You do not have account opened');
        _;
    }

    modifier checkIsRecipentAccount(Account.UserAccount memory acc,address resipientAddress){
        require(acc.walletAddress == resipientAddress,'Recipent do not have account opened');
        require(acc.active == true,'Recipent account is not active right now');
        _;
    }

    modifier _depositeAmount{
        require(msg.value >= 20 wei,'Amount atleat 20 wei or more than that');
        _;
    }

    modifier _debitAmount{
        require(msg.value >= 10 wei && msg.value <= 5 ether,'Amount atleat 10 wei or more than that and should not be greater than 5 ether');
        _;
        // require(msg.value <= 5 ether,'Amount should not be greater than 1 ether');
    }

    modifier _checkOneToOneDebitAmoutOfSender(uint accountBalance){
        require(msg.value < accountBalance,'Input balance must be smaller than your account balance');
        _;
    }

    modifier _checkDebitAmount(uint256 accountBalance, uint256 _debitBalance){
        require(_debitBalance >= 10 wei && _debitBalance <= 5 ether,'Amount atleat 10 wei or more than that and should not be greater than 5 ether');
        require(address(this).balance > _debitBalance && _debitBalance < accountBalance,'Input balance must be smaller than your account balance');
        _;
    }

    // modifier _isValidCard(address accountAddress){
    //     require(SmartCard.Card.card[accountAddress],'Card is not valid');
    //     _;
    // }
}