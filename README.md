# DIN

The Decentralized Identification Number (DIN) is an open standard for product identification. A DIN is a globally unique, 10-digit number that can be registered via an Ethereum smart contract called the `DINRegistry`.

## Contracts

**[DINRegistry.sol](./contracts/DINRegistry.sol)**

```
Address (Ethereum Main Net): 0xd8096aBb6ff38b912Ff7dCebdDcF6bd2bed468BB
ABI:
[{"constant":false,"inputs":[{"name":"_resolver","type":"address"}],"name":"selfRegisterDINWithResolver","outputs":[{"name":"_DIN","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_DIN","type":"uint256"}],"name":"resolver","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"index","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_owner","type":"address"},{"name":"_resolver","type":"address"}],"name":"registerDINWithResolver","outputs":[{"name":"_DIN","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_DIN","type":"uint256"},{"name":"_owner","type":"address"}],"name":"setOwner","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_owner","type":"address"}],"name":"registerDIN","outputs":[{"name":"_DIN","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_DIN","type":"uint256"}],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"selfRegisterDIN","outputs":[{"name":"_DIN","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"genesis","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_DIN","type":"uint256"}],"name":"updated","outputs":[{"name":"_timestamp","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_DIN","type":"uint256"},{"name":"_resolver","type":"address"}],"name":"setResolver","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"_genesis","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"DIN","type":"uint256"},{"indexed":true,"name":"owner","type":"address"}],"name":"NewOwner","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"DIN","type":"uint256"},{"indexed":true,"name":"resolver","type":"address"}],"name":"NewResolver","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"DIN","type":"uint256"},{"indexed":true,"name":"owner","type":"address"}],"name":"NewRegistration","type":"event"}]
```

**[DINRegistryUtils.sol](./contracts/DINRegistryUtils.sol)**

```
Address (Ethereum Main Net): 0x9D4A30eF4e467dC0a635748F09b46caE5Ae27b27
ABI:
[{"constant":false,"inputs":[{"name":"resolver","type":"address"},{"name":"amount","type":"uint256"}],"name":"selfRegisterDINsWithResolver","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"owner","type":"address"},{"name":"resolver","type":"address"},{"name":"amount","type":"uint256"}],"name":"registerDINsWithResolver","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"amount","type":"uint256"}],"name":"selfRegisterDINs","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"owner","type":"address"},{"name":"amount","type":"uint256"}],"name":"registerDINs","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"_registry","type":"address"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]
```

## Registration

The `DINRegistry` contains four methods to register a new DIN:

* `selfRegisterDIN`
* `selfRegisterDINWithResolver`
* `registerDIN`
* `registerDINWithResolver`

In addition, the `DINRegistryUtils` contract contains convenience methods to register multiple DINs at once since this will likely be a common task:

* `selfRegisterDINs`
* `selfRegisterDINsWithResolver`
* `registerDINs`
* `registerDINsWithResolver`

Only approximately 100 DINs can be registered in a single transaction due to Ethereum gas limits. The registry contract was intentionally kept simple in favor of coding around this limitation.
