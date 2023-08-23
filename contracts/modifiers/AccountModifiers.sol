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
        require(msg.value >= 10 wei,'Amount atleat 10 wei or more than that');
        require(msg.value <= 1 ether,'Amount should not be greater than 1 ether');
        _;
    }

    modifier _checkDebitAmount(uint accountBalance){
        require(msg.value < accountBalance,'Input balance must be smaller than your account balance');
        _;
    }

    // modifier _isValidCard(address accountAddress){
    //     require(SmartCard.Card.card[accountAddress],'Card is not valid');
    //     _;
    // }
}