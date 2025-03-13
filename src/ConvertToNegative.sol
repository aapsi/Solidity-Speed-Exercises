// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract ConvertToNegative {
    error TooBig();

    function convertToNegative(uint256 x) external pure returns (int256) {
        // return -x
        // if -x cannot be computed, revert with "TooBig()"
        // do not hardcode any constants

        // int256 range => -2 ** 255 to 2 ** 255 - 1
        // uint256 range => 0 to 2 ** 256 -1
        if(x > (uint256(type(int256).max) + 1)) revert TooBig();
        // if x = 2 ** 255 then we can't do the conversion int256(2 ** 255) because it crosses teh range so we have to handle it separately
        if(x == uint256(type(int256).max) + 1) {
            return type(int256).min;
        }
        return -int256(x);

        // ASK QUESTION
        
    }
}