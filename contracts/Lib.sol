// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


contract Lib{
    function randomNumberGenerator(uint256 seed) internal pure returns(uint256){
        return uint256(keccak256(abi.encodePacked(seed)));
    }

    function seedGenerator() internal view returns(uint256){
        uint256 seed = uint256(keccak256(abi.encodePacked(block.number-1,block.timestamp,msg.sender)));
        seed = randomNumberGenerator(seed);

        return seed;
    }

    function cardNumberGenerator()internal view returns(uint16){
        return uint16(seedGenerator()%10000000000000000);
    }

    function cardPinGenertor() internal view returns(uint16){
        return uint16(seedGenerator()%10000);
    }

    function cardCvvGenerator() internal view returns(uint16){
        return uint16(seedGenerator()%1000);
    }
}