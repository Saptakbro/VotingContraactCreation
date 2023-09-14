// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.8.0;
contract SaptakGetterFunctions {
    function getUintValue() public pure returns (uint) {
        return 100;
    }
    function getAddressValue() public pure returns (address) {
        return 0x1234567890ABCDEF01234567890ABCDEF01234567;
    }
    function getStringValue() public pure returns (string memory) {
        return "Hello, saptak!";
    }
}