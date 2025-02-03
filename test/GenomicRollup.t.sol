// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../src/GenomicRollup.sol";

contract GenomicRollupTest is Test {
    GenomicRollup rollup;

    function setUp() public {
        rollup = new GenomicRollup();
    }

    function testStoreGenomicData() public {
        bytes32 dummyData = keccak256(abi.encodePacked("genomic-sequence-123"));
        rollup.storeGenomicData(dummyData);
        assertEq(rollup.genomicDataHashes(address(this)), dummyData);
    }

    function testUpdateMerkleRoot() public {
        bytes32 newRoot = keccak256(abi.encodePacked("newMerkleRoot"));
        rollup.updateMerkleRoot(newRoot);
        assertEq(rollup.merkleRoot(), newRoot);
    }
}
