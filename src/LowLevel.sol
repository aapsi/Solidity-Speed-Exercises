// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;
interface IFoo {
    function foo() external;
}

contract LowLevel {

    // [PASS] test_LowLevelRevert() (gas: 14741)
    // [PASS] test_LowLevelSuccess() (gas: 14725)
    function main(address a) public returns (bool) {
        // call function "foo()" on address a
        // do not use an interface, use a low level call
        // return true if the call succeeded
        // return false if the call failed
        (bool ok, ) = a.call(abi.encodeWithSignature("foo()"));
        return ok;
        // bonus challenge: use an interface and a high level call to accomplish the same task
    }

    // [PASS] test_LowLevelRevert() (gas: 14515)
    // [PASS] test_LowLevelSuccess() (gas: 14495)
    function main2(address a) public returns (bool) {
        try IFoo(a).foo() {
            return true;
        } catch {
            return false;
        }
    }
}
