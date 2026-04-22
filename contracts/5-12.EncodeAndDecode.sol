// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract EncodeAndDecode {
    struct Person {
        string name;
        uint256[2] fractions;
    }

    // 编码
    function encode (
        uint256 x,
        address addr,
        uint256[] calldata arr,
        Person calldata person
    ) external pure returns(bytes memory) {
        return abi.encode(x, addr, arr, person);
    }

    // 解码
    function decode (
        bytes calldata data
    ) external pure returns ( // 命名返回变量
        uint256 x,
        address addr,
        uint256[] memory arr,
        Person memory person
    ) {
      (x, addr, arr, person) =  abi.decode(data, (uint256, address, uint256[], Person));
    }
}