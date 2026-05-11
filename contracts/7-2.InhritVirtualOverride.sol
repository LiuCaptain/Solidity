// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

abstract contract Base {
    function foo () internal virtual;
}

contract A is Base {
    function foo () internal override {}
}