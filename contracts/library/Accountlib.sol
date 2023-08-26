// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

library AccountLib{
    function accountSecretGenerator(address _walletAddress,string memory _signature) internal view returns(bytes32){
        return keccak256(abi.encodePacked(_walletAddress,_signature,block.number-1,block.timestamp));
    }
}