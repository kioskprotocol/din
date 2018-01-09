# DIN

The Decentralized Identification Number (DIN) is an open standard for product identification. A DIN is a globally unique, 10-digit number that can be registered via an Ethereum smart contract called the `DINRegistry`.

## Contracts

**[DINRegistry.sol](./contracts/DINRegistry.sol)**

The DINRegistry records the owner and resolver of each registered DIN.

**Address:**

Ethereum Main Net: [0xd8096aBb6ff38b912Ff7dCebdDcF6bd2bed468BB](https://etherscan.io/address/0xd8096abb6ff38b912ff7dcebddcf6bd2bed468bb#code)

**ABI:**
```
[{"constant":false,"inputs":[{"name":"_resolver","type":"address"}],"name":"selfRegisterDINWithResolver","outputs":[{"name":"_DIN","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_DIN","type":"uint256"}],"name":"resolver","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"index","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_owner","type":"address"},{"name":"_resolver","type":"address"}],"name":"registerDINWithResolver","outputs":[{"name":"_DIN","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_DIN","type":"uint256"},{"name":"_owner","type":"address"}],"name":"setOwner","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_owner","type":"address"}],"name":"registerDIN","outputs":[{"name":"_DIN","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_DIN","type":"uint256"}],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"selfRegisterDIN","outputs":[{"name":"_DIN","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"genesis","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_DIN","type":"uint256"}],"name":"updated","outputs":[{"name":"_timestamp","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_DIN","type":"uint256"},{"name":"_resolver","type":"address"}],"name":"setResolver","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"_genesis","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"DIN","type":"uint256"},{"indexed":true,"name":"owner","type":"address"}],"name":"NewOwner","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"DIN","type":"uint256"},{"indexed":true,"name":"resolver","type":"address"}],"name":"NewResolver","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"DIN","type":"uint256"},{"indexed":true,"name":"owner","type":"address"}],"name":"NewRegistration","type":"event"}]
```

**[DINRegistryUtils.sol](./contracts/DINRegistryUtils.sol)**

DINRegistryUtils offers convenience methods for registering multiple DINs in a single transaction.

**Address:**

Ethereum Main Net: [0x9D4A30eF4e467dC0a635748F09b46caE5Ae27b27](https://etherscan.io/address/0x9D4A30eF4e467dC0a635748F09b46caE5Ae27b27#code)

**ABI:**
```
[{"constant":false,"inputs":[{"name":"resolver","type":"address"},{"name":"amount","type":"uint256"}],"name":"selfRegisterDINsWithResolver","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"owner","type":"address"},{"name":"resolver","type":"address"},{"name":"amount","type":"uint256"}],"name":"registerDINsWithResolver","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"amount","type":"uint256"}],"name":"selfRegisterDINs","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"owner","type":"address"},{"name":"amount","type":"uint256"}],"name":"registerDINs","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"_registry","type":"address"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]
```

## Registration

The `DINRegistry` contains four options to register a new DIN:

* `selfRegisterDIN`
* `selfRegisterDINWithResolver`
* `registerDIN`
* `registerDINWithResolver`

In addition, the `DINRegistryUtils` contract contains convenience methods to register multiple DINs at once since this will likely be a common task:

* `selfRegisterDINs`
* `selfRegisterDINsWithResolver`
* `registerDINs`
* `registerDINsWithResolver`

DINs are registered sequentially on a first-come, first-served basis beginning with the genesis DIN of `1000000000`. Any Ethereum account can register a DIN by calling a registration methods and paying the gas cost of the transaction.

Only approximately 100 DINs can be registered in a single transaction due to Ethereum gas limits. The registry contract was intentionally kept simple in favor of coding around this limitation.

## Resolver

A `Resolver` contract resolves a DIN to an off-chain resource that contains product metadata. A single resolver contract can resolve many DINs.

A `Resolver` must implement the following method, as specified in [EIP165](https://github.com/ethereum/EIPs/issues/165):

`function supportsInterface(bytes4 interfaceID) view returns (bool)`

For now, the off-chain resource should be a URL.

```
Interface ID: 0xaf655719 // bytes4(keccak256("productURL(uint256)"))
function productURL(uint256 DIN) public view returns (string);
```

Product metadata should conform to the schema.org specification for a [Product](http://schema.org/Product).

## Acknowledgements

DIN uses registry and resolver smart contracts based on those implemented by the [Ethereum Name Service (ENS)](https://github.com/ethereum/ens).
