// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract IsNBitSet {

    // [PASS] test_IsNBitSet() (gas: 17024)
    // [PASS] test_IsNBitSet_false() (gas: 14541)
    function main(bytes32 x, uint256 n) public returns (bool result) {
        // return true if the nth bit is set
        // 000....0001 with n = 0 returns true
        // 000....0001 with n = 1 returns false
        // 000....0010 with n = 1 returns true

        assembly {
            result := eq(and(shr(n, x), 0x1), 0x1)
        }
    }


    // [PASS] test_IsNBitSet1() (gas: 17228)
    // [PASS] test_IsNBitSet_false1() (gas: 14684)
    function main1(bytes32 x, uint256 n) public pure returns (bool) {
        // return true if the nth bit is set
        // 000....0001 with n = 0 returns true
        // 000....0001 with n = 1 returns false
        // 000....0010 with n = 1 returns true

        uint256 b = uint256(x);
        return ((b >> n) & 1) == 1;

        
    }
}