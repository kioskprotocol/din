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

    /**
     * @dev Search for DINs with a specific owner.
     * @param owner Address of the owner.
     * @param count Maximum number of DINs to return.
     * @param minDIN Minimum DIN to start search.
     */
    function DINsWithOwner(address owner, uint count, uint minDIN) public view returns (uint[] result) {
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

    /**
     * @dev Search for DINs with a specific resolver.
     * @param owner Address of the resolver.
     * @param count Maximum number of DINs to return.
     * @param minDIN Minimum DIN to start search.
     */
    function DINsWithResolver(address resolver, uint count, uint minDIN) public view returns (uint[] result) {
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