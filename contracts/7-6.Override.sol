// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract A {
    function foo () public virtual {}

    function bar () public virtual {}
}

contract B is A {
    function foo () public virtual override {}

    function bar () public virtual override {}
}

contract C is A {
    function foo () public virtual override {}
}

contract D is B, C {
    function foo () public override(B, C) {} // 继承 B 和 C 合约的 foo 函数需要显式 override

    function bar () public override(B, A) {} // 继承 B 和 A 合约的 foo 函数需要显式 override
}
// 多重合约继承中，如果子合约从多个父合约继承到了同一函数的多个实现，则必须显式对该函数进行 override，以消除继承歧义
// C3 线性化结果：D -> C -> B -> A
