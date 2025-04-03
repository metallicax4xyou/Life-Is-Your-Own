const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("GameItemModule", (m) => {
  // Define deployment parameters if needed (none for this simple contract)
  // const initialOwner = m.getAccount(0); // Example: Get deployer address

  // Deploy the GameItem contract
  const gameItem = m.contract("GameItem", []); // Pass constructor arguments in the array if needed

  console.log("GameItem contract deployment defined in module.");

  // Return the deployed contract instance so Ignition knows what was deployed
  return { gameItem };
});
