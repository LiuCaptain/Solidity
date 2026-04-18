// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "./5-4.ICallee.sol";

contract Callee is ICallee {
    uint256 public a;
    
    function setA (uint256 b) public {
        a = b;
    }
}