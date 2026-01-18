// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import "../src/MiniNFT.sol";

contract DeployMiniNFT is Script {
    function run() external returns (MiniNFT) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        MiniNFT miniNFT = new MiniNFT();

        vm.stopBroadcast();

        console.log("MiniNFT deployed at:", address(miniNFT));

        return miniNFT;
    }
}
