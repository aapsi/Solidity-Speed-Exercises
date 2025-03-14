// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract Multiplication {

    // [PASS] test_multiply_case1() (gas: 10048)
    // [PASS] test_multiply_case2() (gas: 10006)
    // [PASS] test_multiply_case3() (gas: 9778)
    function multiply(uint8 rewards, uint8 numDays) public pure returns (uint256 totalRewards) {
        // TODO: Implement the logic to calculate the total rewards, which is
        // the number of rewards multiplied by the number of days.
        totalRewards = uint256(rewards) * numDays;

    }


    // [PASS] test_multiply_case1() (gas: 9826)
    // [PASS] test_multiply_case2() (gas: 9784)
    // [PASS] test_multiply_case3() (gas: 9556)
    function multiply2(uint8 rewards, uint8 numDays) public pure returns (uint256 totalRewards) {
        assembly {
            let step := mul(rewards, numDays)
            if slt(step, 0) {
                totalRewards:= sub(0,step)
            }
            totalRewards := step
        }
    }
}