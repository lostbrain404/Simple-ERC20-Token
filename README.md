# MyToken (ITN)

A simple and minimal ERC-20 token implementation written in Solidity.

## 📜 Overview

**MyToken** is a basic ERC20-compatible smart contract deployed on Ethereum-compatible blockchains. It includes essential functionalities such as transferring tokens, approving spenders, and transferring tokens via delegated allowance.

This token is designed for educational purposes and light use-cases such as internal dApps, prototyping, or demo environments.

---

## ⚙️ Features

- Token name: `MyToken`
- Symbol: `ITN`
- Decimals: `18`
- Initial total supply assigned to the deployer
- Supports:
  - `transfer`
  - `approve`
  - `transferFrom`
  - `allowance` and `balanceOf` view functions
- Emits standard `Transfer` and `Approval` events

---

## 📦 Deployment

### Constructor

```solidity
constructor(uint256 _initialSupply)
