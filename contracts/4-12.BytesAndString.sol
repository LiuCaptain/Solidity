// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract BytesAndyString {
    // 初始化方式 - 字面量
    string strOne = "strOne";
    bytes bytOne = "bytOne";

    // 初始化方式 - new 操作符
    // string str = new string(5);
    // bytes byt = new bytes(5);

    function testBytesAndString () public returns(bytes memory) {
        string memory strTwo = "strTwo";
        bytes memory bytTwo = "bytTwo";

        // 不同 location 的拷贝
        strOne = strTwo;
        bytOne = bytTwo;

        // 强制类型转换
        bytTwo = bytes(strTwo);
        strTwo = string(bytTwo);

        // 动态字节数组的修改和访问
        bytTwo[0] = 0x88;
        // bytes1 b = bytTwo[0];
        
        return bytTwo;
    }
}