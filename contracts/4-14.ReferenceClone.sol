// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ReferenceClone {
    uint256[] dataOne;
    uint256[] dataTwo;

    // 读取
    function getDataOne () public view returns (uint256[] memory) {
        return dataOne;
    }
    function getDataTwo () public view returns (uint256[] memory) {
        return dataTwo;
    }

    // 修改
    function insertDataOne (uint256 value) public {
        dataOne.push(value);
    }
    function insertDataTwo (uint256 value) public {
        dataTwo.push(value);
    }

    // 赋值
    function setDataTwoToDataOne () public {
        dataOne = dataTwo; // 发生值拷贝
    }
}