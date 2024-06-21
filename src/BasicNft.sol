// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    // a unique NFT is a combination of the contract address and tokenId
    // the tokenId is the number of the NFT
    // the contract address is the address of the contract
    // for example, the contract address 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
    // and tokenId 1 is the NFT with the address
    //  0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 and tokenId 1
    uint256 private s_tokenCounter; // this will be our tokenId

    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("Dogie", "DOG") {
        s_tokenCounter = 0;
    }

    // Minting is the process of creating a non-fungible, or unique, token on a blockchain
    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}
