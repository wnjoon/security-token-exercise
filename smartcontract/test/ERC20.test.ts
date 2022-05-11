import { waffle } from "hardhat";
import { expect, use } from "chai";


import ERC20TokenArtifact from "../artifacts/contracts/ERC20Burnable.sol/ERC20Burnable.json";
import { ERC20Burnable } from "../typechain-types/ERC20Burnable";

const { deployContract } = waffle;
const provider = waffle.provider;


describe("ERC20BurnableToken", function() {
    let erc20Token: ERC20Burnable;
    const provider = waffle.provider;

    const [user1, user2, user3] = provider.getWallets()
    console.log(user1.address)
    console.log(user2.address)
    console.log(user3.address)

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

    context('Deploy ERC20Burnable.sol', async () => {
        context('Deploy ERC20Burnable.sol22', async () => {
            it('has given data', async () => {
                expect(await erc20Token.name()).to.be.equal("ERC20BurnableToken")
                expect(await erc20Token.symbol()).to.be.equal("E2B")
                expect(await erc20Token.decimals()).to.be.equal(0)
            })
        })

        it('Should set the right owner', async () => {
            expect(await erc20Token.owner()).to.be.equal(user1.address);
        })

        it('Total supply is 10000', async () => {
            expect(await erc20Token.totalSupply()).to.be.equal(10000)
        })

        it('check balance is 10000', async() => {
            expect(await erc20Token.balanceOf(user1.address)).to.be.equal(10000)
        })

        it('transfer token from user1 to user2', async() => {
            await erc20Token.transfer(user2.address, 1000);
            expect(await erc20Token.balanceOf(user1.address)).to.be.equal(9000)
            expect(await erc20Token.balanceOf(user2.address)).to.be.equal(1000)
        })
    })
})