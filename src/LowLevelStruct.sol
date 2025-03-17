// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

interface ICall {
    struct S {
        uint256 a;
        uint256 b;
    }
    function point() external returns (S memory);


}

contract LowLevelStruct {
    function main(address a) public returns (uint256 x, uint256 y) {
        // call function "point()" on address a
        // do not use an interface
        // point() returns a struct with two uint256 fields, i.e. 
        // struct Point {
        //     uint256 x;
        //     uint256 y;
        // }
        // return the two fields
        // revert if the low level call reverts
        (bool ok, bytes memory data) = a.call(abi.encodeWithSignature("point()"));
        require(ok, "reverted");
        ICall.S memory s = abi.decode(data, (ICall.S));
        return (s.a, s.b);

        // bonus challenge: use an interface and a high level call to accomplish the same task
    }

    function main2(address a) public returns (uint256 x, uint256 y) {
        ICall.S memory s2 = ICall(a).point();
        return (s2.a, s2.b);
    }

}   