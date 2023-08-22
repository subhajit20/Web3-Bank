// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract SmartCard{
    struct Card{
        string cardHolder;
        bytes cardNumber;
        string pin;
        string cvv;
        bool active;
    }

    
}