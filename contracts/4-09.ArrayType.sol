// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ArrayType {
    uint8[5] sdata;

    uint8[] ddata;

    // 静态数组
    function testStaticAarry () public returns(uint8[5] memory) {
        // 修改数组
        sdata[1] = 10;

        // 读取数组
        // uint8 a = sdata[1];

        return sdata;
    }

    // 动态数组 - Storate - 读取
    function testReadDynamicStorageArray() public view returns(uint8[] memory){
        return ddata;
    }

    // 动态数组 - Storage - 写入
    function testWriteDynamicStorageArray() public {
        ddata.push(10);
        ddata.pop();
        ddata.push(20);
    }

    // 动态数组 - Memory
    function testDynamicMemoryArray(uint8 size) public pure returns(uint8[] memory) {
        uint8[] memory mdata = new uint8[](size);
        return mdata;
    }
}