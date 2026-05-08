// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

library Math {
    function sqrt(uint a) internal pure returns (uint b){
        if (a > 3) {
             b = a;
            uint x = a / 2 + 1;
            while (x < b) {
                b = x;
                x = (a / x + x) / 2;
            }
        } else if (a != 0) {
            b = 1;
        }
    }
}

contract TestSafeMath {
    using Math for uint;

    
}

library Array {

}