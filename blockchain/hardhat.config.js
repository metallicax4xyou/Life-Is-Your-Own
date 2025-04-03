<<<<<<< HEAD
=======
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config(); // Load variables from .env file

// Check if environment variables are loaded
const amoyRpcUrl = process.env.AMOY_RPC_URL;
const privateKey = process.env.PRIVATE_KEY;

if (!amoyRpcUrl) {
  console.warn("Missing AMOY_RPC_URL in .env file. Deployment to Amoy might fail.");
}
if (!privateKey) {
  console.warn("Missing PRIVATE_KEY in .env file. Deployment to Amoy might fail.");
}


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9", // Make sure this matches the pragma in GameItem.sol
  networks: {
    hardhat: {
      // Config for local testing network
    },
    amoy: {
      url: amoyRpcUrl || "", // Use loaded variable
      accounts: privateKey ? [privateKey] : [], // Use loaded variable
      chainId: 80002 // Chain ID for Polygon Amoy
    }
  },
  // Optional etherscan config
  // etherscan: {
  //   apiKey: process.env.POLYGONSCAN_API_KEY
  // }
};
>>>>>>> 21a288d1f2e7c7c76369cf14af20d0e137baf966
