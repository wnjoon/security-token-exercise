const ERC20Token = artifacts.require('./tokens/ERC20Token.sol');

module.exports = async function (deployer, network, accounts) {
  if (network == "test") return; // test maintains own contracts
  
  await deployer.deploy(ERC20Token, 'ERC20Token', 'GNR', 1);
  console.log('\n   > ERC20 token deployment: Success -->', ERC20Token.address);
};
