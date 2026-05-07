// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Logic {
    uint256 public count;

    function increment () external {
        count += 1;
    }
}

contract UnstructuredProxy {
    bytes32 private constant logicPosition = keccak256("org.zeppelinos.proxy.implementation");
    function getLogic () public view returns (address impl){
        bytes32 position = logicPosition;
        assembly {
            impl := sload(position)
        }
    }
    function setLogic (address logic) internal {
        bytes32 position = logicPosition;
        assembly {
            sstore(position, logic)
        }
    }

    function upgradeTo (address logic) public {
        setLogic(logic);
    }

    function delegate (address logic) internal virtual {
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), logic, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return (0, returndatasize())
            }
        }
    }

    fallback () external {
        delegate(getLogic());
    }
}