// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/utils/Counters.sol"; // Just this import

contract TestImport {
    using Counters for Counters.Counter;
    Counters.Counter private _testCounter;

    function increment() public {
        _testCounter.increment();
    }
}
