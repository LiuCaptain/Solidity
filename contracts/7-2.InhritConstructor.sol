// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract BaseA {
    constructor (string memory name) {}
}
contract A is BaseA("solidity") {
    constructor () {}
}
contract B is BaseA {
    string public name;
    constructor () BaseA(name) {}
}

// 抽象合约不必须被用于继承，但通常会被用于继承
abstract contract BaseB {
    constructor (string storage name) {} // 接收 storage 参数的 constructor，该合约必须设置成 abstract
}
contract C is BaseB {
    string public name;
    constructor () BaseB(name) {}
}