# Simple Storage Application using Ganache and Truffle 

## 1. Project Initialization and Installation

- Initialize npm project:
```
npm init -y
```
This creates a `package.json` file to manage project dependencies.

- Install Truffle globally or use npx to run it without global install:
```
npm install -g truffle
```
or use
```
npx truffle
```
Truffle is a development framework for Ethereum smart contracts.

- Initialize Truffle project:
```
npx truffle init
```
This sets up the basic Truffle project structure with contracts, migrations, and configuration files.

## 2. Smart Contract Code

File: `contracts/SimpleStorage.sol`

```solidity
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 private storedData;

    function set(uint256 x) public {
        storedData = x;
    }

    function get() public view returns (uint256) {
        return storedData;
    }
}
```

Explanation:
- `storedData` is a private unsigned integer variable.
- `set` function updates the stored value.
- `get` function returns the stored value.

## 3. Migration Script

File: `migrations/1_deploy_contracts.js`

```js
const SimpleStorage = artifacts.require("SimpleStorage");

module.exports = function (deployer) {
  deployer.deploy(SimpleStorage);
};
```

This script deploys the `SimpleStorage` contract to the blockchain.

## 4. Truffle Configuration

File: `truffle-config.js`

```js
module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",     // Localhost
      port: 7545,            // Ganache GUI default port
      network_id: "*",       // Match any network id
    },
  },
  compilers: {
    solc: {
      version: "0.8.0",      // Solidity compiler version
    },
  },
};
```

## 5. Running the Project

### Compile Contracts

```
npx truffle compile
```

Compiles the Solidity contracts and generates artifacts.

### Migrate Contracts

```
npx truffle migrate --reset
```

Deploys the contracts to the local Ganache blockchain.

### Interact with Contract via Truffle Console

Open the console:

```
npx truffle console
```

Inside the console, run:

```js
// Get deployed contract instance
const contract = await SimpleStorage.deployed()

// Check initial value
(await contract.get()).toString()   // Output: "0"

// Set a new value
await contract.set(49)

// Read updated value
(await contract.get()).toString()   // Output: "49"
```

Explanation:
- `get()` returns a BigNumber, so `.toString()` converts it to a readable number.
- `set(value)` updates the stored value on the blockchain.
- The console output for `set()` shows transaction details confirming success.

---

This record provides a complete step-by-step guide to create, deploy, and interact with a simple storage smart contract using Ganache and Truffle.
