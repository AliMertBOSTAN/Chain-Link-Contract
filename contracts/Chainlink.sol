// SPDX-License-Identifier: MIT 
pragma solidity 0.8.18;

import './second.sol';

contract MainConract{
    SecondConract public second;

    mapping(address => SecondConract) public nftContractlist; 

    // constructor() public {}

    // bu fonksiyon yeni bir localde nft ve sözleşme oluşturan 
    function newLocation(uint32 _mintAmounth, string memory _LocationName, string memory _LocationShort) public {
        second = new SecondConract( _mintAmounth, _LocationName, _LocationShort);
    }

}
