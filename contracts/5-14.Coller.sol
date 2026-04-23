// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Coller {
    uint256 public a;
    address colleeAddress;

    constructor (address addr) {
        colleeAddress = addr;
    }

    event BytesLog (bytes data);

    function setColleeX (uint256 b, uint256 c) public returns (uint256 d) {
        bytes memory data = abi.encodeWithSignature("setY(uint256,uint256)", b, c);
        (bool status, bytes memory result) = colleeAddress.call(data);
        emit BytesLog(result);
        if (status) {
            // (d) = abi.decode(result, (uint256));
            // a = d;
        } else {
            revert("Call Error!");
        }
    }
}