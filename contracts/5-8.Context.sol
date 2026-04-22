// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Callee {
    uint256 public x;
    address public caller;
    address public eoaAddress;

    function setX (uint256 y) public  {
        x = y;
        caller = msg.sender;
        eoaAddress = tx.origin;
    }
}

contract Caller {
    address calleeAddress;
    address public caller;
    address public eoaAddress;

    constructor (address addr) {
        calleeAddress = addr;
    }

    function setCalleeX (uint256 a) public {
        Callee callee = Callee(calleeAddress);
        callee.setX(a);
        caller = msg.sender;
        eoaAddress = tx.origin;
    }
}