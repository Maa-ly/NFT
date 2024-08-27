// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    mapping(uint256 => string) private s_TokenIdToUrl;
    uint256 private s_tokenCounter;

    constructor() ERC721("Dogie", "Dog") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenUri) public {
        s_TokenIdToUrl[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_TokenIdToUrl[tokenId];
    }
}
