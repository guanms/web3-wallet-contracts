// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/MiniNFT.sol";

contract MiniNFTTest is Test {
    MiniNFT nft;

    function setUp() public {
        nft = new MiniNFT();
    }

    function testMint() public {
        nft.mint(address(0x1));
        assertEq(nft.ownerOf(0), address(0x1));
    }
}

