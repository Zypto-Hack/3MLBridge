# VERTIS_FI

## Pricefeed Generation

This contract serves as a price feed for various assets on the Vertis platform. It interacts with the pragma oracle to fetch asset prices using aggregation modes.



### Storage

The contract contains a single storage struct `Storage`, which holds the address of the pragma contract.

```rust
#[storage]
struct Storage {
    pragma_contract: ContractAddress,
}
```

### Constructor

The constructor initializes the contract state with the address of the pragma contract.

```rust
#[constructor]
fn constructor(ref self: ContractState, pragma_address: ContractAddress) {
    self.pragma_contract.write(pragma_address);
}
```

### get_asset_price

This ABI function fetches the price of a specified asset using its key from the pragma contract.

```rust
#[abi(embed_v0)]
fn get_asset_price(ref self: ContractState, key: felt252) -> u128 {
    let pragma_address: ContractAddress = self.pragma_contract.read();
    self.get_asset_price_median(pragma_address, DataType::SpotEntry(key))
}
```

### get_asset_price_median

This private function fetches the median price of a specified asset from the pragma contract.

```rust
#[generate_trait]
impl Private of PrivateTrait {
    fn get_asset_price_median(
        ref self: ContractState, 
        pragma_address: ContractAddress, 
        asset: DataType
    ) -> u128 {
        let pragma_despatcher = IPragmaABIDispatcher { contract_address: pragma_address };
        let output: PragmaPricesResponse = pragma_despatcher
            .get_data(asset, AggregationMode::Median(()));
        output.price
    }
}
```




## SWAPPING

The `Vertis_fi` contract serves as a bridge between the Vertis platform and the JediSwapV2 ecosystem. It facilitates various DeFi operations such as creating liquidity pools and token swaps.

## Features

- **JediSwapV2 Integration**: Provides seamless interaction with JediSwapV2 contracts for liquidity management and token swapping.

    This section implements functions for creating and managing liquidity pools within the JediSwapV2 ecosystem.

```rust
// Implementation of JediSwapV2Factory interface
 #[abi(embed_v0)]
    impl IJediSwapV2FactoryImpl of IJediSwapV2Factory<ContractState> {

    }
```

- **Liquidity Pool Creation**: Users can create new liquidity pools using the JediSwapV2 factory contract, specifying token pairs and fee structures.

```rust
// Example: Creating a liquidity pool
    fn create_pool(
                ref self: ContractState, token_a: ContractAddress, token_b: ContractAddress, fee: u32
            ) -> ContractAddress {
                assert(token_a.is_non_zero(), 'invalid token_a address');
                assert(token_b.is_non_zero(), 'invalid token_b address');
                let pool_address: ContractAddress = self
                    .Jediswap
                    .read()
                    .create_pool(token_a, token_b, fee);
                return pool_address;
            }
```

- **Token Swapping**: Facilitates token swaps through the JediSwapV2 swap router contract, supporting different swap types such as exact input and exact output.

```rust
// Example: Executing a token swap
fn exact_input_single(ref self: ContractState, params: ExactInputSingleParams) -> u256 {
    
}
```

- **Ownership Management**: Includes functions for managing contract ownership, allowing for smooth transition of control when needed.

```rust
// Example: Transferring ownership
fn transfer_ownership(ref self: ContractState, new_owner: ContractAddress) {
    
}
```