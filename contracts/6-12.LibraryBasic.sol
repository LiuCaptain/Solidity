// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

library Math {
    function sqrt(uint a) internal pure returns (uint b){
        if (a > 3) {
            b = a;
            uint c = a / 2 + 1;
            while (c < b) {
                b = c;
                c = (a / c + c) / 2;
            }
        } else if (a != 0) {
            b = 1;
        }
    }
}
contract TestMath {
    using Math for uint; // 对某种数据类型进行绑定

    function testSqrt (uint x) public pure returns (uint) {
        return x.sqrt(); // 面向对象的写法
    }
}

library Array {
    modifier ArrayContainMember (uint[] memory arr) {
        require(arr.length > 0, "Can't remove from empty array!");
        _;
    }

    function remove (uint[] storage arr, uint index) public ArrayContainMember(arr) {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}
contract TestArray {
    // using Array for uint[];
    uint[] public arr;

    function testRemove () public {
        for (uint i = 0; i < 3; i ++) {
            arr.push(i);
        }

        Array.remove(arr,1); // 直接引用的写法
        // arr.remove(1)

        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[1] == 2);
    }

    function getMathAddress () public pure returns (address) {
        return address(Math);
    }

    function getArrayAddress () public pure returns (address) {
        return address(Array);
    }
}