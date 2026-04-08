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

    
}