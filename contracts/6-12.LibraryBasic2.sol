// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

library TransferOperation {
    function transfer (
        address from,
        address to,
        uint256 amount,
        mapping(address => uint256) storage balanceOf
    ) public {
        uint256 fb = balanceOf[from];
        require(fb  < amount, "Insufficient Balance!");
        uint256 tb = balanceOf[to];

        fb -= amount;
        tb += amount;

        balanceOf[from] = fb; // 操作账本 
        balanceOf[to] = tb;
    }
}

contract BalanceManager {
    mapping(address => uint256) balanceOf;

    function transfer (address to, uint256 amount) external {
        TransferOperation.transfer(msg.sender, to, amount, balanceOf);
    }
}