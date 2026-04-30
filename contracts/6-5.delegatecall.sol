// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract  Callee {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVar (uint256 _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract Caller {
    uint256 public num;
    address public sender;
    uint256 public value;

    // constructor (address addr) {

    // }

    function setVars (address addr, uint _num) public payable {
        bytes memory data = abi.encodeWithSignature("setVar(uint256)", _num);
        (bool status,) = addr.delegatecall(data);
        require(status, "Call failed!");
    } 
}