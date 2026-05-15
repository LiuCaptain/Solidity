// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract A {
    event Log(string message);

    function bar () public virtual {
        emit Log("A bar called!");
    }
}

contract B is A {
    function bar () public virtual override {
        emit Log("B bar called!");
        super.bar();
    }
}

contract C is A {
    function bar () public virtual override {
        emit Log("C bar called!");
        super.bar();
    }
}

contract D is B, C {
    function bar() public override (B, C) {
        super.bar();
    }
}
// C3 线性化序列结果：A -> B -> C -> D
// 多重合约继承中，`super` 是线性序列化输出的序列中当前合约的前驱合约，所以D中的super是C，C中的super是B，B中的super是A

contract E is C, B {
    function bar() public override (B, C) {
        super.bar();
    }
}
// C3 线性化序列结果：A -> C -> B -> E
// 所以E中的super是B，B中的super是C，C中super是A