// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { LibDiamond } from "../libraries/LibDiamond.sol";

contract IncrementFacet {
  function incrementCounter() public {
    uint256 currentCounter = LibDiamond.getCounter();
    LibDiamond.setCounter(currentCounter + 1);
  }
}
