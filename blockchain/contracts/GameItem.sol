// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; // Use a version compatible with Hardhat default and OpenZeppelin

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; // To restrict minting
import "@openzeppelin/contracts/utils/Counters.sol"; // To safely generate token IDs

contract GameItem is ERC721, Ownable {
        using Counters for Counters.Counter;
            Counters.Counter private _tokenIdCounter;

                // Constructor: Sets the name and symbol for your NFT collection
                    constructor() ERC721("LifeIsFeudalItem", "LIFI") {
                                // ERC721("Collection Name", "SYMBOL")
                    }

                        // Function to create a new NFT (only the owner/deployer can call this)
                            // In a real scenario, your API/server would trigger this securely.
                                function safeMint(address to) public onlyOwner {
                                            uint256 tokenId = _tokenIdCounter.current();
                                                    _tokenIdCounter.increment();
                                                            _safeMint(to, tokenId);
                                }

                                    // --- Optional: Add functions later for metadata, etc. ---
}
                                }
                    }
}