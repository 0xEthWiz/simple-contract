use starknet::ContractAddress;

#[starknet::interface]
trait ISimpleContract<TContractState> {
    fn add_one(ref self: TContractState);
    fn get_num(self: @TContractState) -> u8;
    fn get_owner(self: @TContractState) -> ContractAddress;
}

#[starknet::contract]
mod SimpleContract {
    use starknet::ContractAddress;
    use starknet::get_caller_address;

    #[storage]
    struct Storage {
        num: u8,
        owner: ContractAddress,
    }
    #[constructor]
    fn constructor(ref self: ContractState, owner: ContractAddress) {
        self.owner.write(owner);
    }

    #[external(v0)]
    impl SimpleContract of super::ISimpleContract<ContractState> {
        fn add_one(ref self: ContractState) {
            assert(get_caller_address() == self.owner.read(), 'only owner!');
            let new_num = self.num.read() + 1;
            self.num.write(new_num);
        }

        fn get_num(self: @ContractState) -> u8 {
            self.num.read()
        }

        fn get_owner(self: @ContractState) -> ContractAddress {
            self.owner.read()
        }
    }
}
