import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers,loadFixture } from "hardhat";

describe("Lock",async function () {

  async function deployContract(){
    const [owner] = await ethers.getSigners();
    const LockContract = await ethers.getContractFactory("Web3Bank");
    const contract = await LockContract.connect(owner).deploy('Web3Bank');
    // const contract = await ethers.deployContract("Web3Bank")


    return {
      contract,
      owner
    }
  }

  it('Openning account',async ()=>{
    const {contract,owner} = await loadFixture(deployContract);
    const [address0,address1,address2] = await ethers.getSigners();
  
    /**
     * Opening Account
     */
    const wei = ethers.parseEther('1','ether');

    await contract.connect(owner).openAccount({
      value:wei
    });

    /**
     * Openningaccount
     */

    const myWeb3BankAccount = await contract.connect(owner).loginAccount(owner.address);
    console.log(myWeb3BankAccount)

    // const account3 = await contract.connect(address2).openAccount({
    //   value:wei
    // });
    // await contract.connect(owner).creaditAmount(owner.address,{
    //   value:ethers.parseEther('5','ether')
    // });

    // const ownerBalanceBeforeOpeningAccount = await ethers.provider.getBalance(owner.address);
    // console.log(ownerBalanceBeforeOpeningAccount);

    /**
     * Creaditing amount 
     */

    // await contract.connect(owner).transfer(owner.address,address2.address,{
    //   value:ethers.parseEther('1','ether')
    // })

    // await contract.connect(address2).transfer(address2.address,owner.address,{
    //   value:ethers.parseEther('1','ether')
    // })
    // console.log(getAccount)

    // const debitAmount = await contract.connect(owner).debitAmount(owner.address,ethers.parseEther('1','ether'));
    // const debitAmount = await contract.connect(owner).debitAmount(owner.address,ethers.parseEther('1','ether'));
   

    // const address2Account = await contract.connect(address2).loginAccount(address2.address);
    
    // console.log(address2Account);


    // const ownerBalanceAfterOpeningAccount = await ethers.provider.getBalance(owner.address);
    // console.log(ownerBalanceAfterOpeningAccount)
     
      
    // const balance = await contract.connect(owner).getContractBalance();
    // console.log('Contract Balance ---> ',balance);

    // const acccountBal = await contract.connect(owner).getAccountBalance();
    // // console.log(acccountBal);

    // console.log(wei);



    // const contractAddress = contract.runner.address;

    // const contractBalanceUsingHardhat = await ethers.provider.getBalance(contractAddress);

    // console.log(contract);
    // console.log(owner.address)
  })

  it('Storing eth to the account after creating',async ()=>{
    const {contract,owner}  = await loadFixture(deployContract);
    const [address0,address1,address2] = await ethers.getSigners();


    /**
     * Opening Account
     */
    const wei = ethers.parseEther('1','ether');

    await contract.connect(address0).openAccount({
      value:wei
    });

     /**
     * Before storing eth
     */
    const bforeStoringEth = await contract.connect(address0).loginAccount(owner.address);
    console.log(bforeStoringEth);


    /**
     * After storing eth
     */
    await contract.connect(address0).creaditAmount(address0.address,{
      value:ethers.parseEther('10','ether')
    });

    const afterStoringEth = await contract.connect(address0).loginAccount(address0.address);
    console.log(afterStoringEth);
  });
  it('Debiting amount from the account',async()=>{
    const {contract,owner}  = await loadFixture(deployContract);
    const [address0,address1,address2] = await ethers.getSigners();

    /**
     * Opening Account
     */
    const wei = ethers.parseEther('15','ether');

    await contract.connect(address0).openAccount({
      value:wei
    });

    const beforeDebitWalletBalance = await ethers.provider.getBalance(address0.address);
    console.log('Before debiting amount',beforeDebitWalletBalance)

    const contractBalance = await contract.connect(address0).getContractBalance();
    console.log('Balance',contractBalance);

    await contract.connect(address0).debitAmount(address0.address,ethers.parseEther('5','ether'));


    const contractBalance1 = await contract.connect(address0).getContractBalance();
    console.log('Balance',contractBalance1);

    const afterDebitWalletBalance = await ethers.provider.getBalance(address0.address);
    console.log('After debiting amount',afterDebitWalletBalance)


    const account = await contract.connect(address0).loginAccount(address0.address);
    console.log(account);

  });

  it('One to One transfer',async()=>{
    const {contract,owner}  = await loadFixture(deployContract);
    const [address0,address1,address2] = await ethers.getSigners();

    /**
     * Opening Account
     */
    const wei = ethers.parseEther('10','ether');

    await contract.connect(address0).openAccount({
      value:wei
    });

  })
});
