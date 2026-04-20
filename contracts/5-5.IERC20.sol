// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface IERC20 {
    function name () external view returns (string memory);
    function symbol () external view returns (string memory);
    function decimals () external view returns (uint8);
}

// USDT 主网合约地址：0xdAC17F958D2ee523a2206206994597C13D831ec7
// 使用方式：通过 Remix 部署菜单中的“At address”按钮将合约地址重载成对应合约的实例