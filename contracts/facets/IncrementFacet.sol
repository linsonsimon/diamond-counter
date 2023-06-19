// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { LibDiamond } from "../libraries/LibDiamond.sol";

contract IncrementFacet {
  function IncrementCounter() external {
    LibDiamond.DiamondStorage storage ds = LibDiamond.diamondStorage();
    ds.counter += 1;
  }

  function Display() external view returns (int256) {
    return LibDiamond.diamondStorage().counter;
  }
}
