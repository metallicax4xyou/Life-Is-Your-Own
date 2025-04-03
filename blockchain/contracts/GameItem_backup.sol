// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28; // Using the default from latest hardhat-toolbox setup

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract GameItem is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("LifeIsFeudalItem", "LIFI") Ownable(msg.sender) {
        // Ownable(msg.sender) sets the deployer as the initial owner
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    // --- Overrides required by Solidity 0.8+ with multiple inheritance ---
    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, Ownable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, Ownable)
    {
        super._increaseBalance(account, value);
    }
}
