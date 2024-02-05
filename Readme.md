# 3ML_Bridge and Decentralized Exchange


 3ML_Bridge  makes use of the Herodotus Api to enable bridgeing tokens between the starknet chain annd other chain like ethereum, polygon and the binance chain and also facilitates exchange of both currencies and tokens.

## Table of Contents

1. [Features](#features)
2. [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
3. [Usage](#usage)
    - [Herodotus Bridge](#herodotus-bridge)
    - [Decentralized Exchange](#decentralized-exchange)


## Features

### Herodotus Bridge

1. **Token Transfer:**
    - Facilitate token transfers between Ethereum and Binance Smart Chain.
    - Allows users to transfer **tokens from or to** starknet.

2. **Cross-Chain Communication:**
    - Establish communication with Ethereum and Binance Smart Chain for cross-chain operations from the starknet chain.
    - Implement the Herodotus messaging protocol for secure data exchange.
    - An information or bloglike page for where users can view realtime information about coins/ tokens  on different chains and their bridge market value.

3. **Trading Pairs:**
    - Support trading pairs such as ETH/BUSD, BTC/USDT, etc.
    - Use the decentralized exchange API with endpoints like `/trade` and `/market` for trading operations.

4. **Order Book Management:**
    - Implement order matching algorithms for efficient trade execution.
    - Manage order books with the `/orderbook` endpoint.

5. **Liquidity Pool:**
    - Enable users to contribute liquidity using the `/liquidity` endpoint.
    - Implement automated market-making (AMM) for efficient liquidity provision.


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