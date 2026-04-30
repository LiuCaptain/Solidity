// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract LogicV1 {
    uint256 public placeholder;
    uint256 public count;

    function setVar () external {
        count += 1;
    }
}

contract LogicV2 {
    uint256 public placeholder;
    uint256 public count;

    function setVar () external {
        count += 2;
    }

}

interface Logic {
    function setVar() external;    
}

contract BasicProxy {
    address public logic;
    uint256 public count;

    constructor (address addr) {
        logic = addr;
    }

    fallback () external {
        (bool status,) = logic.delegatecall(msg.data);
        require(status, "Call Failed!");
    }
}