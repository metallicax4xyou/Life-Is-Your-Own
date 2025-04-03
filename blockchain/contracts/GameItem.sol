// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; // Use a version compatible with Hardhat default and OpenZeppelin

// --- Make sure these import paths are exactly correct ---
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; // To restrict minting
import "@openzeppelin/contracts/utils/Counters.sol"; // To safely generate token IDs
// --- --- --- --- --- --- --- --- --- --- --- --- --- ---

contract GameItem is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    // Constructor: Sets the name and symbol for your NFT collection
    // You can change "LifeIsFeudalItem" and "LIFI" if you want
    constructor() ERC721("LifeIsFeudalItem", "LIFI") Ownable(msg.sender) {
        // The Ownable(msg.sender) part explicitly sets the deployer as the owner
        // This is good practice with newer OpenZeppelin versions.
    }

    // Function to create a new NFT (only the owner/deployer can call this)
    // In a real scenario, your API/server would trigger this securely.
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    // --- Optional: Add functions later for metadata, etc. ---

    // Override required by newer Solidity versions when inheriting Ownable
    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, Ownable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    // Override required by newer Solidity versions when inheriting Ownable
    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, Ownable)
    {
        super._increaseBalance(account, value);
    }
}
