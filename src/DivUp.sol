// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract DivUp {


// [PASS] test_divUp_case1() (gas: 9633)
// [PASS] test_divUp_case2() (gas: 9671)
// [PASS] test_divUp_case3(uint256) (runs: 258, μ: 10302, ~: 10302)
// [PASS] test_divUp_case4() (gas: 9625)
// [PASS] test_divUp_case5() (gas: 9634)
    function divUp2(uint256 x, uint256 y) public pure returns (uint256) {
        // return x / y rounded up.
        // if y divides x exactly, return x / y
        // if there is a fractional part in the quotient, add 1 to the answer
        // if y == 0 revert

        assembly {
            if eq(y, 0) {
                revert(0, 0)
            }
            let quo := div(x, y)
            let rem := mod(x, y)
            let res := quo
            if iszero(eq(rem, 0)) {
                res := add(quo, 1)
            }
            mstore(0, res)
            return(0, 0x20)
        }
    }

    // [PASS] test_divUp_case1() (gas: 10324)
    // [PASS] test_divUp_case2() (gas: 10348)
    // [PASS] test_divUp_case3(uint256) (runs: 258, μ: 10993, ~: 10993)
    // [PASS] test_divUp_case4() (gas: 10302)
    // [PASS] test_divUp_case5() (gas: 10325)
    function divUp(uint256 x, uint256 y) public pure returns (uint256) {
        require( y != 0, "invalid input");
        return (x + y - 1) / y;
    }
}
