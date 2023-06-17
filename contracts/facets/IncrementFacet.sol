// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { LibDiamond } from "../libraries/LibDiamond.sol";

contract IncrementFacet {
  function incrementCounter() public {
    uint256 currentCounter = LibDiamond.getCounter() + 1;
    LibDiamond.setCounter(currentCounter);
  }

  function display() public returns (uint256) {
    return LibDiamond.getCounter();
  }
}
