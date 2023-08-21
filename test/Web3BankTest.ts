import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers,waffle,loadFixture } from "hardhat";

describe("Lock",async function () {

  async function deployContract(){
    const [owner] = await ethers.getSigners();
    const LockContract = await ethers.getContractFactory("Web3Bank");
    const contract = await LockContract.connect(owner).deploy();
    // const contract = await ethers.deployContract("Web3Bank")


    return {
      contract,
      owner
    }
  }

  it('test',async ()=>{
    const [address0,address1,address2] = await ethers.getSigners();
    const {contract,owner} = await loadFixture(deployContract);
    // const account1 = await contract.connect(owner).openAccount({
    //   value:ethers.utils.formatEther('0.000000000000000020','wei')
    // });

    //  console.log(account1);
    const wei = ethers.parseEther('1','ether');
    const account2 = await contract.connect(owner).openAccount({
      value:wei
    });

    const ownerBalanceBeforeOpeningAccount = await ethers.provider.getBalance(owner.address);
    console.log(ownerBalanceBeforeOpeningAccount);

    
    const depositeAmount = await contract.connect(owner).creaditAmount(owner.address,{
      value:ethers.parseEther('0.000000000000000020','wei')
    });
    // console.log(getAccount)

    const debitAmount = await contract.connect(owner).debitAmount(owner.address,ethers.parseEther('0.000000000000000010','wei'));

    const getAccount = await contract.connect(owner).loginAccount(owner.address);
    console.log(getAccount);


    const ownerBalanceAfterOpeningAccount = await ethers.provider.getBalance(owner.address);
    console.log(ownerBalanceAfterOpeningAccount)
     
      
    // const balance = await contract.connect(owner).getContractBalance();
    // console.log('Contract Balance ---> ',balance);

    // const acccountBal = await contract.connect(owner).getAccountBalance();
    // // console.log(acccountBal);

    console.log(wei);



    // const contractAddress = contract.runner.address;

    // const contractBalanceUsingHardhat = await ethers.provider.getBalance(contractAddress);

    // console.log(contract);
    // console.log(owner.address)
  })

  // it('Account exits',async ()=>{
  //   const {contract,owner}  = await loadFixture(deployContract);
  //   const account2 = await contract.connect(owner).openAccount();

  //   //  console.log(account2)
  // })
});
