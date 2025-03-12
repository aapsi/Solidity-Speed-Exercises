// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract MemoryArray {
    function main(uint8 a) public pure returns (uint256[] memory) {
        // return an array that goes from 0 to a
        // for example, if a is 3, return [0, 1, 2]
        uint256[] memory arr = new uint256[](a); 
        for (uint8 i = 0; i < a;) { // i++ is not used here
            arr[i] = i;
            unchecked {
                i++; // i is incremented here instead since i< a is checked in the for loop
                // we can use unchecked here since we are sure that i will not overflow
            }   
        }
        return arr;
    }
}
