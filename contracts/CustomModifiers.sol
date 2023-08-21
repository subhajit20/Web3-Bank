// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import {Account} from './Account.sol';

contract CustomModifiers{
    modifier isAccountExist(address acc) {
        require(acc != msg.sender,'Account is already exist');
        _;
    }

    modifier openingDepositeAmount {
        require(msg.value > 10 wei,'Amount should be greater than 20');
        _;
    }

    modifier checkIsAccount(address acc){
        require(acc == msg.sender,'You do not have account opened');
        _;
    }

    modifier _depositeAmount{
        require(msg.value >= 20 wei,'Amount atleat 20 wei or more than that');
        _;
    }

    modifier _debitAmount(uint inputBalance){
        require(inputBalance >= 10 wei,'Amount atleat 10 wei or more than that');
        require(inputBalance <= 1 ether,'Amount should not be greater than 1 ether');
        _;
    }

    modifier _checkDebitAmount(uint accountBalance, uint inputBalance){
        require(inputBalance < accountBalance,'Input balance must be smaller than your account balance');
        _;
    }
}