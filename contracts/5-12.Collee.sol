// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Collee {
    uint256 public x;

    function setX (uint256 y, uint256 z) public returns (uint256){
        return x = y + z;
    }
}