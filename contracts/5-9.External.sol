// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract External {
    address public firstCaller;
    address public secondCaller;
    
    function first () public {
        firstCaller = msg.sender; // EOA 地址
        this.second();
    }

    function second () external{
        secondCaller = msg.sender; // 当前合约地址
    }
}