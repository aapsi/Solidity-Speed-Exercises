// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract IsFirstBitSet {

//     [PASS] test_IsFirstBitSet() (gas: 15451)
//     [PASS] test_IsFirstBitSet1() (gas: 15586)
//     [PASS] test_IsFirstBitSet2() (gas: 16226)
    function main1(bytes32 x) public pure returns (bool result) {
        // return true if the first bit is set
        // for example 0x000....0001 returns true
        // for example 0x000....0010 returns false
        assembly {
            result:= eq(and(x, 0x1), 0x1)

        }
    }

    function main2(bytes32 x) public pure returns (bool) {
        // return true if the first bit is set
        // for example 0x000....0001 returns true
        // for example 0x000....0010 returns false
        return (uint256(x) % 2 == 1); // as odd numbers have the first bit set
    }

    function main(bytes32 x) public pure returns (bool) {
        // return true if the first bit is set
        // for example 0x000....0001 returns true
        // for example 0x000....0010 returns false
        return (uint256(x) & 1 == 1);
    }
}
