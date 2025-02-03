// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "../src/GenomicRollup.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        new GenomicRollup();
        vm.stopBroadcast();
    }
}
