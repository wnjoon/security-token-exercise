import { ethers } from "hardhat";
import { expect } from "chai";


import ERC20TokenArtifact from "../artifacts/contracts/ERC20Burnable.sol/ERC20Burnable.json";
import { ERC20Burnable } from "../typechain-types/ERC20Burnable";

const { deployContract } = waffle;

describe("ERC20BurnableToken", () => {
    let erc20Token: ERC20Burnable;

    // const provider = waffle.provider;
    // const [user1, user2] = provider.getWallets()
    const [user1, user2] = await ethers();


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
    })

    context('Deploy ERC20Burnable.sol', async () => {
        it('has given data', async () => {
            expect(await erc20Token.name()).to.be.equal("ERC20BurnableToken")
            expect(await erc20Token.symbol()).to.be.equal("E2B")
            expect(await erc20Token.decimals()).to.be.equal(0)
        })

        it('Should set the right owner', async () => {
            expect(await erc20Token.owner()).to.be.equal(user1.address);
        })

        it('check balance is 0', async() => {
            expect(await erc20Token.balanceOf(user1.address)).to.be.equal(0)
        })

        it('mint tokens', async() => {
          await erc20Token.mint(user1.address, 10000)
          expect(await erc20Token.balanceOf(user1.address)).to.be.equal(10000)
          expect(await erc20Token.balanceOf(user2.address)).to.be.equal(0)
        })

        it('transfer token from user1 to user2', async() => {
          // await erc20Token.transfer(user2.address, 1000)
          // expect(await erc20Token.balanceOf(user1.address)).to.be.equal(9000)
          // expect(await erc20Token.balanceOf(user1.address)).to.be.equal(1000)
        })
    })
})