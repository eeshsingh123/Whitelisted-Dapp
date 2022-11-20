const { ethers } = require("hardhat");

async function main() {
  const whitelistContract = await ethers.getContractFactory("Whitelist"); // getContractFactory is an abstraction used to deploy new Smart Contracts
  // everything inside the deploy() will be the params needed to initialize the Smart contract
  const deployedWhitelistContract = await whitelistContract.deploy(10); // 10 is the _maximumWhitelistAddressess param passed in the constructor.
  // wait for it to finish deploying
  await deployedWhitelistContract.deployed();

  //print address of deployed contract
  console.log(
    "Whitelist Contract Address: ",
    deployedWhitelistContract.address
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
