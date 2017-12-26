const DINRegistry = artifacts.require("DINRegistry.sol");
const DINRegistryUtils = artifacts.require("DINRegistryUtils.sol");
const StandardResolver = artifacts.require("StandardResolver.sol");
const genesis = 1000000000;

module.exports = async (deployer, network, accounts) => {
    const merchant = accounts[0];

    // Deploy DINRegistry
    deployer.deploy(DINRegistry, genesis).then(async () => {
        // Deploy DINRegistryUtils
        await deployer.deploy(DINRegistryUtils, DINRegistry.address);
        // Deploy Resolver
        await deployer.deploy(StandardResolver);
    });
};