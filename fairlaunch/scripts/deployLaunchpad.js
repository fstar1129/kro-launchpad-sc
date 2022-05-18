// We require the Hardhat Runtime Environment explicitly here. This is optional 
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile 
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // const KRONOSLOCK = await hre.ethers.getContractFactory("KronosLock");
  // const KronosLock = await KRONOSLOCK.deploy();

  // await KronosLock.deployed();
  // const LOCKER = await hre.ethers.getContractFactory("Locker");
  // const locker = await LOCKER.deploy();

  // await locker.deployed();
  
  // console.log("Contract deployed to:", locker.address);
 //Mainnet
  const _lockAddress = "0x86c068136ee3A34e8B962D1249522485F581d4dB";
  //testnet
  // const _lockAddress = "0xceB1870317303cfcC12748c1B2c93a71dDaE6a4e";

  const POOLFACTORY = await hre.ethers.getContractFactory("PoolFactory");
  const PoolFactory = await POOLFACTORY.deploy(_lockAddress);

  await PoolFactory.deployed();

  console.log("Contract deployed to:", PoolFactory.address);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
