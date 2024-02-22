require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
const ALCHEMY_API_KEY = "L_ntEghTGnxs6jMZJBtp8r3oODPJdTPE";

const ALCHEMY_PRIVATE_KEY = "87af2e04beb86e2d93f128d3816c966a8f3e821e7b3f5f9816b453a6c0328b81";
module.exports = {
  solidity: "0.8.24",
  networks: {
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY}`,
      accounts: [`${ALCHEMY_PRIVATE_KEY}`] 
    }
  }
};
