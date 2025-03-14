// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract MultiplyConstant {

    // [PASS] test_multiply_case1() (gas: 9411)
    // [PASS] test_multiply_case2() (gas: 9369)
    // [PASS] test_multiply_case3() (gas: 9267)
    function multiply2(uint16 x) public pure returns (uint256 fiveTimesX) {
        // TODO: Implement the logic to calculate the five times of x.
        assembly {
            fiveTimesX := mul(x,5)
        }
    }

    // [PASS] test_multiply_case1() (gas: 9657)
    // [PASS] test_multiply_case2() (gas: 9615)
    // [PASS] test_multiply_case3() (gas: 9513)
    function multiply3(uint16 x) public pure returns (uint256 fiveTimesX) {
        // TODO: Implement the logic to calculate the five times of x.
        return uint256(x) * 5;
    }

    // [PASS] test_multiply_case1() (gas: 9631)
    // [PASS] test_multiply_case2() (gas: 9589)
    // [PASS] test_multiply_case3() (gas: 9487)
    function multiply4(uint16 x) public pure returns (uint256 fiveTimesX) {
        // TODO: Implement the logic to calculate the five times of x.
        return (uint256(x) << 2) + uint256(x);
    }

    // [PASS] test_multiply_case1() (gas: 9459)
    // [PASS] test_multiply_case2() (gas: 9417)
    // [PASS] test_multiply_case3() (gas: 9315)
    function multiply(uint16 x) public pure returns (uint256 fiveTimesX) {
        // TODO: Implement the logic to calculate the five times of x.
        assembly {
            fiveTimesX := add(shl(2,x), x)
        }
    }

}
