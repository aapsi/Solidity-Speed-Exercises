// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

interface IRare {
    function rare(uint256 x, uint256 y) external;
}

contract LowLevelArgs2 {
    function main2(address a, uint256 x, uint256 y) public {
        // call rare(x, y) using a low-level call
        // if the low level call reverts, revert also
        (bool ok, ) = a.call(abi.encodeWithSignature("rare(uint256,uint256)", x, y));
        require(ok, "reverted");

        // bonus challenge: use an interface and a high level call to accomplish the same task
    }

    function main(address a, uint256 x, uint256 y) public {
        IRare(a).rare(x ,y);
    }
}