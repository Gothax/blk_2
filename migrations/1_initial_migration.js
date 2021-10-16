const Migrations = artifacts.require("Migrations");  //take contract and put them on the blockchain

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
