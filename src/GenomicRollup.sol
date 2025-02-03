// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/// @title Genomic Data Rollup - zkSync Layer 2 Contract
/// @dev Simulates genomic data encryption and rollup using Merkle Trees
contract GenomicRollup {
    mapping(address => bytes32) public genomicDataHashes;
    bytes32 public merkleRoot;

    event DataStored(address indexed user, bytes32 indexed dataHash);
    event MerkleRootUpdated(bytes32 indexed newMerkleRoot);

    /// @notice Stores encrypted genomic data as a hash
    function storeGenomicData(bytes32 _dataHash) external {
        genomicDataHashes[msg.sender] = _dataHash;
        emit DataStored(msg.sender, _dataHash);
    }

    /// @notice Updates the Merkle root for genomic data rollup
    function updateMerkleRoot(bytes32 _newRoot) external {
        merkleRoot = _newRoot;
        emit MerkleRootUpdated(_newRoot);
    }

    /// @notice Verifies if a given hash is part of the rollup using a Merkle proof
    function verifyData(bytes32 _leaf, bytes32[] memory _proof) external view returns (bool) {
        bytes32 computedHash = _leaf;
        for (uint256 i = 0; i < _proof.length; i++) {
            if (computedHash < _proof[i]) {
                computedHash = keccak256(abi.encodePacked(computedHash, _proof[i]));
            } else {
                computedHash = keccak256(abi.encodePacked(_proof[i], computedHash));
            }
        }
        return computedHash == merkleRoot;
    }
}
