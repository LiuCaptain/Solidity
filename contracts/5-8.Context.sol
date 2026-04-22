// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Callee {
    uint256 public x;
    address public caller;
    address public eoaAddress;
    uint256 public blockTimestamp;

    function setX (uint256 y) public  {
        x = y;
        caller = msg.sender;
        eoaAddress = tx.origin;
        blockTimestamp = block.timestamp;
    }
}

contract Caller {
    address calleeAddress;
    address public caller;
    address public eoaAddress;
    uint256 public blockTimestamp;

    constructor (address addr) {
        calleeAddress = addr;
    }

    function setCalleeX (uint256 a) public {
        Callee callee = Callee(calleeAddress);
        callee.setX(a);
        caller = msg.sender;
        eoaAddress = tx.origin;
        blockTimestamp = block.timestamp;
    }
}