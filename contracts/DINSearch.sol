pragma solidity ^0.4.17;

import "./DINRegistry.sol";

/** @title Search DINRegistry */
contract DINSearch {

    DINRegistry public registry;
    uint256 public genesis = 1000000000;

    // Constructor
    function DINSearch(DINRegistry _registry) public {
        registry = _registry;
    }

    function DINsWithOwner(address owner, uint count, uint minDIN) public view returns (uint[]) {
        uint min = minDIN > genesis ? minDIN : genesis;
        uint max = registry.index();
        uint[] memory DINs = new uint[](count);
        uint i = 0;
        for (uint j = min; j < max; j++) {
            if (registry.owner(j) == owner) {
                DINs[i] = j;
                if (i == count - 1) {
                    break;
                }
                i++;
            }
        }
        return DINs;
    }

    function DINsWithResolver(address resolver, uint count, uint minDIN) public view returns (uint[]) {
        uint min = minDIN > genesis ? minDIN : genesis;
        uint max = registry.index();
        uint[] memory DINs = new uint[](count);
        uint i = 0;
        for (uint j = min; j < max; j++) {
            if (registry.resolver(j) == resolver) {
                DINs[i] = j;
                if (i == count - 1) {
                    break;
                }
                i++;
            }
        }
        return DINs;
    }

}