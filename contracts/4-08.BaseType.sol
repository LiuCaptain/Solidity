// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract BaseType {
    // 地址类型 - 账号地址
    function testAddressAccount () public view returns (address) {
        address addr = msg.sender;
        return addr;
    }

    // 地址类型 - 合约地址
    function testAddressContract () public view returns (address) {
        address addr = address(this);
        return  addr;
    }

    // 合约类型
    function testContract () public view returns (BaseType){
        BaseType a = this;
        return a;
    }

    // 定长字节数组
    function testFixedByteArray () public pure returns (bytes1) {
        bytes3 data = 0x222222;
        bytes1 a =  data[0];
        return a;
    }
}