// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface INotIsCallee {
    function setA (uint256 b) external;
}

contract NotIsCaller {
    address notIsCalleeAddress;

    constructor (address addr) {
        notIsCalleeAddress = addr;
    }

    function setCalleeA (uint c) public {
        INotIsCallee notIsCallee = INotIsCallee(notIsCalleeAddress);
        notIsCallee.setA(c);
    }
}