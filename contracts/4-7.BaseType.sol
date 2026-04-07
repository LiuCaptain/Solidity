// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract BaseType {
    // 测试整数
    function testInteger () public pure  returns (uint) {
        uint8 i8 = 200;
        i8 ++;

        // 获取最大值
        uint256 max = type(uint256).max;

        // 强制类型转换
        uint8 a = 8;
        uint16 b = 16;
        a = uint8(b);
        return max;
    }

    // 测试枚举
    enum OrderState  {
        layorder,
        payment,
        complete
    }
    function testEnum () public pure returns (OrderState) {
        OrderState a = OrderState.complete;
        return  a;
    }
}