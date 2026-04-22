// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Caller {
    address calleeAddress;
    uint256 public a;

    constructor (address addr) {
        calleeAddress = addr;
    }

    function setColleeX (uint256 b, uint256 c) public returns (uint256 d) {
        bytes memory data = abi.encodeWithSignature("setX(uint256,uint256)", b, c);
        (bool status, bytes memory result) = calleeAddress.call(data);
        if (status) {
            (d) = abi.decode(result, (uint256));
            a = d;
            return d;
        } else {
            revert("Call Error!");
        }
    }
}