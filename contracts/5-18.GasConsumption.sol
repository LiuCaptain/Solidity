// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract GasConsumption {
    uint256 public i;
    uint256 public remainingOne;
    uint256 public remainingTwo;
    uint256 public remainingThree;
    uint256 public remainingFour;

    function forever () public {
        while (true) { // 进入 while 循环前的准备工作也会消耗 gas
            if (i == 100) return;
            if (i == 10) remainingOne = gasleft(); // 212675
            if (i == 70) remainingTwo =  gasleft(); // 130680
            if (i == 80) remainingThree = gasleft(); // 98485
            if (i == 90) remainingFour = gasleft(); // 66290
            i ++;
        }
    }
}