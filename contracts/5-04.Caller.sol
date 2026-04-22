// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "./5-04.ICallee.sol";

contract Caller {
    address calleeAddress;

    constructor (address addr) {
        calleeAddress = addr;
    }

    function setCalleeA (uint256 c) public {
        ICallee callee = ICallee(calleeAddress);
        callee.setA(c); // 通过 Interface 的方式调用其他合约
    }
}