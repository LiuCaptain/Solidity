// SPDX-License-Identifier: GPL-3.0
// 将外部账号通过 ”At Address“ 重载成 SendEther 合约实例进行测试边界性问题

pragma solidity >=0.7.0 <0.9.0;

contract ReceiveEther {
    string public typeText;

    // 不具备收款能力
    function deposit () public {}

    function getBalance () public view returns (uint256) {
        return address(this).balance;
    }

    // 专门用于负责收款，必须要具备收款能力
    receive () external payable {
        typeText = "receive";
    }
    
    // 兜底函数，是否具备收款能力是可选的
    fallback () external payable {
        typeText = "fallback";
    }
}

contract SendEther {
    // 收到即刻转出
    function sendByTransfer (address payable to) public payable {
        to.transfer(msg.value); // transfer 如果执行出现异常，交易会自动终止
    }
    function sendBaySend (address payable to) public payable {
        bool status = to.send(msg.value); // 需要处理 send 的返回值来决定是否终止交易
        require(status, "Failed to send Ether!");
    }
    function sendByCall (address payable to) public payable  {
        (bool status,) = to.call{value: msg.value}(""); // 需要处理 call 的返回值来决定是否终止交易
        require(status, "Failed to send Ether!");
    }

    // 先收再转出
    uint256 public depositAmount;
    function deposit () public payable  {
        depositAmount += msg.value;
    }
    function sendTo (address payable to, uint256 amount) public {
        (bool status,) = to.call{value: amount}("");
        require(status, "Failed to send Ether!");
    }

    // send 和 transfer 的底层实现
    function mySend (address addr, uint256 amount) public returns(bool) {
        (bool status,) = addr.call{ gas: 2300, value: amount }("");
        return status;
    }
    function myTransfer (address addr, uint256 amount) public {
        (bool status,) = addr.call{ gas: 2300, value: amount }("");
        require(status, "Call failed!");
    }
}