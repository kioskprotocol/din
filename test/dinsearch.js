const DINSearch = artifacts.require("DINSearch.sol");
const DINRegistry = artifacts.require("DINRegistry.sol");
const DINRegistryUtils = artifacts.require("DINRegistryUtils.sol");
const chai = require("chai"),
    expect = chai.expect;

contract("DINSearch", accounts => {
    const alice = accounts[1];
    const resolver = "0x1111111111111111111111111111111111111111";

    before(async () => {
        search = await DINSearch.deployed();
        registry = await DINRegistry.deployed();
        utils = await DINRegistryUtils.deployed();
        await utils.registerDINsWithResolver(alice, resolver, 50);
    });

    it("should have the correct registry", async () => {
        const searchRegistry = await search.registry();
        expect(searchRegistry).to.equal(registry.address);
    });

    it("should return the correct DINs by owner", async () => {
        const count = 25;
        const DINs = await search.DINsWithOwner(alice, count, 0);
        expect(DINs.length).to.equal(25);
        expect(DINs[24].toNumber()).to.equal(1000000025);
    });

    it("should return the correct DINs by resolver", async () => {
        const count = 25;
        const DINs = await search.DINsWithResolver(resolver, count, 0);
        expect(DINs.length).to.equal(25);
        expect(DINs[24].toNumber()).to.equal(1000000025);
    });

    it("should search with a minimum DIN", async () => {
        const count = 10;
        const minDIN = 1000000010;
        const ownerDINs = await search.DINsWithOwner(alice, count, minDIN);
        expect(ownerDINs.length).to.equal(10);
        expect(ownerDINs[9].toNumber()).to.equal(1000000019);

        const resolverDINs = await search.DINsWithResolver(
            resolver,
            count,
            minDIN
        );
        expect(resolverDINs.length).to.equal(10);
        expect(resolverDINs[9].toNumber()).to.equal(1000000019);
    });
});