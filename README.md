# A Simple Example of a Diamond Contract

## The Background

The purpose of this repo is to increment and decrement the value of the counter.
there are 2 facets,

1. incrementFacet => it has increment function which increments the value of the counter stored in the LibIncrement.sol
2. decrementFacet => decerement the value of counter.

the diamond code is being used from the repo: https://github.com/jesperkristensen58/example-diamond-proxy-contract.git

## How to Run it

To run it, simply type:

```shell
> npm i
```

```shell
> npx hardhat test

```

That's it.
