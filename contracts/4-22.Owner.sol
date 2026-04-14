// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Owner {
    address private owner;

    event OwnerSet (address indexed oldOwner, address indexed newOwner);

    modifier IsOwner () {
        require(msg.sender == owner, "Caller is not owner!");
        _;
    }

    constructor () {
        owner = msg.sender;
        emit OwnerSet(address(0), msg.sender);
    }

    // 更改所有者
    function changeOwner (address newOwner) public IsOwner  {
        require(newOwner != address(0), "New owner should not be the zero address");
        emit OwnerSet(owner, newOwner);
        owner = newOwner;
    }

    // 读取所有者
    function getOwner() external view returns (address) {
        return owner;
    }
}