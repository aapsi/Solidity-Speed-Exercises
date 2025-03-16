// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract Account2 {
    address immutable owner;

    constructor(address _owner) payable {
        owner = _owner;
    }

    function withdraw() external {
        require(msg.sender == owner, "Not owner");
        (bool ok, ) = owner.call{value: address(this).balance}("");
        require(ok);
    }
}

contract AccountMaker {
    function makeAccount(address owner) external payable returns (address) {
        // use create2 to create an account with the owner address
        // the salt should be the owner address
        // the value sent to them should be msg.value
        bytes32 addsalt = bytes32(bytes20(owner));

        // bytes32(bytes20(add)) = 0x5b38da6a701c568545dcfcb03fcb875f56beddc4000000000000000000000000

        // bytes32(uint256(uint160(add))) = 0x0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4

        return address(new Account2{salt: addsalt, value: msg.value}(owner));
    }
}
