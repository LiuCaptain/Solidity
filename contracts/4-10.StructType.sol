// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract StructType {
    struct Home {
        string country;
        string province;
        string city;
    }

    struct Person {
        string name;
        uint8 age;
        Home home;
    }

    Person master;

    // Struct 类型 - 读取
    function testReadStruct () public view returns(Person memory) {
        return master;
    }

    // Struct 类型 - 写入
    function testWrite (Person calldata p) public {
        master = p;
    }
    function testWriteName (string calldata name) public {
        master.name = name;
    }

    // Struct 类型 - Memory 写入
    function testWriteMemory () public pure returns (Person memory) {
        Person memory p; // 不需要初始化
        p.name = "DaNiu";
        p.age = 18;
        return p;
    }
    // Struct 类型 - Storage 写入
    function testWriteStorage () public returns (Person memory) {
        Person storage p = master; // 局部的 Struct 类型的 storage 变量需要初始化
        p.name = "TieZhu";
        p.age = 20;
        return p;
    }
}