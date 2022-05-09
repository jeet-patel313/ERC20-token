const { expect } = require("chai");
const { BigNumber } = require('ethers');
const { ethers } = require("hardhat");

let ErcContract;
let hardhatToken;
let totalBalance;
let addr1;
let addr2;
let addr3;
let addrs;
let addr1Account;
let addr1Balance;
let addr2Account;
let addr2Balance;
let addr3Account;
let addr3Balance;
let tokenAlloted;

beforeEach(async function() {
    [addr1, addr2, addr3, ...addrs] = await ethers.getSigners();

    ErcContract = await ethers.getContractFactory('ErcContract');

    hardhatToken = await ErcContract.deploy();
});

describe('Custom ERC20 Token', function () {
    it('Total supply of token on the deployed address must be 100 million', async function() {
        expect(await hardhatToken.totalSupply()).to.equal(BigNumber.from(100000000).mul(BigNumber.from(10).pow(18)));
    });

    // test the pre-sale function 
    it('Testing pre-sale i.e. 10 ether = 2,500,000 ERT tokens', async function() {
        tokenAlloted = 0;
        // take 1 ether from addr1 and call the sale function
        let sale = await hardhatToken.saleEvent({
            value: BigNumber.from(10).mul(BigNumber.from(10).pow(18))
            }); 

        // get the 'balance' from balance
        addr1Balance = await hardhatToken.balanceOf(addr1.address);
        
        expect(ethers.utils.formatUnits(addr1Balance, 18)).to.equal('2500000.0');
    });

    // test the seed-sale function
    // it('Testing seed-sale', async function() {
    //     expect();
    // });

    // test the public-sale function
    // it('Testing public-sale', async function() {
    //     expect();
    // });

    // test the transfer function
    // it('Testing transfer function', async function() {
    //     expect();
    // });
});