// SPDX-License-Identifier: GPL 3.0 
pragma solidity >= 0.8.0;
contract BasicCalculator {
    uint256 private result;

    constructor() {
        result = 0;
    }

    modifier validInput(uint256 x, uint256 y) {
        require(x >= 0 && y >= 0, "Inputs must be equal or greater than zero");
        _;
    }

    function add(uint256 x, uint256 y) public validInput(x, y) {
        result = x + y;
    }

    function subtract(uint256 x, uint256 y) public validInput(x, y) {
        result = x - y;
    }

    function multiply(uint256 x, uint256 y) public validInput(x, y) {
        result = x * y;
    }

    function divide(uint256 x, uint256 y) public validInput(x, y) {
        require(y != 0, "Division by zero is not allowed");
        result = x / y;
    }

    function getResult() public view returns (uint256) {
        return result;
    }
}