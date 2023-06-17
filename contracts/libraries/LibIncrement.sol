/// SPDX-License-Identifier: MIT
pragma solidity =0.8.9;

library LibIncrement {
  bytes32 constant INCREMENT_STORAGE_POSITION =
    keccak256("facet.increment.diamond.storage");

  /**
   * @notice ERC20 storage for the ERC20 facet
   */
  struct Storage {
    uint256 _counter;
  }

  // access erc20 storage via:
  function getStorage() internal pure returns (Storage storage ds) {
    bytes32 position = INCREMENT_STORAGE_POSITION;
    assembly {
      ds.slot := position
    }
  }

  function setCounter(uint256 count) internal {
    Storage storage ds = getStorage();
    ds._counter = count;
  }

  function getCounter() internal view returns (uint256) {
    Storage storage ds = getStorage();
    return ds._counter;
  }
}
