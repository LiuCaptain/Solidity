// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Base {
    // visibility
    function foo () internal virtual {} // internal
    function uoo () internal virtual {}

    function baz () external virtual {} // external
    function bar () external virtual {}

    function roo () public virtual {} // public

    // mutability
    function wdd () public pure virtual {} // pure

    function too () public view virtual {} // view
    function hoo () public view virtual {}

    function acc () public virtual {} // 普通
    function bcc () public virtual {}
    function ccc () public virtual {}
}

contract A is Base {
    // visibility
    function foo () internal override {} // internal
    // function uoo () public override {}

    function baz () external override {} // external
    function bar () public  override {}

    function roo () public override {} // public

    // mutability
    function wdd () public pure override {} // pure

    function too () public pure override {} // view
    function hoo () public view override {}

    function acc () public pure override {} // 普通
    function bcc () public view override {}
    function ccc () public override {}
}