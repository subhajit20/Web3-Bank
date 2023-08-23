// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import {SmartCard} from '../SmartCard.sol';

contract CardModifiers{
    modifier checkValidCard(SmartCard.Card memory cardInstance,address acoountWalletAddress){
        require(keccak256(abi.encodePacked(cardInstance.cardNumber,cardInstance.cardPin,cardInstance.cardCvv,acoountWalletAddress)) == cardInstance.cardSecret,'Card is notvalid');
        _;
    }
}