// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import {Lib} from './Lib.sol';
import {CardModifiers} from './modifiers/CardModifiers.sol';


contract SmartCard is Lib,CardModifiers{
    struct Card{
        string cardHolder;
        uint16 cardNumber;
        uint16 cardPin;
        uint16 cardCvv;
        bool active;
        bytes32 cardSecret;
    }
    mapping(address => Card) card;

    function _applyForCard(address accountWalletAddress,string memory accountName)internal  {
        // bytes32 secretGenerator = keccak256(abi.encodePacked(accountName));
        card[accountWalletAddress].cardHolder = accountName;
        card[accountWalletAddress].cardNumber = cardNumberGenerator();
        card[accountWalletAddress].cardPin = cardPinGenertor();
        card[accountWalletAddress].cardCvv = cardCvvGenerator();
        card[accountWalletAddress].active = true;
        card[accountWalletAddress].cardSecret = _cardSecretGenerator(card[accountWalletAddress],accountWalletAddress);
    }

    function _cardSecretGenerator(Card memory cardInstance,address acoountWalletAddress) internal pure returns (bytes32){
        return keccak256(abi.encodePacked(cardInstance.cardNumber,cardInstance.cardPin,cardInstance.cardCvv,acoountWalletAddress));
    }

    function _isCardValid(Card memory cardInstance,address acoountWalletAddress) internal pure checkValidCard(cardInstance,acoountWalletAddress) returns(bool){

        return true;
    }

    function getCardNumber(address accountAddress) internal view returns(uint16){
        return card[accountAddress].cardNumber;
    }

    function getCardPin(address accountAddress) internal view returns(uint16){
        return card[accountAddress].cardPin;
    }

    function getCardCvv(address accountAddress) internal view returns(uint16){
        return card[accountAddress].cardCvv;
    }

    // function getCard(address accountAddress) internal view returns(Card memory)
}