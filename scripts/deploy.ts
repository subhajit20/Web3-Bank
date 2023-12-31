import { ethers } from "hardhat";

async function main() {
  const currentTimestampInSeconds = Math.round(Date.now() / 1000);
  const unlockTime = currentTimestampInSeconds + 60;

  const lockedAmount = ethers.parseEther("0.001");

  const lock = await ethers.deployContract("Web3Bank");

  const contract = await lock.waitForDeployment();
  const deployedContractAddress = contract.target;
  console.log(deployedContractAddress);
}
//0x5FbDB2315678afecb367f032d93F642f64180aa3
// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
