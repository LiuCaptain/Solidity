// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Callee {
    uint256 public a;

    function setA (uint256 b) public {
        a = b;
    }
}

contract Caller {
    address calleeAddress;
    
    constructor (address addr) {
        calleeAddress = addr;
    }

    function setCalleeA (uint256 c) public {
        Callee collee = Callee(calleeAddress);
        collee.setA(c); // 在同一个文件中调用其他合约
    }
}