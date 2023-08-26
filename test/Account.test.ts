import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers, loadFixture } from "hardhat";
import { ContractTransaction } from "ethers";

describe("Account Test", async () => {
  async function deployContract() {
    const [owner] = await ethers.getSigners();
    const LockContract = await ethers.getContractFactory("Web3Bank");
    const contract = await LockContract.connect(owner).deploy("Web3Bank");
    // const contract = await ethers.deployContract("Web3Bank")
    return {
      contract,
      owner,
    };
  }

  it("Oppening Account", async () => {
    const { contract } = await loadFixture(deployContract);
    const [address0, address1, address2] = await ethers.getSigners();

    const tx = await contract.connect(address0).openAccount(address0.address, {
      value: ethers.parseEther("20", "ether"),
    });
  });
});
