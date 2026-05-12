// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract A {
    uint256 public x = 5;

    constructor () {}
}

contract B is A {
    constructor () {
        x += 10;
    }
}

contract C is A {
    constructor () {
        x *= 5;
    }
}

contract D is B, C {
    constructor () {}
}
// C3 线性化结果：A -> B -> C -> D
// 所以上面多重合约继承中，构造函数执行顺序也是 A -> B -> C -> D，最后 x 为 75