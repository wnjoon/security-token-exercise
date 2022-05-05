const ERC721Token = artifacts.require('./tokens/ERC721Token.sol');

module.exports = async function (deployer, network, accounts) {
  if (network == "test") return; // test maintains own contracts
  
  await deployer.deploy(ERC721Token, 'ERC721Token', 'NFT', "", "");
  console.log('\n   > ERC721 token deployment: Success -->', ERC721Token.address);
};
