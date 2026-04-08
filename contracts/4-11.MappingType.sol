// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MappingType {
    mapping (string => uint8) ages;
    mapping (string => uint8) public fraction; // 公共 mapping 类型
    mapping (string => mapping(string => uint8)) public height; // 嵌套 mapping 类型

    
    function setAgeMapping (string calldata key, uint8 age) public  {
        ages[key] = age;
    }

    function getAgeMapping (string calldata key) public view returns (uint8)  {
        mapping (string => uint8) storage _ages = ages;
        return _ages[key];
    }
}