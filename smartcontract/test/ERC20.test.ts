import { waffle } from "hardhat";
import { expect } from "chai";


import ERC20TokenArtifact from "../artifacts/contracts/ERC20Burnable.sol/ERC20Burnable.json";
import { ERC20Burnable } from "../typechain-types/ERC20Burnable";

const { deployContract } = waffle;
const provider = waffle.provider;


describe("ERC20BurnableToken", function() {
    console.log("Test ERC20Burnable.sol")

    let erc20Token: ERC20Burnable;
    const provider = waffle.provider;
    const [user1, user2, user3] = provider.getWallets()
    
    //before
    beforeEach(async () => {
      erc20Token = await deployContract(
          user1,
          ERC20TokenArtifact,
          [
              "ERC20BurnableToken",
              "E2B",
              0
          ]
      ) as ERC20Burnable;
      await erc20Token.mint(user1.address, 10000)
    })

    context('ERC20Burnable Token', async () => {
        it('1. Check deployed contract information', async () => {
            expect(await erc20Token.name()).to.be.equal("ERC20BurnableToken")
            expect(await erc20Token.symbol()).to.be.equal("E2B")
            expect(await erc20Token.decimals()).to.be.equal(0)
            
            expect(await erc20Token.owner()).to.be.equal(user1.address);
            expect(await erc20Token.totalSupply()).to.be.equal(10000)
            expect(await erc20Token.balanceOf(user1.address)).to.be.equal(10000)
        })
        it('2. Transfer token from user1 to user2', async() => {
            await erc20Token.transfer(user2.address, 1000)
            expect(await erc20Token.balanceOf(user1.address)).to.be.equal(9000)
            expect(await erc20Token.balanceOf(user2.address)).to.be.equal(1000)
            await expect(erc20Token.transfer(user2.address, 10000)).to.be.revertedWith('transfer amount exceeds balance.')
        })
        it('3. Transfer token from user2 to user3 by user1', async() => {
            await erc20Token.transfer(user2.address, 1000)
            await erc20Token.connect(user2).transfer(user3.address, 400)
            await erc20Token.connect(user2).approve(user1.address, 100)
            await erc20Token.connect(user1).transferFrom(user2.address, user3.address, 100)
            // await erc20Token.approve(user1.address, 400);
            // await erc20Token.connect(user1.address);
            // await erc20Token.transferFrom(user2.address, user3.address, 400);
            expect(await erc20Token.balanceOf(user1.address)).to.be.equal(9000)
            expect(await erc20Token.balanceOf(user2.address)).to.be.equal(500)
            expect(await erc20Token.balanceOf(user3.address)).to.be.equal(500)
        })
        it('4. Pause token', async() => {
            await erc20Token.transfer(user2.address, 1000)
            await erc20Token.connect(user1).pause()
            expect(await erc20Token.paused()).to.be.equal(true)
            await erc20Token.connect(user2).approve(user1.address, 100)
            await expect(erc20Token.connect(user1).transferFrom(user2.address, user3.address, 100)).to.be.revertedWith('contract is paused.')
            await erc20Token.connect(user1).unPause()
            await erc20Token.connect(user1).transferFrom(user2.address, user3.address, 100)
            expect(await erc20Token.balanceOf(user3.address)).to.be.equal(100)
            // expect(await erc20Token.connect(user1).transfer(user2.address, 100)).to.be.revertedWith('contract is paused.')
        })
        it('5. Burn token', async() => {
            await erc20Token.transfer(user2.address, 1000)
            await expect(erc20Token.burn(10000)).to.be.revertedWith('burn amount exceeds balance.')
            await erc20Token.burn(8000)
            expect(await erc20Token.balanceOf(user1.address)).to.be.equal(1000)
        })
    })
})