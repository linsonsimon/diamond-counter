// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { LibIncrement } from "../libraries/LibIncrement.sol";

contract DecrementFacet {
  function decrementCounter() public {
    uint256 currentCounter = LibIncrement.getCounter() - 1;
    LibIncrement.setCounter(currentCounter);
  }
}
