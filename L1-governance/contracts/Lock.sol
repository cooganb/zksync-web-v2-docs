//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@matterlabs/zksync-contracts/l1/contracts/zksync/interfaces/IZkSync.sol";

contract Governance {
    address public governor;
    uint public DEPOSIT_GAS_PER_PUBDATA_LIMIT;
    constructor() {
        governor = msg.sender;
        DEPOSIT_GAS_PER_PUBDATA_LIMIT = 800;
    }

    function callZkSync(
        address zkSyncAddress,
        address contractAddr,
        bytes memory data,
        uint64 l2GasLimit
        // removed because the following variables are declared in the requestL2Transaction
        // function, and include constants
        // uint256 l2GasPerPubdataByteLimit,
        // bytes[] memory factoryDeps,
        // address refundRecipient
    ) external payable {
        require(msg.sender == governor, "Only governor is allowed");

        IZkSync zksync = IZkSync(zkSyncAddress);
        zksync.requestL2Transaction{value: msg.value}(contractAddr, 0, data, l2GasLimit, DEPOSIT_GAS_PER_PUBDATA_LIMIT, new bytes[](0), msg.sender);
    }
}