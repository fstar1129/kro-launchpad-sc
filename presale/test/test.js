const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("NFT functions testing", function() {
  before(async () => {
    AirNFT = await ethers.getContractFactory("NFT");
    airNFT = await AirNFT.deploy();
    instance = airNFT.deployed();
    [...accounts] = await ethers.getSigners();

    console.log("NFT deployed to:", airNFT.address);
    tx1 = await airNFT.connect(accounts[0]).mint('999', accounts[1].address, 100);
    tx2 = await airNFT.connect(accounts[0]).mint('998', accounts[2].address, 200);
    tx3 = await airNFT.connect(accounts[0]).mint('997', accounts[3].address, 300);

  });

  it("Should return the balance if it's minted", async function() {
    expect(await airNFT.balanceOf(accounts[1].address)).to.equal(1);
    expect(await airNFT.balanceOf(accounts[2].address)).to.equal(1);
    expect(await airNFT.balanceOf(accounts[3].address)).to.equal(1);

  });

  it("Should return it can be possible to buy", async function() {
    expect(await airNFT.price(1)).to.equal(100);

    const tokenId1 = await tx1.wait();
    const mintEvent = tokenId1.events.find(event => event.event ==='Minted');
    const {nftID} = mintEvent.args;

    await airNFT.connect(accounts[4]).buy(nftID,{ value: 400});
    expect(await airNFT.balanceOf(accounts[4].address)).to.equal(1);
  });

  it("Should return the price need to be updated and check updated", async function() {
    expect(await airNFT.price(2)).to.equal(200);

    const tokenId2 = await tx2.wait();
    const mintEvent = tokenId2.events.find(event => event.event ==='Minted');
    const {nftID} = mintEvent.args;

    await airNFT.connect(accounts[2]).updatePrice(nftID, 500);
    expect(await airNFT.price(2)).to.equal(500);
  })

  it("Should return listedMap", async function() {
    expect(await airNFT.listedMap(3)).to.equal(true);

    const tokenId3 = await tx3.wait();
    const mintEvent = tokenId3.events.find(event => event.event ==='Minted');
    const {nftID} = mintEvent.args;

    await airNFT.connect(accounts[3]).updateListingStatus(nftID, false);
    expect(await airNFT.listedMap(3)).to.equal(false);
  });


});