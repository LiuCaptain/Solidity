// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract AssembyBasic {
    function addBySolidity (uint256 x, uint256 y) public pure returns (uint256) {
        return x + y;
    }

    function loopBySolidity (uint256 n) public pure returns (uint256 result)  {
        for (uint256 i = 0; i < n; i ++) {
            result += i;
        }
    }

    function addByAssembly (uint256 x, uint256 y) public pure returns (uint256) {
        assembly {
            let result := add(x, y)
            let fm := mload(0x40)
            mstore(fm, result)
            return(fm, 32)
        }
    }

    function loopByAssembly (uint256 n) public pure returns (uint256 result) {
        assembly {
            for { let i := 0 } lt (i, n) {}
        }
    }
}