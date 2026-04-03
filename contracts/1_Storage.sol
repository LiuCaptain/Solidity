// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract BaseType {
    function testInt () public pure  returns (uint){
        // uint8 a = 255;
        // uint256 max = type(uint256).max;
        
        uint8 a = 8;
        uint16 b = 16;
        a = uint8(b);

        return a;
    }
}