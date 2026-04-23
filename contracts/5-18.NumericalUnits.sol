// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract NumericalUnits {
    uint256 public oneWei = 1 wei;
    bool public isOneWei = 1 wei == 1;

    uint256 public oneEther = 1 ether;
    bool public isOneEther = 1 ether == 1e18; // 1e18 = 1 × 10^18
}