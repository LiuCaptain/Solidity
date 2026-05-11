// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract A {
    string private aa;
    string internal bb;
    string public cc;

    event Event();

    modifier Modifier() {
        _;
    }

    function foo () private {}
    function bar () internal {}
    function baz () public {}
}

contract B is A {
    string private aa; // private 的同名成员变量可以在父子合约中同时出现，internal、public 则不允许
    // string private bb;
    // string public cc;

    // event Event(); // 同名的 event 不能在父子合约中同时出现

    // modifier Modifier () { // 同名的 modifier 不能在父子合约中同时出现
    //     _;
    // }
    
    // function foo () private {} // private、internal、public 的同名成员函数不能在父子合约中同时出现
    // function bar () internal {}
    // function baz () public {}
}