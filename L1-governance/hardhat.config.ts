import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-waffle";
// import "@typechain/hardhat";

// import file with Göerli params
const goerli = require("./goerli.json");

module.exports = {
  solidity: {
    version: "0.8.9"},
  networks: {
      // Göerli network
      goerli: {
        url: goerli.nodeUrl,
        accounts: [goerli.deployerPrivateKey],
      },
    },
  };