// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract StorageLayout {
    struct Person {
        uint256 amount; // 32字节 | slot2
        address sender; // 20字节 | slot3
        bool[12] success; // 12字节，slot3
        uint256 id; // 32字节 | slot4
    }

    uint256 amount; // slot0
    address sender; // slot1
    Person person; // slot2、slot3、slot4
    bool[12] success; // slot5
    uint256 id; // slot6
}