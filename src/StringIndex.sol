// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract StringIndex {

// [PASS] test_StringIndex1() (gas: 11936)
// [PASS] test_StringIndex2() (gas: 11937)
// [PASS] test_StringIndex3() (gas: 11916)
    function main(string memory str, uint256 index) public pure returns (string memory) {
        // return the character at index in str
        // assume str only consists of ascii characters
        bytes memory b = bytes(str);
        require(index < b.length, "Index out of bounds");

        // return the character at index
            bytes memory result = new bytes(1);
            result[0] = b[index];
            return string(result);

        // need to think of non ascii characters case
        } 


// [PASS] test_StringIndex1() (gas: 11935)
// [PASS] test_StringIndex2() (gas: 11936)
// [PASS] test_StringIndex3() (gas: 11915)
    // function main(string memory str, uint256 index) public pure returns (string memory) {
    //     bytes memory b = bytes(str);
    //     require(index < b.length, "Index out of bounds");
    //     return string(abi.encodePacked(b[index]));
    // }

}