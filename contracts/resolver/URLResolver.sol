pragma solidity ^0.4.17;

import "./Resolver.sol";

/** @title Resolver contract that specifies an API endpoint where product information can be retrieved */
contract URLResolver is Resolver {
    function productURL(uint256 DIN) public view returns (string);
}