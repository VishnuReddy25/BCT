// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Arraylength {
    uint[] public integers;
    
    constructor() {
        integers = [1, 2, 3, 4, 5];
    }
    
    function getArray() public view returns (uint[] memory) {
        return integers;
    }
    
    function getArrayLength() public view returns (uint) {
        return integers.length;
    }
}
