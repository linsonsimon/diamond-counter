// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { LibIncrement } from "../libraries/LibIncrement.sol";

contract IncrementFacet {
  function incrementCounter() public {
    uint256 currentCounter = LibIncrement.getCounter() + 1;
    LibIncrement.setCounter(currentCounter);
  }

  function display() public returns (uint256) {
    return LibIncrement.getCounter();
  }
}
