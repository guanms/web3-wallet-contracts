// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract MiniNFT is ERC721, Ownable {
    uint256 public nextTokenId;

    constructor() ERC721("MiniNFT", "MINI") Ownable(msg.sender) {}

    function mint(address to) external onlyOwner {
        uint256 tokenId = nextTokenId;
        nextTokenId++;
        _safeMint(to, tokenId);
    }
}
