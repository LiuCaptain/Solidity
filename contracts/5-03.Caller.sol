// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "./5-03.Callee.sol";

contract Caller {
    address calleeAddress;

    constructor (address addr) {
        calleeAddress = addr;
    }

    function setCalleeA (uint256 c) public {
        Callee callee =  Callee(calleeAddress);
        callee.setA(c); // 在不同文件中调用其他合约
    }
}