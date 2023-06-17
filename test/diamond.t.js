const { expect } = require("chai");

// HELPER: get function selectors from a contract
function getSelectors(contract) {
  // get the function signatures from the ABI of the contract:
  const signatures = Object.keys(contract.interface.functions);
  // convert from signature to selector:
  const selectors = signatures.reduce((acc, val) => {
    acc.push(contract.interface.getSighash(val));
    return acc;
  }, []);
  return selectors;
}

describe("Create a Simple Diamond Contract", async function () {
  let diamond;
  let tx;
  let receipt;
  let alice;
  let bob;

  /* Before each test - run this setup */
  before(async function () {
    [contractOwner, alice, bob] = await ethers.getSigners();

    // deploy simple Diamond
    const Diamond = await ethers.getContractFactory("Diamond");
    diamond = await Diamond.deploy(contractOwner.address);
    await diamond.deployed();

    console.log("Diamond deployed:", diamond.address);
  });

  it("add incrementfacet to diamond", async () => {
    const IncrementFacet = await ethers.getContractFactory("IncrementFacet");
    const incrementFacet = await IncrementFacet.deploy();
    await incrementFacet.deployed();
    const selectors = getSelectors(incrementFacet);

    tx = await diamond.diamondCut(
      {
        facetAddress: incrementFacet.address, // the nft facet is deployed here
        functionSelectors: selectors, // these are the selectors of this facet (the functions that are supported)
      },
      { gasLimit: 800000 }
    );
    receipt = await tx.wait();
    if (!receipt.status) {
      throw Error(`Diamond upgrade failed: ${tx.hash}`);
    }
  });

  it("add incrementfacet to diamond", async () => {
    const DecrementFacet = await ethers.getContractFactory("DecrementFacet");
    const decrementFacet = await DecrementFacet.deploy();
    await decrementFacet.deployed();
    const selectors = getSelectors(decrementFacet);

    tx = await diamond.diamondCut(
      {
        facetAddress: decrementFacet.address, // the nft facet is deployed here
        functionSelectors: selectors, // these are the selectors of this facet (the functions that are supported)
      },
      { gasLimit: 800000 }
    );
    receipt = await tx.wait();
    if (!receipt.status) {
      throw Error(`Diamond upgrade failed: ${tx.hash}`);
    }
    // console.log(diamond);
  });

  it("accessing incrementfacet functions", async () => {
    const incrementFacet = await ethers.getContractAt(
      "IncrementFacet",
      diamond.address
    );
    const tx = await incrementFacet.incrementCounter();
    tx.wait();
    const demo = await incrementFacet.display();
    demo.wait();
    console.log(demo);
  });
});
