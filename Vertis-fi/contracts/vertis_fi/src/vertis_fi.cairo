use starknet::ContractAddress;
// use serde::Serde;

#[derive(Serde, Drop)]
struct i32 {
    mag: u32,
    sign: bool,
}

#[derive(Serde, Drop)]
struct i128 {
    mag: u128,
    sign: bool,
}

#[derive(Serde, Drop)]
struct i256 {
    mag: u256,
    sign: bool,
}

#[derive(Serde, Drop)]
struct ExactInputSingleParams {
    token_in: ContractAddress,
    token_out: ContractAddress,
    fee: u32,
    recipient: ContractAddress,
    deadline: u64,
    amount_in: u256,
    amount_out_minimum: u256,
    sqrt_price_limit_X96: u256
}

#[derive(Serde, Drop)]
struct ExactInputParams {
    path: Array<felt252>,
    recipient: ContractAddress,
    deadline: u64,
    amount_in: u256,
    amount_out_minimum: u256
}

#[derive(Serde, Drop)]
struct ExactOutputSingleParams {
    token_in: ContractAddress,
    token_out: ContractAddress,
    fee: u32,
    recipient: ContractAddress,
    deadline: u64,
    amount_out: u256,
    amount_in_maximum: u256,
    sqrt_price_limit_X96: u256
}

#[derive(Serde, Drop)]
struct ExactOutputParams {
    path: Array::<felt252>,
    recipient: ContractAddress,
    deadline: u64,
    amount_out: u256,
    amount_in_maximum: u256
}

#[starknet::interface]
trait IJediSwapV2SwapRouter<TContractState> {
    fn get_factory(self: @TContractState) -> ContractAddress;
    fn exact_input_single(ref self: TContractState, params: ExactInputSingleParams) -> u256;
    fn exact_input(ref self: TContractState, params: ExactInputParams) -> u256;
    fn exact_output_single(ref self: TContractState, params: ExactOutputSingleParams) -> u256;
    fn exact_output(ref self: TContractState, params: ExactOutputParams) -> u256;
    fn jediswap_v2_swap_callback(
        ref self: TContractState,
        amount0_delta: i256,
        amount1_delta: i256,
        callback_data_span: Span<felt252>
    );
}

#[starknet::interface]
trait IJediSwapV2Factory<TContractState> {
    fn fee_amount_tick_spacing(self: @TContractState, fee: u32) -> u32;
    fn get_pool(
        self: @TContractState, token_a: ContractAddress, token_b: ContractAddress, fee: u32
    ) -> ContractAddress;
    fn get_fee_protocol(self: @TContractState) -> u8;

    fn create_pool(
        ref self: TContractState, token_a: ContractAddress, token_b: ContractAddress, fee: u32
    ) -> ContractAddress;
    fn enable_fee_amount(ref self: TContractState, fee: u32, tick_spacing: u32);
    fn set_fee_protocol(ref self: TContractState, fee_protocol: u8);
}

#[starknet::interface]
trait IOwnable<TState> {
    fn owner(self: @TState) -> ContractAddress;
    fn transfer_ownership(ref self: TState, new_owner: ContractAddress);
    fn renounce_ownership(ref self: TState);
}

#[starknet::contract]
mod Vertis_fi {


    use super::{
        IJediSwapV2FactoryDispatcher, IJediSwapV2FactoryDispatcherTrait, IJediSwapV2SwapRouterDispatcher, IJediSwapV2SwapRouterDispatcherTrait
    };
    use starknet::{ContractAddress};


    #[storage]
    struct Storage {
        Jediswap: IJediSwapV2FactoryDispatcher,
        SwapRouter: IJediSwapV2SwapRouterDispatcher,
        owner: ContractAddress
    }

    #[constructor]
    fn constructor(ref self: ContractState, jediswap_factory: ContractAddress, swap_router: ContractAddress, owner: ContractAddress) {
        self.Jediswap.write(IJediSwapV2FactoryDispatcher { contract_address: jediswap_factory });
        self.SwapRouter.write(IJediSwapV2SwapRouterDispatcher { contract_address: swap_router });
        self.owner.write(owner);
    }

    #[abi(embed_v0)]
    fn create_pool(
        ref self: ContractState, token_a: ContractAddress, token_b: ContractAddress, fee: u32
    ) -> ContractAddress {
    //     assert(token_a.is_non_zero(), 'invalid token_a address');
    //     assert(token_b.is_non_zero(), 'invalid token_b address');
        let pool_address: ContractAddress = self.Jediswap.read().create_pool(token_a, token_b, fee);
        return pool_address;
    }

    #[abi(embed_v0)]
    fn get_pool(self: @ContractState, token_a: ContractAddress, token_b: ContractAddress, fee: u32) -> ContractAddress {
        self.Jediswap.read().get_pool(token_a, token_b, fee)
    }
    
    #[abi(embed_v0)]
    fn get_fee_protocol(self: @ContractState) -> u8 {
        self.Jediswap.read().get_fee_protocol()
    }

    fn fee_amount_tick_spacing(self: @ContractState, fee: u32) -> u32 {
        self.Jediswap.read().fee_amount_tick_spacing(fee)
    }

    fn enable_fee_amount(ref self: ContractState, fee: u32, tick_spacing: u32) {
        self.Jediswap.read().enable_fee_amount(fee, tick_spacing);
    }

    fn set_fee_protocol(ref self: ContractState, fee_protocol: u8) {
        self.Jediswap.read().set_fee_protocol(fee_protocol);
    }

}
