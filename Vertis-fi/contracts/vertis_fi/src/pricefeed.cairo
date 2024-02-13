#[starknet::contract]
mod Vertis_fi_pricefeed {
    use pragma_lib::types::{AggregationMode, DataType, PragmaPricesResponse};
    use pragma_lib::abi::{IPragmaABIDispatcher, IPragmaABIDispatcherTrait};
    use starknet::{ContractAddress, contract_address};

    // const KEY_BTC: felt252 = 'BTC/USD';
    // const KEY_ETH: felt252 = 'ETH/USD';
    // const KEY_WBTC: felt252 = 'WBTC/USD';
    // const KEY_WTBC_BTC: felt252 = 'WBTC/BTC';
    // const KEY_WSTETH: felt252 = 'WSTETH/USD';
    // const KEY_LORDS: felt252 = 'LORDS/USD';
    // const KEY_UNI: felt252 = 'UNI/USD';

    // const KEY_USDT: felt252 = 'USDT/USD';
    // const KEY_DAI: felt252 = 'DAI/USD';
    // const KEY_USDC: felt252 = 'USDC/USD';
    // const KEY_LUSD: felt252 = 'LUSD/USD';

    // const BTC_PAIR_ID: u128 = 18669995996566340;
    // const ETH_PAIR_ID: u128 = 19514442401534788;
    // const WBTC_PAIR_ID: u128 = 6287680677296296772;
    // const WBTC_BTC_PAIR_ID: u128 = 6287680677295051843;
    // const WSTETH_PAIR_ID: u128 = 412383036120118613857092;
    // const LORDS_PAIR_ID: u128 = 1407668255603079598916;
    // const UNI_PAIR_ID: u128 = 24011449254105924;

    // const USDT_PAIR_ID: u128 = 6148333044652921668;
    // const DAI_PAIR_ID: u128 = 19212080998863684;
    // const USDC_PAIR_ID: u128 = 6148332971638477636;
    // const LUSD_PAIR_ID: u128 = 5500394072219931460;

    #[storage]
    struct Storage {
        pragma_contract: ContractAddress,
    }

    #[constructor]
    fn constructor(ref self: ContractState, pragma_address: ContractAddress) {
        self.pragma_contract.write(pragma_address);
    }

    #[abi(embed_v0)]
    fn get_asset_price(ref self: ContractState, key: felt252) -> u128 {
        let pragma_address: ContractAddress = self.pragma_contract.read();
        self.get_asset_price_median(pragma_address, DataType::SpotEntry(key))
    }

    #[generate_trait]
    impl Private of PrivateTrait {
        fn get_asset_price_median(
            ref self: ContractState, pragma_address: ContractAddress, asset: DataType
        ) -> u128 {
            let pragma_despatcher = IPragmaABIDispatcher { contract_address: pragma_address };
            let output: PragmaPricesResponse = pragma_despatcher
                .get_data(asset, AggregationMode::Median(()));
            output.price
        }
    }
}
