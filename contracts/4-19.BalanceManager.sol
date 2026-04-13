// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract BalanceManger {
    string public name = "Balance Manager";
    string public symbol = "\u03C8"; // ψ
    uint8 public decimals = 4;
    mapping(address => uint256) public balanceOf;
    
    constructor (uint256 amount) {
        balanceOf[msg.sender] = amount;
    }

    function transfer (address to, uint256 amount) public {
        uint256 fb = balanceOf[msg.sender];
        uint256 tb = balanceOf[to];
        require(amount <= fb, "Insufficient Balance!");

        fb -= amount;
        tb += amount;

        balanceOf[msg.sender] = fb;
        balanceOf[to] = tb;
    }
}

// account 1： 0x3b11ed78c98D249648b9262d806E74AFCAf9b7cD
// account 2： 0x2ad99498D90c835EAd930427042bd0953B036F6a