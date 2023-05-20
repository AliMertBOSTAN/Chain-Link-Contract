// SPDX-License-Identifier: MIT 
pragma solidity 0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

abstract contract SecondConract is Ownable, ERC721{
    uint32 public tokenId;
    uint32 public mintAmounth;
    string public locationName;
    string public locationShort;

    struct LocationNFT{
        string locationName;
        uint32 id;
        uint256 mintAmounth;
    }

    constructor(
        uint32 _mintAmounth,
        string memory _LocationName,
        string memory _LocationShort
    ) ERC721 (_LocationName, _LocationShort) {

        require(_mintAmounth != 0, "Can not be 0");
        bytes memory locationNamebytes = bytes(_LocationName);
        require(locationNamebytes.length != 0, "Can not be empty");
        mintAmounth = _mintAmounth;
        locationName = _LocationName;
        locationShort = _LocationShort;
    }

    // mint() fonksiyonu belirli bir sınırda nft oluşuturup kullanıcının
    // kendisine nft oluşturmasına imkan veriyor
    function mint() public{
        require(mintAmounth - tokenId != 0, 'Event ended');
        // NFT data eksik o yapılacak
        _safeMint(msg.sender, tokenId );        
        tokenId = tokenId + 1;
    }

    // kalan katılım hakkı gösteriliyor 
    function remainingNFT() public view returns (uint32 remain){
        return (mintAmounth - tokenId);
    }


}
