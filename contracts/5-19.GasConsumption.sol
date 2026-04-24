// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract GasCollee {
    uint256 public i;
    function forever () public { // gas 消耗：152301
        while (true) {
            if (i == 100) return;
            i ++;
        }
    }
}

// 静态调用
contract GasCollerOne {
    GasCollee gasCollee; // 合约类型
    constructor (GasCollee _gasCollee) { // 合约类型进行传参；可以传递地址，但会在背后发生类型转换
        gasCollee = _gasCollee;
    }
    function callGasColleeForver () public { // 实际消耗 26380
        gasCollee.forever{gas: 5 * 10000}();
    }
}

// 动态调用
contract GasColleeTwo {
    address gasColleeAddress;
    constructor (address addr) {
        gasColleeAddress = addr;
    }
    event DataLog (string message);
    function callGasColleeForver () public {
        bytes memory data = abi.encodeWithSignature("forever()");
        (bool status,) = gasColleeAddress.call{gas: 5 * 10000}(data);
        if (status) {
            emit DataLog("Call Success!");
        } else {
            revert("Call Failed!");
        }
    }
}