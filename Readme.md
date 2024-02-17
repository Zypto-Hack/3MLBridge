# 3ML_Bridge and Decentralized Exchange

 3ML_Bridge  makes use of the Herodotus Api to enable bridgeing tokens between the starknet chain annd other chain like ethereum, polygon and the binance chain and also facilitates exchange of both currencies and tokens.

## Table of Contents

1. [Features](#features)
2. [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
3. [Usage](#usage)
    - [Herodotus Bridge](#herodotus-bridge)

## Features

### Herodotus Bridge

1. **Token Transfer:**
    - Facilitate token transfers between Ethereum and Binance Smart Chain.
    - Allows users to transfer **tokens from or to** starknet.

2. **Cross-Chain Communication:**
    - Establish communication with Ethereum and other supported chains for cross-chain operations from the starknet chain.
    - Implement the Herodotus messaging protocol for secure data exchange.
    - An information or bloglike page for where users can view realtime information about coins/ tokens  on different chains and their bridge market value.

3. **Trading Pairs:**
    - Support trading pairs such as ETH/BUSD, BTC/USDT, etc.
    - Use the decentralized exchange API with endpoints like `/trade` and `/market` for trading operations.
4. **Swap:**
    - The jediSwap V2 contract is used to facilitate smooth swap between tokens for user's better experience.

5. **Order Book Management:**
    - Implement order matching algorithms for efficient trade execution.
    - Manage order books with the `/orderbook` endpoint.

6. **Liquidity Pool:**
    - Enable users to contribute liquidity using the `/liquidity` endpoint.
    - Implement automated market-making (AMM) for efficient liquidity provision.

7. **Lending Feature:**
    - Enable users to Borrow assets.
    - over-collateralization issue when lending to users is managed by making use of accurate real time exchange data for supported collaterals.

8. **Staking Feature:**
    - Users an participate in staking of assets on tthe staking page with good yeild over time.

9. **Storage proof Interface:**
    - Interface where developers can easily check for storage proofs without a need to write codes. This could be a playground to demostrate how the heterodus api can be used by developers.

# Getting Started

### Installation

1. Clone the repository:

```bash
git clone https://github.com/Zypto-Hack/3MLBridge
```

2. Install dependencies:

```bash
cd 3ML_Bridge
npm install
```

3. Configure environment variables:
   

<br />
### Deployed Contracts
Swap address on Goerli: 0x00c6f504626a6eeee117998150bdbf9d9678f2861ce87bb2550a2624506914ed
Pragma Oracle Address: 0x0289d94a29515e5f30ffd5a45667ae087d69ba1a65e198c90c1cc9d34868badf
