// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;
contract SapStorage {
    // State variable
    uint256 public Number;
    // Events
    event SetNumber(uint256 Number);
    // Functions
    function setNumber(uint256 _Number) public {
        Number = _Number;
        emit SetNumber(Number);
    }
    function getNumber() public view returns (uint256) {
        return Number;
    }
}