// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { LibDiamond } from "../libraries/LibDiamond.sol";

contract DecrementFacet {
  function DecrementCounter() public {
    LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
    ds.counter -= 1;
  }
}
